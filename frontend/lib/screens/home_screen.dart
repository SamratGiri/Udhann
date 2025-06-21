// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import '../state/profile_notifier.dart'; // Import the new notifier

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // We no longer need _selectedIndex here as it's managed by the drawer's navigation logic
  // int _selectedIndex = 0; // Default to Dashboard

  bool _showProfileCompletedAnimation = false;

  @override
  void initState() {
    super.initState();
    // Listen to changes in profile completion
    profileNotifier.addListener(_checkProfileCompletionStatus);
  }

  @override
  void dispose() {
    profileNotifier.removeListener(_checkProfileCompletionStatus);
    super.dispose();
  }

  void _checkProfileCompletionStatus() {
    // Only show animation once when profile becomes 100% complete
    if (profileNotifier.isProfileComplete.value &&
        !_showProfileCompletedAnimation) {
      // Access .value here
      setState(() {
        _showProfileCompletedAnimation = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard', // Title of the current screen
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFF003087),
                Colors.blue.shade400,
              ], // Matching sidebar blue
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        leading: Builder(
          // Allows access to Scaffold's context for opening drawer
          builder:
              (context) => IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed:
                    () => Scaffold.of(context).openDrawer(), // Open the drawer
              ),
        ),
        elevation: 4,
      ),
      drawer: _buildDrawer(context), // The sidebar as a Drawer
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome message
                const Text(
                  'Welcome, [Username]!', // Placeholder for actual user name
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Ready to find your perfect university match?',
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                ),
                const SizedBox(height: 20),

                // Profile Completion Progress Bar
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Your Profile',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ValueListenableBuilder<double>(
                          valueListenable: profileNotifier.completionPercentage,
                          builder: (context, completionPercentage, child) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${completionPercentage.toStringAsFixed(0)}% Complete',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue.shade700,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.person,
                                      color: Colors.blue,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                LinearProgressIndicator(
                                  value: completionPercentage / 100,
                                  backgroundColor: Colors.grey.shade200,
                                  color: Colors.blue.shade700,
                                  minHeight: 10,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Next Steps Section
                const Text(
                  'Next Steps',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 15),
                _buildNextStepItem(
                  stepNumber: 1,
                  title: 'Update Portfolio',
                  description:
                      'Add your academic, test, and financial details.',
                  buttonText: 'Update Portfolio',
                  onButtonPressed: () {
                    Navigator.pushNamed(context, '/portfolio');
                  },
                ),
                const SizedBox(height: 15),
                _buildNextStepItem(
                  stepNumber: 2,
                  title: 'View Scholarships',
                  description:
                      'Explore available scholarships that match your profile.',
                  buttonText: 'View Scholarships',
                  onButtonPressed: () {
                    Navigator.pushNamed(context, '/scholarships');
                  },
                ),
                const SizedBox(height: 15),
                _buildNextStepItem(
                  stepNumber: 3,
                  title: 'Find University Matches',
                  description:
                      'Discover universities perfectly suited to your aspirations.',
                  buttonText: 'Find Matches',
                  onButtonPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/university_matches',
                      arguments:
                          profileNotifier
                              .completionPercentage
                              .value, // Pass current completion
                    );
                  },
                ),
              ],
            ),
          ),
          // Profile Completed Animation Overlay
          if (_showProfileCompletedAnimation) _buildProfileCompletedOverlay(),
        ],
      ),
    );
  }

  Widget _buildProfileCompletedOverlay() {
    return Positioned.fill(
      child: Container(
        color: Colors.black.withOpacity(0.5), // Semi-transparent overlay
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: 1),
                duration: const Duration(milliseconds: 700),
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: Opacity(
                      opacity: value,
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.check_circle_outline,
                              color: Colors.green.shade700,
                              size: 80,
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Profile Completed!',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Congratulations! Your profile is 100% complete.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _showProfileCompletedAnimation = false;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue.shade700,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                'Awesome!',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNextStepItem({
    required int stepNumber,
    required String title,
    required String description,
    required String buttonText,
    required VoidCallback onButtonPressed,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.blue.shade700,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '$stepNumber',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(description, style: TextStyle(color: Colors.grey.shade700)),
              const SizedBox(height: 8),
              TextButton(
                onPressed: onButtonPressed,
                child: Text(
                  buttonText,
                  style: TextStyle(color: Colors.blue.shade700),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDrawer(BuildContext context) {
    // Current route to highlight the selected item
    final currentRoute = ModalRoute.of(context)?.settings.name;

    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color(0xFF003087), Colors.blue.shade700],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.transparent),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Color(0xFF003087),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Welcome, User!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'user@example.com',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(
              Icons.dashboard,
              'Dashboard',
              '/home',
              currentRoute == '/home',
            ),
            _buildDrawerItem(
              Icons.person,
              'My Portfolio',
              '/portfolio',
              currentRoute == '/portfolio',
            ),
            _buildDrawerItem(
              Icons.card_giftcard,
              'Scholarships',
              '/scholarships',
              currentRoute == '/scholarships',
            ),
            _buildDrawerItem(
              Icons.school,
              'University Matches',
              '/university_matches',
              currentRoute == '/university_matches',
            ),
            const SizedBox(height: 20),
            const Divider(color: Colors.white54),
            _buildDrawerItem(Icons.logout, 'Logout', '/login', false),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
    IconData icon,
    String title,
    String routeName,
    bool isSelected,
  ) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      selected: isSelected,
      selectedTileColor: Colors.blue.shade900,
      onTap: () {
        Navigator.pop(context); // Close the drawer
        if (routeName == '/login') {
          profileNotifier.resetProfile(); // Reset profile on logout
        }
        if (ModalRoute.of(context)?.settings.name != routeName) {
          Navigator.pushReplacementNamed(
            context,
            routeName,
            arguments:
                routeName == '/university_matches'
                    ? profileNotifier
                        .completionPercentage
                        .value // Pass the value
                    : null,
          );
        }
      },
    );
  }
}
