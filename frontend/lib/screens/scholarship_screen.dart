// lib/screens/scholarships_screen.dart
import 'package:flutter/material.dart';
import 'package:udhann_grok/utils/global_state.dart';
import 'package:url_launcher/url_launcher.dart';

class ScholarshipsScreen extends StatefulWidget {
  @override
  _ScholarshipsScreenState createState() => _ScholarshipsScreenState();
}

class _ScholarshipsScreenState extends State<ScholarshipsScreen> {
  int _selectedIndex = 2; // Default to Scholarships in drawer

  // Dummy data for scholarships
  final List<Map<String, dynamic>> _scholarships = [
    {
      'name': 'Global Citizen Scholarship',
      'university': 'Any accredited university',
      'fundingType': 'Fully Funded',
      'deadline': '2025-08-15',
      'eligibility':
          'For students demonstrating leadership and community involvement.',
      'applyLink': 'https://www.u-tokyo.ac.jp/en/admissions/',
      'logo': 'https://placehold.co/60x60/FFD700/FFFFFF?text=GCS', // Gold
    },
    {
      'name': 'STEM Innovators Grant',
      'university': 'Selected STEM programs',
      'fundingType': 'Partial Funding',
      'deadline': '2025-09-01',
      'eligibility':
          'For students pursuing STEM fields with strong academic record.',
      'applyLink': 'https://www.ox.ac.uk/admissions',
      'logo': 'https://placehold.co/60x60/4CAF50/FFFFFF?text=SIG', // Green
    },
    {
      'name': 'Developing Nations Bursary',
      'university': 'Various',
      'fundingType': 'Fully Funded',
      'deadline': '2025-07-20',
      'eligibility':
          'For students from developing countries demonstrating financial need.',
      'applyLink': 'https://ethz.ch/en/studies.html',
      'logo': 'https://placehold.co/60x60/8B4513/FFFFFF?text=DNB', // Brown
    },
    {
      'name': 'Arts & Culture Merit Award',
      'university': 'Arts & Humanities programs',
      'fundingType': 'Partial Funding',
      'deadline': '2025-08-10',
      'eligibility': 'For students excelling in arts and cultural studies.',
      'applyLink': 'https://www.cam.ac.uk/admissions',
      'logo': 'https://placehold.co/60x60/9C27B0/FFFFFF?text=ACM', // Purple
    },
    {
      'name': 'Community Leadership Grant',
      'university': 'Any accredited university',
      'fundingType': 'Fully Funded',
      'deadline': '2025-09-15',
      'eligibility':
          'For students with significant community leadership experience.',
      'applyLink': 'https://www.stanford.edu/admission/',
      'logo': 'https://placehold.co/60x60/2196F3/FFFFFF?text=CLG', // Blue
    },
  ];

  // Function to launch URL
  Future<void> _launchURL(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Scholarships',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [const Color(0xFF003087), Colors.blue.shade400],
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
      drawer: _buildDrawer(),
      body:
          _scholarships.isEmpty
              ? const Center(
                child: Text('No scholarships available at the moment.'),
              )
              : ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: _scholarships.length,
                itemBuilder: (context, index) {
                  final scholarship = _scholarships[index];
                  return _buildScholarshipCard(scholarship);
                },
              ),
    );
  }

  // Helper method to build individual scholarship cards with improved styling
  Widget _buildScholarshipCard(Map<String, dynamic> scholarship) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // More rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.blue.shade50,
                  backgroundImage: NetworkImage(scholarship['logo']),
                  onBackgroundImageError: (exception, stacktrace) {
                    print("Error loading image: $exception");
                  },
                  child:
                      scholarship['logo']
                              .isEmpty // Fallback icon if no logo
                          ? Icon(
                            Icons.monetization_on,
                            color: Colors.blue.shade700,
                            size: 30,
                          )
                          : null,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    scholarship['name'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(height: 20, thickness: 0.8),
            _buildDetailRow(Icons.school, scholarship['university']),
            const SizedBox(height: 8),
            _buildDetailRow(
              Icons.account_balance_wallet,
              scholarship['fundingType'],
            ),
            const SizedBox(height: 8),
            _buildDetailRow(
              Icons.calendar_today,
              'Deadline: ${scholarship['deadline']}',
            ),
            const SizedBox(height: 12),
            const Text(
              'Eligibility Criteria:',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              scholarship['eligibility'],
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton.icon(
                onPressed: () => _launchURL(scholarship['applyLink']),
                icon: const Icon(
                  Icons.open_in_new,
                  size: 20,
                  color: Colors.white,
                ),
                label: const Text(
                  'View & Apply',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 10,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey.shade600),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 15, color: Colors.grey.shade800),
          ),
        ),
      ],
    );
  }

  // Helper method to build the drawer (sidebar) - Copied from HomeScreen for consistency
  Widget _buildDrawer() {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFF003087), // Darker blue
              Colors.blue.shade700, // Lighter blue
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.transparent, // Gradient already applied
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Color(0xFF003087),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Welcome, ${userManager.email.split('@')[0]}!',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    userManager.email,
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(Icons.dashboard, 'Dashboard', 0, context),
            _buildDrawerItem(Icons.person, 'My Portfolio', 1, context),
            _buildDrawerItem(Icons.card_giftcard, 'Scholarships', 2, context),
            _buildDrawerItem(Icons.school, 'University Matches', 3, context),
            const SizedBox(height: 20),
            const Divider(color: Colors.white54),
            _buildDrawerItem(Icons.logout, 'Logout', 4, context),
          ],
        ),
      ),
    );
  }

  // Helper method to build individual drawer items - Copied from HomeScreen for consistency
  Widget _buildDrawerItem(
    IconData icon,
    String title,
    int index,
    BuildContext context,
  ) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      selected: _selectedIndex == index,
      selectedTileColor: Colors.blue.shade900,
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        Navigator.pop(context); // Close the drawer
        // Handle navigation
        if (index == 0) {
          Navigator.pushReplacementNamed(context, '/home');
        } else if (index == 1) {
          Navigator.pushReplacementNamed(context, '/portfolio');
        } else if (index == 2) {
          // Already on Scholarships, do nothing or pop back if needed
        } else if (index == 3) {
          Navigator.pushReplacementNamed(context, '/university_matches');
        } else if (index == 4) {
          userManager.setUserEmail(''); // Clear user email on logout
          userManager.updateProfileCompletion(0.0); // Reset completion
          Navigator.pushReplacementNamed(context, '/login');
        }
      },
    );
  }
}
