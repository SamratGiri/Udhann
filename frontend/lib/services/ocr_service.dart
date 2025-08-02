// lib/services/ocr_service.dart
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:io' show File, Platform;

class OcrService {
  String getBaseUrl() {
    if (kIsWeb) {
      return 'http://localhost:5001/api';
    } else if (!kIsWeb && Platform.isAndroid) {
      return 'http://10.0.2.2:5001/api';
    } else if (!kIsWeb && Platform.isIOS) {
      return 'http://localhost:5001/api';
    } else {
      return 'http://localhost:5001/api';
    }
  }

  Future<Map<String, dynamic>> processDocument(String filePath, String token) async {
    if (token.isEmpty) {
      throw Exception('Authentication token required');
    }

    try {
      Uint8List bytes;
      String fileName;
      
      if (kIsWeb) {
        // On web, filePath is actually the file name, and we need to handle this differently
        // For web, we should get bytes directly from the file picker result
        throw Exception('Web file upload not supported in this method. Use processDocumentFromBytes instead.');
      } else {
        // On mobile platforms, use File operations
        final file = File(filePath);
        bytes = await file.readAsBytes();
        fileName = filePath.contains('/') ? filePath.split('/').last : filePath.split('\\').last;
      }
      
      return await _uploadDocument(bytes, fileName, token);
    } catch (e) {
      throw Exception('Error processing document: $e');
    }
  }

  Future<Map<String, dynamic>> processDocumentFromBytes(Uint8List bytes, String fileName, String token) async {
    if (token.isEmpty) {
      throw Exception('Authentication token required');
    }

    try {
      return await _uploadDocument(bytes, fileName, token);
    } catch (e) {
      throw Exception('Error processing document: $e');
    }
  }

  Future<Map<String, dynamic>> _uploadDocument(Uint8List bytes, String fileName, String token) async {
    try {
      final url = '${getBaseUrl()}/ocr/process';
      print('OCR Service: Sending request to $url');
      print('OCR Service: File name: $fileName, File size: ${bytes.length} bytes');
      
      // Create multipart request
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(url),
      );
      
      // Add headers
      request.headers.addAll({
        'Authorization': 'Bearer $token',
      });
      
      print('OCR Service: Authorization header added');
      
      // Add file to request
      request.files.add(
        http.MultipartFile.fromBytes(
          'document',
          bytes,
          filename: fileName,
        ),
      );

      print('OCR Service: Sending multipart request...');

      // Send request
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      print('OCR Service: Response status: ${response.statusCode}');
      print('OCR Service: Response body: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return {
          'success': true,
          'rawText': responseData['rawText'] ?? '',
          'parsedData': responseData['parsedData'],
          'message': responseData['message'] ?? 'OCR processing completed'
        };
      } else {
        final errorData = json.decode(response.body);
        print('OCR Service: Error response: $errorData');
        throw Exception('OCR processing failed: ${errorData['message'] ?? response.reasonPhrase}');
      }
    } catch (e) {
      print('OCR Service: Exception caught: $e');
      throw Exception('Error processing document: $e');
    }
  }

  // Helper method to auto-fill portfolio data from OCR results
  Map<String, String> extractPortfolioData(Map<String, dynamic> ocrResult) {
    final extractedData = <String, String>{};
    
    if (ocrResult['parsedData'] != null) {
      final parsedData = ocrResult['parsedData'];
      final documentType = parsedData['documentType'];
      final fields = parsedData['extractedFields'];
      
      if (documentType == 'transcript' && fields != null) {
        if (fields['gpa'] != null) extractedData['gpa'] = fields['gpa'];
        if (fields['institution'] != null) extractedData['institution'] = fields['institution'];
        if (fields['degree'] != null) extractedData['degree'] = fields['degree'];
      } else if (documentType == 'testScore' && fields != null) {
        if (fields['testType'] != null) extractedData['testType'] = fields['testType'];
        if (fields['score'] != null) extractedData['score'] = fields['score'];
      } else if (documentType == 'financial' && fields != null) {
        if (fields['balance'] != null) extractedData['budget'] = fields['balance'];
      }
    }
    
    return extractedData;
  }
}