// lib/screens/portfolio_screen.dart
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import '../state/profile_notifier.dart'; // Import the new notifier

class PortfolioScreen extends StatefulWidget {
  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedTab = 'Education'; // Tracks the currently active tab

  // --- FORM CONTROLLERS DECLARATION ---
  // Education
  final _degreeController = TextEditingController();
  final _institutionController = TextEditingController();
  final _gpaController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  String? _educationDocumentPath;

  // Test Scores
  final _testTypeController = TextEditingController();
  final _scoreController = TextEditingController();
  final _testDateController = TextEditingController();
  String? _testScoresDocumentPath;

  // Financial
  final _budgetController = TextEditingController();
  String? _financialDocumentPath; // Changed to String?
  final _yourFieldController = TextEditingController(); // Added 'Your Field'

  // Interests
  final _interestController = TextEditingController();

  // Preferences
  final _countryController = TextEditingController();
  final _programController = TextEditingController();
  // --- END FORM CONTROLLERS DECLARATION ---

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {
          _selectedTab = _getTabName(_tabController.index);
        });
      }
    });

    // Listen to profileNotifier to rebuild tabs when section completion changes
    profileNotifier.addListener(_onProfileNotifierChanged);
  }

  void _onProfileNotifierChanged() {
    setState(() {
      // Rebuilds the tab bar to update checkmarks
    });
  }

  String _getTabName(int index) {
    switch (index) {
      case 0:
        return 'Education';
      case 1:
        return 'Test Scores';
      case 2:
        return 'Financial';
      case 3:
        return 'Interests';
      case 4:
        return 'Preferences';
      default:
        return '';
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _degreeController.dispose();
    _institutionController.dispose();
    _gpaController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    _testTypeController.dispose();
    _scoreController.dispose();
    _testDateController.dispose();
    _budgetController.dispose();
    _interestController.dispose();
    _countryController.dispose();
    _programController.dispose();
    _yourFieldController.dispose(); // Dispose 'Your Field' controller
    profileNotifier.removeListener(
      _onProfileNotifierChanged,
    ); // Clean up listener
    super.dispose();
  }

  Future<void> _selectFile(String sectionName) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        final filePath = result.files.single.path;
        if (sectionName == 'Education') {
          _educationDocumentPath = filePath;
        } else if (sectionName == 'Test Scores') {
          _testScoresDocumentPath = filePath;
        } else if (sectionName == 'Financial') {
          _financialDocumentPath = filePath; // Assign financial document path
        }
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Selected file: ${result.files.single.name}')),
      );
      _saveSection(sectionName); // Attempt to save section after file selection
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('File selection cancelled')));
    }
  }

  Future<void> _selectDate(
    BuildContext context,
    TextEditingController controller,
  ) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      controller.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }

  bool _isSectionComplete(String sectionName) {
    switch (sectionName) {
      case 'Education':
        return _degreeController.text.isNotEmpty &&
            _institutionController.text.isNotEmpty &&
            _gpaController.text.isNotEmpty &&
            _startDateController.text.isNotEmpty &&
            _endDateController.text.isNotEmpty;
      // Removed _educationDocumentPath != null;
      case 'Test Scores':
        return _testTypeController.text.isNotEmpty &&
            _scoreController.text.isNotEmpty &&
            _testDateController.text.isNotEmpty;
      // Removed _testScoresDocumentPath != null;
      case 'Financial':
        return _budgetController.text.isNotEmpty &&
            _yourFieldController.text.isNotEmpty;
      // Removed _financialDocumentPath != null;
      case 'Interests':
        return _interestController.text.isNotEmpty;
      case 'Preferences':
        return _countryController.text.isNotEmpty &&
            _programController.text.isNotEmpty;
      default:
        return false;
    }
  }

  void _saveSection(String sectionName) {
    if (_isSectionComplete(sectionName)) {
      profileNotifier.setSectionCompletion(sectionName, true);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('$sectionName data saved!')));
    } else {
      profileNotifier.setSectionCompletion(sectionName, false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please fill all required fields for $sectionName.', // Modified message
          ),
        ),
      );
    }
    // No need for setState() here, as profileNotifier.addListener handles rebuilds
  }

  Widget _buildUploadDocumentCard({
    required String title,
    required String subtitle,
    required String? filePath,
    required VoidCallback onUploadPressed,
    required VoidCallback onViewPressed,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.upload_file, color: Colors.grey, size: 30),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: onUploadPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                  child: const Text('Upload'),
                ),
              ],
            ),
            if (filePath != null) ...[
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Uploaded: ${filePath.split('/').last}',
                      style: const TextStyle(fontSize: 14, color: Colors.green),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  TextButton(
                    onPressed: onViewPressed,
                    child: Text(
                      'View Document',
                      style: TextStyle(
                        color: Colors.blue.shade700,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildPortfolioSection({
    required String tabName,
    required List<Widget> fields,
    String? uploadTitle,
    String? uploadSubtitle,
    String? uploadedFilePath,
    VoidCallback? onUploadPressed,
    VoidCallback? onViewDocumentPressed,
  }) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...fields,
          if (uploadTitle != null &&
              uploadSubtitle != null &&
              onUploadPressed != null)
            _buildUploadDocumentCard(
              title: uploadTitle,
              subtitle: uploadSubtitle,
              filePath: uploadedFilePath,
              onUploadPressed: onUploadPressed,
              onViewPressed:
                  onViewDocumentPressed ??
                  () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Viewing document at: ${uploadedFilePath ?? 'N/A'}',
                        ),
                      ),
                    );
                  },
            ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _saveSection(tabName),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade700,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Save', style: TextStyle(fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Portfolio',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
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
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(
            100.0,
          ), // Increased height for completion bar and tabs
          child: Column(
            children: [
              // Profile Completion Indicator
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: ValueListenableBuilder<double>(
                  valueListenable:
                      profileNotifier
                          .completionPercentage, // Use ValueListenable directly
                  builder: (context, completionPercentage, child) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Profile Completion',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '${completionPercentage.toStringAsFixed(0)}%',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        LinearProgressIndicator(
                          value: completionPercentage / 100,
                          backgroundColor: Colors.white30,
                          color: Colors.greenAccent,
                          minHeight: 10,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 10), // Spacing between completion and tabs
              TabBar(
                controller: _tabController,
                isScrollable: true,
                indicatorColor: Colors.transparent, // Hide default indicator
                labelColor: Colors.blue.shade900,
                unselectedLabelColor: Colors.white,
                onTap: (index) {
                  setState(() {
                    _selectedTab = _getTabName(index);
                  });
                },
                tabs: [
                  _buildTab(
                    'Education',
                    profileNotifier.isSectionComplete('Education'),
                  ),
                  _buildTab(
                    'Test Scores',
                    profileNotifier.isSectionComplete('Test Scores'),
                  ),
                  _buildTab(
                    'Financial',
                    profileNotifier.isSectionComplete('Financial'),
                  ),
                  _buildTab(
                    'Interests',
                    profileNotifier.isSectionComplete('Interests'),
                  ),
                  _buildTab(
                    'Preferences',
                    profileNotifier.isSectionComplete('Preferences'),
                  ),
                ],
              ),
            ],
          ),
        ),
        elevation: 4,
      ),
      drawer: _buildDrawer(context),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Education Tab
                _buildPortfolioSection(
                  tabName: 'Education',
                  fields: [
                    _buildTextField('Degree', _degreeController),
                    _buildTextField('Institution', _institutionController),
                    _buildTextField(
                      'GPA/Percentage',
                      _gpaController,
                      keyboardType: TextInputType.number,
                    ),
                    _buildDateField('Start Date', _startDateController),
                    _buildDateField('End Date', _endDateController),
                  ],
                  uploadTitle:
                      'Upload Education Transcript (Optional)', // Changed title
                  uploadSubtitle:
                      'Please upload your official academic transcript or diploma.',
                  uploadedFilePath: _educationDocumentPath,
                  onUploadPressed: () => _selectFile('Education'),
                ),
                // Test Scores Tab
                _buildPortfolioSection(
                  tabName: 'Test Scores',
                  fields: [
                    _buildTextField(
                      'Test Type (e.g., SAT, IELTS)',
                      _testTypeController,
                    ),
                    _buildTextField(
                      'Score',
                      _scoreController,
                      keyboardType: TextInputType.number,
                    ),
                    _buildDateField('Test Date', _testDateController),
                  ],
                  uploadTitle:
                      'Upload Test Score Report (Optional)', // Changed title
                  uploadSubtitle:
                      'Please upload your official test score report (e.g., SAT, IELTS, TOEFL).',
                  uploadedFilePath: _testScoresDocumentPath,
                  onUploadPressed: () => _selectFile('Test Scores'),
                ),
                // Financial Tab
                _buildPortfolioSection(
                  tabName: 'Financial',
                  fields: [
                    _buildTextField(
                      'Your Field',
                      _yourFieldController,
                    ), // Added 'Your Field'
                    _buildTextField(
                      'Annual Budget (USD)',
                      _budgetController,
                      keyboardType: TextInputType.number,
                    ),
                  ],
                  uploadTitle:
                      'Upload Bank Statement/Financial Proof (Optional)', // Changed title
                  uploadSubtitle:
                      'Please upload documents proving your financial capacity.',
                  uploadedFilePath: _financialDocumentPath,
                  onUploadPressed: () => _selectFile('Financial'),
                ),
                // Interests Tab
                _buildPortfolioSection(
                  tabName: 'Interests',
                  fields: [
                    _buildTextField(
                      'Areas of Interest (e.g., AI, Arts)',
                      _interestController,
                      maxLines: 3,
                    ),
                  ],
                ),
                // Preferences Tab
                _buildPortfolioSection(
                  tabName: 'Preferences',
                  fields: [
                    _buildTextField(
                      'Preferred Countries',
                      _countryController,
                      maxLines: 2,
                    ),
                    _buildTextField(
                      'Preferred Programs/Majors',
                      _programController,
                      maxLines: 2,
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Conditional "View Matches" button
          ValueListenableBuilder<double>(
            valueListenable: profileNotifier.completionPercentage,
            builder: (context, completionPercentage, child) {
              if (profileNotifier.isProfileComplete.value) {
                // Use isProfileComplete getter
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/university_matches',
                          arguments:
                              completionPercentage, // Pass completion to matches screen
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors
                                .green
                                .shade700, // Different color for distinction
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'View Matches →',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                );
              }
              return const SizedBox.shrink(); // Hide button if not 100% complete
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String title, bool isComplete) {
    return Tab(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: _selectedTab == title ? Colors.white : Colors.blue.shade700,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white54),
        ),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                color:
                    _selectedTab == title ? Colors.blue.shade900 : Colors.white,
              ),
            ),
            if (isComplete)
              const Padding(
                padding: EdgeInsets.only(left: 4.0),
                child: Icon(
                  Icons.check_circle,
                  size: 18,
                  color: Colors.greenAccent,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.blue.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.blue.shade300, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.blue.shade700, width: 2.0),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildDateField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        readOnly: true, // Make it read-only so user can't type
        onTap: () => _selectDate(context, controller),
        decoration: InputDecoration(
          labelText: label,
          suffixIcon: const Icon(Icons.calendar_today),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.blue.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.blue.shade300, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.blue.shade700, width: 2.0),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
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
            DrawerHeader(
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
                      color: Colors.blue.shade700,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Welcome, User!', // Replace with actual username
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'user@example.com', // Replace with actual user email
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(Icons.dashboard, 'Dashboard', 0, context),
            _buildDrawerItem(Icons.person, 'My Portfolio', 1, context),
            _buildDrawerItem(Icons.card_giftcard, 'Scholarships', 2, context),
            _buildDrawerItem(Icons.school, 'University Matches', 3, context),
            SizedBox(height: 20),
            Divider(color: Colors.white54),
            _buildDrawerItem(Icons.logout, 'Logout', 4, context),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
    IconData icon,
    String title,
    int index,
    BuildContext context,
  ) {
    bool isSelected = false;
    // Determine selected state based on the current route
    final currentRoute = ModalRoute.of(context)?.settings.name;
    if (index == 0 && currentRoute == '/home') isSelected = true;
    if (index == 1 && currentRoute == '/portfolio') isSelected = true;
    if (index == 2 && currentRoute == '/scholarships') isSelected = true;
    if (index == 3 && currentRoute == '/university_matches') isSelected = true;

    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: TextStyle(color: Colors.white)),
      selected: isSelected,
      selectedTileColor: Colors.blue.shade900,
      onTap: () {
        Navigator.pop(context); // Close the drawer
        if (index == 0) {
          Navigator.pushReplacementNamed(context, '/home');
        } else if (index == 1) {
          Navigator.pushReplacementNamed(context, '/portfolio');
        } else if (index == 2) {
          Navigator.pushReplacementNamed(context, '/scholarships');
        } else if (index == 3) {
          Navigator.pushReplacementNamed(
            context,
            '/university_matches',
            arguments:
                profileNotifier.completionPercentage.value, // Pass the value
          );
        } else if (index == 4) {
          // Handle logout
          profileNotifier.resetProfile(); // Reset profile on logout
          Navigator.pushReplacementNamed(context, '/login');
        }
      },
    );
  }
}
