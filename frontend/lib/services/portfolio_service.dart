
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

class PortfolioService {
  String getBaseUrl() {
    if (kIsWeb) {
      return 'http://localhost:5001/api';
    } else if (Platform.isAndroid) {
      return 'http://10.0.2.2:5000/api';
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

  // Placeholder for file upload (backend support needed)
  Future<String> uploadDocument(String filePath, String sectionName, String token) async {
    final dio = Dio();
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(filePath, filename: filePath.split('/').last),
      'section': sectionName,
    });
    try {
      final response = await dio.post(
        '${getBaseUrl()}/upload',
        data: formData,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      return response.data['fileUrl'];
    } catch (e) {
      throw Exception('File upload not supported by backend: $e');
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