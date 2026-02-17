import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TaskService {
  final CollectionReference tasks =
      FirebaseFirestore.instance.collection('tasks');

  // Add a new task
  Future<void> addTask(String title) {
    return tasks.add({
      'title': title,
      'createdAt': Timestamp.now(), // Store server timestamp
      'isCompleted': false,
    });
  }

  // Get a stream of tasks (Real-time updates)
  Stream<QuerySnapshot> getTasks() {
    return tasks.orderBy('createdAt', descending: true).snapshots();
  }

  // Update a task completion status
  Future<void> toggleTaskCompletion(String docId, bool currentStatus) {
    return tasks.doc(docId).update({'isCompleted': !currentStatus});
  }
  
  // Delete a task
  Future<void> deleteTask(String docId) {
    return tasks.doc(docId).delete();
  }
}

// Example UI Widget consuming the Stream
class TaskList extends StatelessWidget {
  final TaskService _taskService = TaskService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _taskService.getTasks(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Something went wrong'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        final docs = snapshot.data!.docs;

        return ListView.builder(
          itemCount: docs.length,
          itemBuilder: (context, index) {
            Map<String, dynamic> data =
                docs[index].data()! as Map<String, dynamic>;
            String docId = docs[index].id;

            return ListTile(
              title: Text(data['title']),
              leading: Checkbox(
                value: data['isCompleted'] ?? false,
                onChanged: (bool? value) {
                  _taskService.toggleTaskCompletion(docId, data['isCompleted']);
                },
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => _taskService.deleteTask(docId),
              ),
            );
          },
        );
      },
    );
  }
}
