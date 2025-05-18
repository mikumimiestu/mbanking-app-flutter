import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 0.5, curve: Curves.easeInOut),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.95, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.5, 1, curve: Curves.easeOutBack),
      ),
    );

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 0.5,
          ),
        ),
        centerTitle: true,
        backgroundColor: isDarkMode ? Colors.grey[900] : Colors.indigo[200],
        elevation: 0,
        // shape: const RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        // ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 24),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color:
                              isDarkMode
                                  ? Colors.indigo[400]!
                                  : Colors.indigo[800]!,
                          width: 3,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey[200],
                        backgroundImage: const NetworkImage(
                          'https://i.pinimg.com/736x/ce/0a/a4/ce0aa48f676de171d21a634d45a40946.jpg',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color:
                            isDarkMode
                                ? Colors.indigo[700]
                                : Colors.indigo[800],
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isDarkMode ? Colors.grey[800]! : Colors.white,
                          width: 2,
                        ),
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Mikumiestu',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'ZAKI MUSHTHAFA BILLAH',
                  style: TextStyle(
                    fontSize: 16,
                    color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Chip(
                    backgroundColor:
                        isDarkMode ? Colors.indigo[900] : Colors.indigo[50],
                    label: Text(
                      'Prioritas',
                      style: TextStyle(
                        color:
                            isDarkMode
                                ? Colors.indigo[200]
                                : Colors.indigo[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    avatar: Icon(
                      Icons.verified,
                      color:
                          isDarkMode ? Colors.indigo[200] : Colors.indigo[800],
                      size: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    shadowColor: Colors.black.withOpacity(0.1),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Column(
                        children: [
                          _buildListTile(
                            icon: Icons.person_outline,
                            title: 'Personal Data',
                            subtitle: 'Update your personal information',
                            onTap: () {},
                            isDarkMode: isDarkMode,
                          ),
                          const Divider(height: 1, indent: 16),
                          _buildListTile(
                            icon: Icons.lock_outline,
                            title: 'Security',
                            subtitle: 'Change password and security settings',
                            onTap: () {},
                            isDarkMode: isDarkMode,
                          ),
                          const Divider(height: 1, indent: 16),
                          _buildListTile(
                            icon: Icons.credit_card,
                            title: 'Payment Methods',
                            subtitle: 'Manage your cards and accounts',
                            onTap: () {},
                            isDarkMode: isDarkMode,
                          ),
                          const Divider(height: 1, indent: 16),
                          _buildListTile(
                            icon: Icons.notifications_outlined,
                            title: 'Notifications',
                            subtitle: 'Configure notification preferences',
                            onTap: () {},
                            isDarkMode: isDarkMode,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    shadowColor: Colors.black.withOpacity(0.1),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Column(
                        children: [
                          _buildListTile(
                            icon: Icons.help_outline,
                            title: 'Help Center',
                            subtitle: 'Get help with your account',
                            onTap: () {},
                            isDarkMode: isDarkMode,
                          ),
                          const Divider(height: 1, indent: 16),
                          _buildListTile(
                            icon: Icons.settings_outlined,
                            title: 'Settings',
                            subtitle: 'Appearance and preferences',
                            onTap: () {},
                            isDarkMode: isDarkMode,
                          ),
                          const Divider(height: 1, indent: 16),
                          _buildListTile(
                            icon: Icons.info_outline,
                            title: 'About App',
                            subtitle: 'Version 1.0.0',
                            onTap: () {},
                            isDarkMode: isDarkMode,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: const BorderSide(color: Colors.red),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Sign Out',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
    required bool isDarkMode,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.indigo[900] : Colors.indigo[50],
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isDarkMode ? Colors.indigo[200] : Colors.indigo[800],
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: isDarkMode ? Colors.white : Colors.grey[800],
        ),
      ),
      subtitle:
          subtitle != null
              ? Text(
                subtitle,
                style: TextStyle(
                  color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                  fontSize: 12,
                ),
              )
              : null,
      trailing: Icon(
        Icons.chevron_right,
        color: isDarkMode ? Colors.grey[500] : Colors.grey[400],
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      minVerticalPadding: 0,
    );
  }
}
