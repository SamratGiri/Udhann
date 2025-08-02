
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:io';

class PortfolioService {
  String getBaseUrl() {
    if (kIsWeb) {
      return 'http://localhost:5001/api';
    } else if (Platform.isAndroid) {
      return 'http://10.0.2.2:5001/api';
    } else if (Platform.isIOS) {
      return 'http://localhost:5001/api';
    } else {
      return 'http://localhost:5001/api';
    }
  }

  Future<Map<String, dynamic>> fetchPortfolio(String userId, String token) async {
    if (token.isEmpty) {
      throw Exception('No authentication token available');
    }
    
    try {
      final response = await http.get(
        Uri.parse('${getBaseUrl()}/portfolio'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      
      print('Portfolio fetch response: ${response.statusCode} - ${response.body}');
      return _handleResponse(response);
    } catch (e) {
      print('Portfolio fetch error: $e');
      throw Exception('Failed to fetch portfolio: $e');
    }
  }

  Future<void> savePortfolio(Map<String, dynamic> data, String token) async {
    if (token.isEmpty) {
      throw Exception('No authentication token available');
    }
    
    try {
      print('Saving portfolio data: $data');
      final response = await http.put(
        Uri.parse('${getBaseUrl()}/portfolio'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(data),
      );
      
      print('Portfolio save response: ${response.statusCode} - ${response.body}');
      _handleResponse(response);
    } catch (e) {
      print('Portfolio save error: $e');
      throw Exception('Failed to save portfolio: $e');
    }
  }

  // Upload document with OCR processing support
  Future<String> uploadDocument(String filePath, String sectionName, String token) async {
    if (token.isEmpty) {
      throw Exception('No authentication token available');
    }

    try {
      // Read file as bytes
      final file = File(filePath);
      final bytes = await file.readAsBytes();
      final fileName = filePath.split('/').last;
      
      // Create multipart request
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('${getBaseUrl()}/portfolio/upload'),
      );
      
      // Add headers
      request.headers.addAll({
        'Authorization': 'Bearer $token',
      });
      
      // Add file and section to request
      request.files.add(
        http.MultipartFile.fromBytes(
          'document',
          bytes,
          filename: fileName,
        ),
      );
      request.fields['section'] = sectionName;

      // Send request
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return responseData['fileUrl'] ?? filePath;
      } else {
        final errorData = json.decode(response.body);
        throw Exception('Upload failed: ${errorData['message'] ?? response.reasonPhrase}');
      }
    } catch (e) {
      print('Document upload error: $e');
      throw Exception('Failed to upload document: $e');
    }
  }

  // Upload document from bytes (for web platform)
  Future<String> uploadDocumentFromBytes(Uint8List bytes, String fileName, String sectionName, String token) async {
    if (token.isEmpty) {
      throw Exception('No authentication token available');
    }

    try {
      // Create multipart request
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('${getBaseUrl()}/portfolio/upload'),
      );
      
      // Add headers
      request.headers.addAll({
        'Authorization': 'Bearer $token',
      });
      
      // Add file and section to request
      request.files.add(
        http.MultipartFile.fromBytes(
          'document',
          bytes,
          filename: fileName,
        ),
      );
      request.fields['section'] = sectionName;

      // Send request
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return responseData['fileUrl'] ?? fileName;
      } else {
        final errorData = json.decode(response.body);
        throw Exception('Upload failed: ${errorData['message'] ?? response.reasonPhrase}');
      }
    } catch (e) {
      print('Document upload error: $e');
      throw Exception('Failed to upload document: $e');
    }
  }

  Future<void> saveEducation(Map<String, dynamic> data, String token) async {
    await savePortfolio({
      'degree': data['degree'],
      'institution': data['institution'],
      'gpa': data['gpa'],
      'educationStartDate': data['startDate'],
      'educationEndDate': data['endDate'],
    }, token);
  }

  Future<void> saveTestScores(Map<String, dynamic> data, String token) async {
    await savePortfolio({
      'testType': data['testType'],
      'testScore': data['score'],
      'testDate': data['testDate'],
    }, token);
  }

  Future<void> saveFinancial(Map<String, dynamic> data, String token) async {
    await savePortfolio({
      'financialField': data['yourField'],
      'annualBudget': double.tryParse(data['budget'] ?? '0') ?? 0.0,
    }, token);
  }

  Future<void> saveInterests(Map<String, dynamic> data, String token) async {
    await savePortfolio({
      'interests': data['interest'],
    }, token);
  }

  Future<void> savePreferences(Map<String, dynamic> data, String token) async {
    await savePortfolio({
      'preferredCountries': data['country'],
      'preferredPrograms': data['program'],
    }, token);
  }

  Map<String, dynamic> _handleResponse(http.Response response) {
    final data = jsonDecode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return data;
    } else {
      throw Exception(data['message'] ?? 'Request failed');
    }
  }
}