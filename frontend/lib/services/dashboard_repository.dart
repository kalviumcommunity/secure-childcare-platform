enum UserRole {
  parent,
  staff,
  admin,
}

class DashboardSnapshot {
  final String headline;
  final String subheadline;
  final int childrenPresent;
  final int alerts;
  final int checkIns;
  final List<ChildProfileData> children;
  final List<NoticeData> notices;
  final List<TimelineEventData> timeline;
  final List<QuickActionData> quickActions;

  const DashboardSnapshot({
    required this.headline,
    required this.subheadline,
    required this.childrenPresent,
    required this.alerts,
    required this.checkIns,
    required this.children,
    required this.notices,
    required this.timeline,
    required this.quickActions,
  });
}

class ChildProfileData {
  final String name;
  final String room;
  final String status;
  final String detail;
  final bool isCheckedIn;

  const ChildProfileData({
    required this.name,
    required this.room,
    required this.status,
    required this.detail,
    required this.isCheckedIn,
  });
}

class NoticeData {
  final String title;
  final String detail;
  final int colorValue;
  final int iconCodePoint;

  const NoticeData({
    required this.title,
    required this.detail,
    required this.colorValue,
    required this.iconCodePoint,
  });
}

class TimelineEventData {
  final String title;
  final String detail;

  const TimelineEventData({required this.title, required this.detail});
}

class QuickActionData {
  final String title;
  final String subtitle;
  final int iconCodePoint;

  const QuickActionData({
    required this.title,
    required this.subtitle,
    required this.iconCodePoint,
  });
}

class DashboardRepository {
  // final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<DashboardSnapshot> loadDashboard(UserRole role) async {
    return seed(role);
  }

  DashboardSnapshot seed(UserRole role) {
    return _seed(role);
  }


  DashboardSnapshot _seed(UserRole role) {
    final List<ChildProfileData> children = <ChildProfileData>[
      const ChildProfileData(
        name: 'Emma Johnson',
        room: 'Sunflower Room',
        status: 'Checked In',
        detail: 'Arrived at 8:14 AM',
        isCheckedIn: true,
      ),
      const ChildProfileData(
        name: 'Noah Patel',
        room: 'Rainbow Room',
        status: 'Checked In',
        detail: 'Arrived at 8:02 AM',
        isCheckedIn: true,
      ),
      const ChildProfileData(
        name: 'Mia Carter',
        room: 'Star Room',
        status: 'Not Arrived',
        detail: 'Expected by 9:00 AM',
        isCheckedIn: false,
      ),
    ];

    final List<NoticeData> notices = <NoticeData>[
      const NoticeData(
        title: 'Health Check Reminder',
        detail: 'Please complete today\'s wellness check before 9:30 AM.',
        colorValue: 0xFFFFF3CD,
        iconCodePoint: 0xE155,
      ),
      const NoticeData(
        title: 'Pickup Time Updated',
        detail: 'Noah: Authorized pickup moved to 5:30 PM.',
        colorValue: 0xFFE8F4FF,
        iconCodePoint: 0xE8B8,
      ),
    ];

    final List<TimelineEventData> timeline = <TimelineEventData>[
      const TimelineEventData(
        title: '08:40 AM · Snack Logged',
        detail: 'Emma Johnson had fruit and yogurt.',
      ),
      const TimelineEventData(
        title: '10:10 AM · Learning Activity',
        detail: 'Rainbow Room completed shape matching.',
      ),
      const TimelineEventData(
        title: '11:35 AM · Parent Message',
        detail: 'Pickup authorized contact updated for Noah.',
      ),
      const TimelineEventData(
        title: '12:05 PM · Rest Time Started',
        detail: 'Sunflower Room children moved to nap routine.',
      ),
    ];

    final List<QuickActionData> quickActions = _actionsForRole(role);

    return DashboardSnapshot(
      headline: _headline(role),
      subheadline: _subheadline(role),
      childrenPresent: children.where((item) => item.isCheckedIn).length,
      alerts: notices.length,
      checkIns: children.where((item) => item.isCheckedIn).length,
      children: children,
      notices: notices,
      timeline: timeline,
      quickActions: quickActions,
    );
  }


  List<QuickActionData> _actionsForRole(UserRole role) {
    switch (role) {
      case UserRole.parent:
        return <QuickActionData>[
          const QuickActionData(
            title: 'Pickup Pass',
            subtitle: 'Share one-time code',
            iconCodePoint: 0xE41C,
          ),
          const QuickActionData(
            title: 'Message Staff',
            subtitle: 'Fast updates',
            iconCodePoint: 0xE0C9,
          ),
          const QuickActionData(
            title: 'Daily Summary',
            subtitle: 'View child progress',
            iconCodePoint: 0xE873,
          ),
        ];
      case UserRole.staff:
        return <QuickActionData>[
          const QuickActionData(
            title: 'Secure Check-In',
            subtitle: 'Fast entry',
            iconCodePoint: 0xE8E8,
          ),
          const QuickActionData(
            title: 'Medication',
            subtitle: '1 due now',
            iconCodePoint: 0xE548,
          ),
          const QuickActionData(
            title: 'Parent Chat',
            subtitle: '2 new',
            iconCodePoint: 0xE0C9,
          ),
        ];
      case UserRole.admin:
        return <QuickActionData>[
          const QuickActionData(
            title: 'Attendance Board',
            subtitle: 'Live overview',
            iconCodePoint: 0xE85E,
          ),
          const QuickActionData(
            title: 'Incident Log',
            subtitle: 'Review alerts',
            iconCodePoint: 0xE002,
          ),
          const QuickActionData(
            title: 'Staff Schedule',
            subtitle: 'Shift planner',
            iconCodePoint: 0xE8B5,
          ),
        ];
    }
  }

  String _headline(UserRole role) {
    switch (role) {
      case UserRole.parent:
        return 'Parent Dashboard';
      case UserRole.staff:
        return 'Staff Dashboard';
      case UserRole.admin:
        return 'Admin Dashboard';
    }
  }

  String _subheadline(UserRole role) {
    switch (role) {
      case UserRole.parent:
        return 'Live child updates, pickup control, and direct communication.';
      case UserRole.staff:
        return 'Fast check-in tools, room activity, and instant alerts.';
      case UserRole.admin:
        return 'Operational overview, staffing, and safety insights.';
    }
  }
}
