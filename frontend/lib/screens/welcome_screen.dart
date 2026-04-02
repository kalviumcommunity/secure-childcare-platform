import 'package:flutter/material.dart';

import '../services/dashboard_repository.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final DashboardRepository _repository = DashboardRepository();
  UserRole _role = UserRole.staff;
  int _selectedIndex = 0;
  late Future<DashboardSnapshot> _snapshotFuture;

  bool _dailyDigestEnabled = true;
  bool _instantAlertsEnabled = true;
  bool _pickupCodeEnabled = false;

  @override
  void initState() {
    super.initState();
    _snapshotFuture = _repository.loadDashboard(_role);
  }

  void _reloadDashboard() {
    setState(() {
      _snapshotFuture = _repository.loadDashboard(_role);
    });
  }

  void _onNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onRoleChanged(UserRole value) {
    setState(() {
      _role = value;
      _selectedIndex = 0;
    });
    _reloadDashboard();
  }

  void _toggleDigest(bool value) {
    setState(() => _dailyDigestEnabled = value);
  }

  void _toggleAlerts(bool value) {
    setState(() => _instantAlertsEnabled = value);
  }

  void _togglePickupCode(bool value) {
    setState(() => _pickupCodeEnabled = value);
  }

  void _showActionMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
    );
  }

  Color _surfaceColor(BuildContext context) {
    return Theme.of(context).colorScheme.surface;
  }

  Color _mutedTextColor(BuildContext context) {
    return Theme.of(context).colorScheme.onSurfaceVariant;
  }

  Widget _buildHeader(BuildContext context, DashboardSnapshot snapshot) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[scheme.primary, scheme.primaryContainer],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: <Widget>[
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.14),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(Icons.shield_outlined, color: Colors.white),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    snapshot.headline,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    snapshot.subheadline,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.86),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () => _showActionMessage('Notifications checked.'),
              icon: const Icon(Icons.notifications_none, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleSwitcher() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: <Widget>[
        _RoleChip(
          label: 'Parent',
          selected: _role == UserRole.parent,
          onSelected: () => _onRoleChanged(UserRole.parent),
        ),
        _RoleChip(
          label: 'Staff',
          selected: _role == UserRole.staff,
          onSelected: () => _onRoleChanged(UserRole.staff),
        ),
        _RoleChip(
          label: 'Admin',
          selected: _role == UserRole.admin,
          onSelected: () => _onRoleChanged(UserRole.admin),
        ),
      ],
    );
  }

  List<Widget> _buildQuickActions(BuildContext context, DashboardSnapshot snapshot) {
    return snapshot.quickActions
        .map(
          (QuickActionData action) => _ActionCard(
            icon: IconData(action.iconCodePoint, fontFamily: 'MaterialIcons'),
            title: action.title,
            subtitle: action.subtitle,
            onTap: () => _showActionMessage('${action.title} opened.'),
          ),
        )
        .toList();
  }

  Widget _buildStats(BuildContext context, DashboardSnapshot snapshot) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final bool compact = constraints.maxWidth < 700;
        final int columns = compact ? 2 : 4;
        final List<_StatData> stats = <_StatData>[
          _StatData(label: 'Present', value: '${snapshot.childrenPresent}'),
          _StatData(label: 'Check-ins', value: '${snapshot.checkIns}'),
          _StatData(label: 'Alerts', value: '${snapshot.alerts}'),
          _StatData(label: 'Role', value: _roleLabel(_role)),
        ];

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: stats.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: compact ? 1.25 : 1.6,
          ),
          itemBuilder: (BuildContext context, int index) {
            final _StatData stat = stats[index];
            return Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: _surfaceColor(context),
                borderRadius: BorderRadius.circular(16),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 14,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    stat.value,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    stat.label,
                    style: TextStyle(color: _mutedTextColor(context)),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildNoticeSection(BuildContext context, DashboardSnapshot snapshot) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Today\'s Notices',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 10),
        for (final NoticeData notice in snapshot.notices)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(notice.colorValue),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    IconData(notice.iconCodePoint, fontFamily: 'MaterialIcons'),
                    color: const Color(0xFF0A3D62),
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          notice.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF0A3D62),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          notice.detail,
                          style: const TextStyle(color: Color(0xFF0A3D62)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildChildrenSection(BuildContext context, DashboardSnapshot snapshot) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Children Status',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 10),
        for (final ChildProfileData child in snapshot.children)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: _surfaceColor(context),
                borderRadius: BorderRadius.circular(14),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: const Color(0xFFE8F4FF),
                    child: Text(
                      child.name.substring(0, 1),
                      style: const TextStyle(
                        color: Color(0xFF0A3D62),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          child.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          child.room,
                          style: TextStyle(color: _mutedTextColor(context)),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          child.detail,
                          style: TextStyle(color: _mutedTextColor(context)),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: child.isCheckedIn
                              ? const Color(0xFFDDF8E8)
                              : const Color(0xFFFFE8E8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          child.status,
                          style: TextStyle(
                            color: child.isCheckedIn
                                ? const Color(0xFF1B7A46)
                                : const Color(0xFF9A3030),
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildHomeTab(BuildContext context, DashboardSnapshot snapshot) {
    return RefreshIndicator(
      onRefresh: () async => _reloadDashboard(),
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 20),
        children: <Widget>[
          _buildRoleSwitcher(),
          const SizedBox(height: 14),
          _buildStats(context, snapshot),
          const SizedBox(height: 18),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final bool wide = constraints.maxWidth > 700;
              final List<Widget> actions = _buildQuickActions(context, snapshot);
              if (wide) {
                return Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: actions
                      .map(
                        (Widget action) => SizedBox(
                          width: (constraints.maxWidth - 20) / 3,
                          child: action,
                        ),
                      )
                      .toList(),
                );
              }
              return Column(
                children: <Widget>[
                  for (final Widget action in actions) ...<Widget>[
                    action,
                    const SizedBox(height: 10),
                  ],
                ],
              );
            },
          ),
          const SizedBox(height: 8),
          _buildNoticeSection(context, snapshot),
          const SizedBox(height: 16),
          _buildChildrenSection(context, snapshot),
        ],
      ),
    );
  }

  Widget _buildActivityTab(BuildContext context, DashboardSnapshot snapshot) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 20),
      children: snapshot.timeline
          .map(
            (TimelineEventData event) => _TimelineCard(
              title: event.title,
              subtitle: event.detail,
            ),
          )
          .toList(),
    );
  }

  Widget _buildProfileTab(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 20),
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: _surfaceColor(context),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                _roleLabel(_role),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Role-aware dashboard with offline fallback and live Firebase support.',
                style: TextStyle(color: _mutedTextColor(context)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SwitchListTile(
          value: _dailyDigestEnabled,
          onChanged: _toggleDigest,
          title: const Text('Daily digest notifications'),
          subtitle: const Text('Receive end-of-day summary at 6:00 PM'),
          tileColor: _surfaceColor(context),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        const SizedBox(height: 8),
        SwitchListTile(
          value: _instantAlertsEnabled,
          onChanged: _toggleAlerts,
          title: const Text('Instant safety alerts'),
          subtitle: const Text('Critical updates for incidents and health'),
          tileColor: _surfaceColor(context),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        const SizedBox(height: 8),
        SwitchListTile(
          value: _pickupCodeEnabled,
          onChanged: _togglePickupCode,
          title: const Text('Require one-time pickup code'),
          subtitle: const Text('Extra verification for authorized pickups'),
          tileColor: _surfaceColor(context),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        const SizedBox(height: 12),
        _SettingsCard(
          title: 'Firebase-ready data layer',
          subtitle:
              'If Firestore data exists, this screen loads it automatically; otherwise it uses local demo data.',
          icon: Icons.cloud_done_outlined,
        ),
        const SizedBox(height: 10),
        _SettingsCard(
          title: 'Accessibility friendly',
          subtitle:
              'High-contrast palette, larger tap targets, and dark mode support through the system theme.',
          icon: Icons.accessibility_new_outlined,
        ),
      ],
    );
  }

  String _roleLabel(UserRole role) {
    switch (role) {
      case UserRole.parent:
        return 'Parent Access';
      case UserRole.staff:
        return 'Staff Access';
      case UserRole.admin:
        return 'Admin Access';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DashboardSnapshot>(
      future: _snapshotFuture,
      builder: (BuildContext context, AsyncSnapshot<DashboardSnapshot> state) {
        if (state.connectionState == ConnectionState.waiting && !state.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state.hasError) {
          return Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Icon(Icons.error_outline, size: 56),
                    const SizedBox(height: 12),
                    const Text(
                      'Unable to load dashboard',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'The app will still run offline, but live Firebase data could not be loaded.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: _mutedTextColor(context)),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _reloadDashboard,
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        final DashboardSnapshot snapshot = state.data ?? _repository.seed(_role);
        return Scaffold(
          body: Column(
            children: <Widget>[
              _buildHeader(context, snapshot),
              Expanded(
                child: IndexedStack(
                  index: _selectedIndex,
                  children: <Widget>[
                    _buildHomeTab(context, snapshot),
                    _buildActivityTab(context, snapshot),
                    _buildProfileTab(context),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: NavigationBar(
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onNavTap,
            destinations: const <NavigationDestination>[
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.event_note_outlined),
                selectedIcon: Icon(Icons.event_note),
                label: 'Activity',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline),
                selectedIcon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}

class _RoleChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onSelected;

  const _RoleChip({
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => onSelected(),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ActionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: <Widget>[
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F4FF),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, color: const Color(0xFF0E6BA8)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: const TextStyle(color: Color(0xFF6E7F92)),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}

class _TimelineCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const _TimelineCard({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
          const SizedBox(height: 4),
          Text(subtitle, style: const TextStyle(color: Color(0xFF6E7F92))),
        ],
      ),
    );
  }
}

class _SettingsCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const _SettingsCard({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(icon, color: const Color(0xFF0E6BA8)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(color: Color(0xFF6E7F92)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatData {
  final String label;
  final String value;

  const _StatData({required this.label, required this.value});
}
