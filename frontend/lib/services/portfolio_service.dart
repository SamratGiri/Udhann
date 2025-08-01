// lib/services/portfolio_service.dart
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class PortfolioService {
  final String baseUrl = 'http://localhost:5001'; // Replace with your backend URL
  final Dio _dio = Dio(); // For file uploads

  // Fetch portfolio data for a user
  Future<Map<String, dynamic>> fetchPortfolio(String userId, String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/portfolio/$userId'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch portfolio: ${response.statusCode}');
    }
  }

  // Save Education section
  Future<void> saveEducation(Map<String, dynamic> data, String token) async {
    final response = await http.put(
      Uri.parse('$baseUrl/api/portfolio'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to save education: ${response.statusCode}');
    }
  }

  // Save Test Scores section
  Future<void> saveTestScores(Map<String, dynamic> data, String token) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/portfolio/test_scores'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to save test scores: ${response.statusCode}');
    }
  }

  // Save Financial section
  Future<void> saveFinancial(Map<String, dynamic> data, String token) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/portfolio/financial'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to save financial: ${response.statusCode}');
    }
  }

  // Save Interests section
  Future<void> saveInterests(Map<String, dynamic> data, String token) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/portfolio/interests'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to save interests: ${response.statusCode}');
    }
  }

  // Save Preferences section
  Future<void> savePreferences(Map<String, dynamic> data, String token) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/portfolio/preferences'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to save preferences: ${response.statusCode}');
    }
  }

  // Upload a document
  Future<String> uploadDocument(String filePath, String section, String token) async {
    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(filePath),
      'section': section,
    });

    final response = await _dio.post(
      '$baseUrl/api/portfolio/upload',
      data: formData,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    if (response.statusCode == 201) {
      return response.data['fileUrl']; // Assume backend returns the file URL
    } else {
      throw Exception('Failed to upload document: ${response.statusCode}');
    }
  }
}