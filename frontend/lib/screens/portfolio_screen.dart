// lib/screens/portfolio_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import '../services/portfolio_service.dart'; // Import the new service
import '../services/ocr_service.dart'; // Import OCR service
import '../state/profile_notifier.dart';
import '../utils/global_state.dart'; // Import global state for user data

class PortfolioScreen extends StatefulWidget {
  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedTab = 'Education';
  final PortfolioService _portfolioService = PortfolioService(); // Initialize service
  final OcrService _ocrService = OcrService(); // Initialize OCR service

  // Form controllers
  final _degreeController = TextEditingController();
  final _institutionController = TextEditingController();
  final _gpaController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  String? _educationDocumentPath;

  final _testTypeController = TextEditingController();
  final _scoreController = TextEditingController();
  final _testDateController = TextEditingController();
  String? _testScoresDocumentPath;

  final _budgetController = TextEditingController();
  String? _financialDocumentPath;
  final _yourFieldController = TextEditingController();

  final _interestController = TextEditingController();

  final _countryController = TextEditingController();
  final _programController = TextEditingController();

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

    profileNotifier.addListener(_onProfileNotifierChanged);
    _initializeUser(); // Initialize user data first
  }

  // Initialize user data and then fetch portfolio
  Future<void> _initializeUser() async {
    await userManager.init(); // Load user data from SharedPreferences
    if (userManager.token.isNotEmpty) {
      _fetchPortfolioData(); // Fetch data after user is initialized
    } else {
      // If no token, redirect to login
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, '/login');
      });
    }
  }

  void _onProfileNotifierChanged() {
    setState(() {});
  }

  // Fetch portfolio data from backend
  Future<void> _fetchPortfolioData() async {
    try {
      final response = await _portfolioService.fetchPortfolio(
        userManager.userId,
        userManager.token,
      );
      
      // Backend returns { portfolio: {...} }
      final portfolioData = response['portfolio'];
      
      if (portfolioData != null) {
        setState(() {
          // Populate Education fields
          _degreeController.text = portfolioData['degree'] ?? '';
          _institutionController.text = portfolioData['institution'] ?? '';
          _gpaController.text = portfolioData['gpa'] ?? '';
          _startDateController.text = portfolioData['educationStartDate'] != null 
              ? DateTime.parse(portfolioData['educationStartDate']).toString().split(' ')[0]
              : '';
          _endDateController.text = portfolioData['educationEndDate'] != null 
              ? DateTime.parse(portfolioData['educationEndDate']).toString().split(' ')[0]
              : '';
          
          // Populate Test Scores fields
          _testTypeController.text = portfolioData['testType'] ?? '';
          _scoreController.text = portfolioData['testScore'] ?? '';
          _testDateController.text = portfolioData['testDate'] != null 
              ? DateTime.parse(portfolioData['testDate']).toString().split(' ')[0]
              : '';
          
          // Populate Financial fields
          _yourFieldController.text = portfolioData['financialField'] ?? '';
          _budgetController.text = portfolioData['annualBudget']?.toString() ?? '';
          
          // Populate Interests fields
          _interestController.text = portfolioData['interests'] ?? '';
          
          // Populate Preferences fields
          _countryController.text = portfolioData['preferredCountries'] ?? '';
          _programController.text = portfolioData['preferredPrograms'] ?? '';
          
          // Update section completion status
          profileNotifier.setSectionCompletion('Education', _isSectionComplete('Education'));
          profileNotifier.setSectionCompletion('Test Scores', _isSectionComplete('Test Scores'));
          profileNotifier.setSectionCompletion('Financial', _isSectionComplete('Financial'));
          profileNotifier.setSectionCompletion('Interests', _isSectionComplete('Interests'));
          profileNotifier.setSectionCompletion('Preferences', _isSectionComplete('Preferences'));
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching portfolio: $e')),
      );
    }
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
    _yourFieldController.dispose();
    profileNotifier.removeListener(_onProfileNotifierChanged);
    super.dispose();
  }

  Future<void> _selectFile(String sectionName) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
      allowMultiple: false,
    );

    if (result != null) {
      final file = result.files.single;
      
      // Show processing dialog
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 20),
                Text("Processing document with OCR..."),
              ],
            ),
          );
        },
      );

      try {
        Map<String, dynamic> ocrResult;
        
        // Handle file processing based on platform
        if (kIsWeb) {
          // On web, use bytes directly
          if (file.bytes != null) {
            ocrResult = await _ocrService.processDocumentFromBytes(
              file.bytes!, 
              file.name, 
              userManager.token
            );
          } else {
            throw Exception('Could not read file bytes');
          }
        } else {
          // On mobile, use file path
          if (file.path != null) {
            ocrResult = await _ocrService.processDocument(file.path!, userManager.token);
          } else {
            throw Exception('Could not get file path');
          }
        }
        
        // Close processing dialog
        Navigator.pop(context);
        
        if (ocrResult['success'] == true) {
          // Extract relevant data from OCR
          final extractedData = _ocrService.extractPortfolioData(ocrResult);
          
          // Auto-fill form fields based on section and extracted data
          _autoFillFields(sectionName, extractedData);
          
          // Show success dialog with extracted data
          _showOCRResultDialog(sectionName, ocrResult['rawText'], extractedData);
        } else {
          _showErrorSnackBar('OCR processing failed: ${ocrResult['message']}');
        }

        // Upload file to backend (optional)
        try {
          String fileUrl;
          if (kIsWeb && file.bytes != null) {
            fileUrl = await _portfolioService.uploadDocumentFromBytes(
              file.bytes!,
              file.name,
              sectionName,
              userManager.token,
            );
          } else if (!kIsWeb && file.path != null) {
            fileUrl = await _portfolioService.uploadDocument(
              file.path!,
              sectionName,
              userManager.token,
            );
          } else {
            throw Exception('Could not process file for upload');
          }
          setState(() {
            if (sectionName == 'Education') {
              _educationDocumentPath = fileUrl;
            } else if (sectionName == 'Test Scores') {
              _testScoresDocumentPath = fileUrl;
            } else if (sectionName == 'Financial') {
              _financialDocumentPath = fileUrl;
            }
          });
        } catch (uploadError) {
          print('File upload failed: $uploadError');
          // Continue even if file upload fails
        }

      } catch (e) {
        // Close processing dialog
        Navigator.pop(context);
        _showErrorSnackBar('Error processing document: $e');
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('File selection cancelled')),
      );
    }
  }

  void _autoFillFields(String sectionName, Map<String, String> extractedData) {
    setState(() {
      switch (sectionName) {
        case 'Education':
          if (extractedData['degree'] != null) {
            _degreeController.text = extractedData['degree']!;
          }
          if (extractedData['institution'] != null) {
            _institutionController.text = extractedData['institution']!;
          }
          if (extractedData['gpa'] != null) {
            _gpaController.text = extractedData['gpa']!;
          }
          break;
        case 'Test Scores':
          if (extractedData['testType'] != null) {
            _testTypeController.text = extractedData['testType']!;
          }
          if (extractedData['score'] != null) {
            _scoreController.text = extractedData['score']!;
          }
          break;
        case 'Financial':
          if (extractedData['budget'] != null) {
            _budgetController.text = extractedData['budget']!;
          }
          break;
      }
    });
  }

  void _showOCRResultDialog(String sectionName, String rawText, Map<String, String> extractedData) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('OCR Results - $sectionName'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (extractedData.isNotEmpty) ...[
                  const Text(
                    'Extracted Data:',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                  const SizedBox(height: 8),
                  ...extractedData.entries.map((entry) => 
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text('${entry.key}: ${entry.value}'),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
                const Text(
                  'Raw Text:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    rawText.isNotEmpty ? rawText : 'No text extracted',
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
            if (extractedData.isNotEmpty)
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  _saveSection(sectionName);
                },
                child: const Text('Save Data'),
              ),
          ],
        );
      },
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
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
      case 'Test Scores':
        return _testTypeController.text.isNotEmpty &&
            _scoreController.text.isNotEmpty &&
            _testDateController.text.isNotEmpty;
      case 'Financial':
        return _budgetController.text.isNotEmpty &&
            _yourFieldController.text.isNotEmpty;
      case 'Interests':
        return _interestController.text.isNotEmpty;
      case 'Preferences':
        return _countryController.text.isNotEmpty &&
            _programController.text.isNotEmpty;
      default:
        return false;
    }
  }

  Future<void> _saveSection(String sectionName) async {
    if (_isSectionComplete(sectionName)) {
      try {
        switch (sectionName) {
          case 'Education':
            await _portfolioService.saveEducation({
              'degree': _degreeController.text,
              'institution': _institutionController.text,
              'gpa': _gpaController.text,
              'startDate': _startDateController.text,
              'endDate': _endDateController.text,
              'documentPath': _educationDocumentPath,
            }, userManager.token);
            break;
          case 'Test Scores':
            await _portfolioService.saveTestScores({
              'testType': _testTypeController.text,
              'score': _scoreController.text,
              'testDate': _testDateController.text,
              'documentPath': _testScoresDocumentPath,
            }, userManager.token);
            break;
          case 'Financial':
            await _portfolioService.saveFinancial({
              'yourField': _yourFieldController.text,
              'budget': _budgetController.text,
              'documentPath': _financialDocumentPath,
            }, userManager.token);
            break;
          case 'Interests':
            await _portfolioService.saveInterests({
              'interest': _interestController.text,
            }, userManager.token);
            break;
          case 'Preferences':
            await _portfolioService.savePreferences({
              'country': _countryController.text,
              'program': _programController.text,
            }, userManager.token);
            break;
        }
        profileNotifier.setSectionCompletion(sectionName, true);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$sectionName data saved!')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving $sectionName: $e')),
        );
      }
    } else {
      profileNotifier.setSectionCompletion(sectionName, false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill all required fields for $sectionName.'),
        ),
      );
    }
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
          preferredSize: const Size.fromHeight(100.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: ValueListenableBuilder<double>(
                  valueListenable: profileNotifier.completionPercentage,
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
              const SizedBox(height: 10),
              TabBar(
                controller: _tabController,
                isScrollable: true,
                indicatorColor: Colors.transparent,
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
                  uploadTitle: 'Upload Education Transcript (Optional)',
                  uploadSubtitle:
                      'Please upload your official academic transcript or diploma.',
                  uploadedFilePath: _educationDocumentPath,
                  onUploadPressed: () => _selectFile('Education'),
                ),
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
                  uploadTitle: 'Upload Test Score Report (Optional)',
                  uploadSubtitle:
                      'Please upload your official test score report (e.g., SAT, IELTS, TOEFL).',
                  uploadedFilePath: _testScoresDocumentPath,
                  onUploadPressed: () => _selectFile('Test Scores'),
                ),
                _buildPortfolioSection(
                  tabName: 'Financial',
                  fields: [
                    _buildTextField(
                      'Your Field',
                      _yourFieldController,
                    ),
                    _buildTextField(
                      'Annual Budget (USD)',
                      _budgetController,
                      keyboardType: TextInputType.number,
                    ),
                  ],
                  uploadTitle: 'Upload Bank Statement/Financial Proof (Optional)',
                  uploadSubtitle:
                      'Please upload documents proving your financial capacity.',
                  uploadedFilePath: _financialDocumentPath,
                  onUploadPressed: () => _selectFile('Financial'),
                ),
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
          ValueListenableBuilder<double>(
            valueListenable: profileNotifier.completionPercentage,
            builder: (context, completionPercentage, child) {
              if (profileNotifier.isProfileComplete.value) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/university_matches',
                          arguments: completionPercentage,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade700,
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
              return const SizedBox.shrink();
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
        readOnly: true,
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
                    'Welcome, ${userManager.email.isNotEmpty ? userManager.email : 'User'}!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    userManager.email.isNotEmpty ? userManager.email : 'user@example.com',
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
      onTap: () async {         
        Navigator.pop(context);
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
            arguments: profileNotifier.completionPercentage.value,
          );
        } else if (index == 4) {
          profileNotifier.resetProfile();
          await userManager.clearUserData(); // Clear user data on logout
          Navigator.pushReplacementNamed(context, '/login');
        }
      },
    );
  }
}