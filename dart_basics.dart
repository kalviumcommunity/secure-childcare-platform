// Step 3: Learn the Dart Language Essentials

class Student {
  String name;
  int age;

  // Constructor
  Student(this.name, this.age);

  // Method
  void introduce() {
    print('Hi, I’m $name and I’m $age years old.');
  }
}

void main() {
  // Creating an object of Student
  var s1 = Student('Aanya', 20);
  
  // Calling method
  s1.introduce();
  
  // Demonstrating Type Inference and Null Safety
  String? optionalName; // Nullable type
  print(optionalName); // Prints null
  
  var inferredString = "Dart is cool"; // Inferred as String
  print(inferredString);
}
