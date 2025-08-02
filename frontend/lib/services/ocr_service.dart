// lib/services/ocr_service.dart
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class OcrService {
  final Dio _dio = Dio();
  final String ocrApiUrl = 'https://api.ocr.space/parse/image';
  final String apiKey = dotenv.env['OCR_SPACE_API_KEY'] ?? '';

  Future<String> processDocument(String filePath) async {
    if (apiKey.isEmpty) {
      throw Exception('OCR API key is missing');
    }

    try {
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(filePath),
        'language': 'eng',
        'isOverlayRequired': false,
      });

      final response = await _dio.post(
        ocrApiUrl,
        data: formData,
        options: Options(
          headers: {'apikey': apiKey},
        ),
      );

      if (response.statusCode == 200 && response.data['IsErroredOnProcessing'] == false) {
        return response.data['ParsedResults'][0]['ParsedText'];
      } else {
        throw Exception('OCR processing failed: ${response.data['ErrorMessage']}');
      }
    } catch (e) {
      throw Exception('Error processing document: $e');
    }
  }
}