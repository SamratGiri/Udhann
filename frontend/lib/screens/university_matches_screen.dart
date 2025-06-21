// lib/screens/university_matches_screen.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Add url_launcher: ^6.2.0 to pubspec.yaml
import '../state/profile_notifier.dart'; // Import the new notifier

class UniversityMatchesScreen extends StatefulWidget {
  @override
  _UniversityMatchesScreenState createState() =>
      _UniversityMatchesScreenState();
}

class _UniversityMatchesScreenState extends State<UniversityMatchesScreen> {
  // Dummy data for universities - adjusted for better layout
  final List<Map<String, dynamic>> _universities = [
    {
      'name': 'University of Tokyo',
      'country': 'Japan',
      'matchPercentage': 100,
      'rank': 'QS World Rank: #28',
      'acceptanceRate': 'Acceptance Rate: 35%',
      'notablePrograms': 'Computer Science, Engineering, Law',
      'applyUrl': 'https://www.u-tokyo.ac.jp/en/admissions/',
      'logo': 'assets/images/tokyo_logo.png',
    },
    {
      'name': 'University of Oxford',
      'country': 'UK',
      'matchPercentage': 85,
      'rank': 'QS World Rank: #3',
      'acceptanceRate': 'Acceptance Rate: 17%',
      'notablePrograms': 'Philosophy, Politics & Economics, Medicine',
      'applyUrl': 'https://www.ox.ac.uk/admissions',
      'logo': 'assets/images/oxford_logo.png',
    },
    {
      'name': 'ETH Zurich',
      'country': 'Switzerland',
      'matchPercentage': 75,
      'rank': 'QS World Rank: #8',
      'acceptanceRate': 'Acceptance Rate: 27%',
      'notablePrograms': 'Robotics, Data Science, Architecture',
      'applyUrl': 'https://ethz.ch/en/studies.html',
      'logo': 'assets/images/eth_logo.png',
    },
    {
      'name': 'Stanford University',
      'country': 'USA',
      'matchPercentage': 90,
      'rank': 'QS World Rank: #5',
      'acceptanceRate': 'Acceptance Rate: 4%',
      'notablePrograms': 'Engineering, Business, Humanities',
      'applyUrl': 'https://www.stanford.edu/admission/',
      'logo': 'assets/images/stanford_logo.png',
    },
    {
      'name': 'University of Cambridge',
      'country': 'UK',
      'matchPercentage': 80,
      'rank': 'QS World Rank: #2',
      'acceptanceRate': 'Acceptance Rate: 21%',
      'notablePrograms': 'Natural Sciences, Mathematics, English',
      'applyUrl': 'https://www.cam.ac.uk/admissions',
      'logo': 'assets/images/cambridge_logo.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Listen to the profileNotifier's completion percentage
    return ValueListenableBuilder<double>(
      valueListenable: profileNotifier.completionPercentage,
      builder: (context, completionPercentage, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'University Matches',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF003087), Colors.blue.shade400],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            leading: Builder(
              builder:
                  (context) => IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
            ),
            elevation: 4,
          ),
          drawer: _buildDrawer(context),
          body:
              profileNotifier
                      .isProfileComplete
                      .value // Access the ValueNotifier's value
                  ? _buildMatchesContent()
                  : _buildProfileCompletionMessage(
                    context,
                    completionPercentage,
                  ),
        );
      },
    );
  }

  Widget _buildProfileCompletionMessage(
    BuildContext context,
    double completionPercentage,
  ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info_outline, color: Colors.blue.shade700, size: 80),
            const SizedBox(height: 20),
            const Text(
              'Complete Your Profile to See Matches!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Your profile is ${completionPercentage.toStringAsFixed(0)}% complete.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/portfolio');
              },
              icon: const Icon(Icons.edit, color: Colors.white),
              label: const Text(
                'Go to Portfolio',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade700,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMatchesContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children:
            _universities.map((university) {
              return UniversityMatchCard(university: university);
            }).toList(),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    // Current route to highlight the selected item
    final currentRoute = ModalRoute.of(context)?.settings.name;

    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF003087), Colors.blue.shade700],
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
                    ? profileNotifier.completionPercentage
                    : null,
          );
        }
      },
    );
  }
}

class UniversityMatchCard extends StatelessWidget {
  final Map<String, dynamic> university;

  const UniversityMatchCard({Key? key, required this.university})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // University Logo (Placeholder for now)
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    university['logo'] ??
                        'assets/images/default_uni.png', // Use default if logo not found
                    fit: BoxFit.cover,
                    errorBuilder:
                        (context, error, stackTrace) => Icon(
                          Icons.school,
                          size: 40,
                          color: Colors.blue.shade700,
                        ), // Fallback icon
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  // Use Expanded to prevent overflow for text
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        university['name'],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        university['country'],
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Row for Match Percentage
                      Row(
                        children: [
                          Text(
                            '${university['matchPercentage']}% Match',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.green.shade700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 20, thickness: 1),
            // Info Chips (Rank, Acceptance Rate)
            Wrap(
              spacing: 8.0, // horizontal spacing
              runSpacing: 8.0, // vertical spacing
              children: [
                _buildInfoChip(university['rank'], Icons.leaderboard),
                _buildInfoChip(
                  university['acceptanceRate'],
                  Icons.check_circle_outline,
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Notable Programs
            Text(
              'Notable Programs:',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade800,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              university['notablePrograms'],
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () async {
                  final Uri url = Uri.parse(university['applyUrl']);
                  if (!await launchUrl(
                    url,
                    mode: LaunchMode.externalApplication,
                  )) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Could not launch ${university['applyUrl']}',
                        ),
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.open_in_new, color: Colors.white),
                label: const Text(
                  'Apply Now',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoChip(String text, IconData icon) {
    return Chip(
      avatar: Icon(icon, color: Colors.blue.shade700, size: 18),
      label: Text(
        text,
        style: const TextStyle(fontSize: 13, color: Colors.black87),
      ),
      backgroundColor: Colors.blue.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.blue.shade200),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    );
  }
}
