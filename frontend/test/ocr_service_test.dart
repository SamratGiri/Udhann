// test/ocr_service_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:udhann_grok/services/ocr_service.dart';
import 'ocr_service_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late OcrService ocrService;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    ocrService = OcrService();
  });

  test('processDocument returns text on success', () async {
    final filePath = 'test.pdf';
    final mockResponse = {
      'IsErroredOnProcessing': false,
      'ParsedResults': [
        {'ParsedText': 'Sample text from document'}
      ]
    };

    when(mockDio.post(
      any,
      data: anyNamed('data'),
      options: anyNamed('options'),
    )).thenAnswer((_) async => Response(
          data: mockResponse,
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        ));

    final result = await ocrService.processDocument(filePath);
    expect(result, 'Sample text from document');
  });

  test('processDocument throws error on failure', () async {
    final filePath = 'test.pdf';
    final mockResponse = {
      'IsErroredOnProcessing': true,
      'ErrorMessage': 'Invalid API key'
    };

    when(mockDio.post(
      any,
      data: anyNamed('data'),
      options: anyNamed('options'),
    )).thenAnswer((_) async => Response(
          data: mockResponse,
          statusCode: 400,
          requestOptions: RequestOptions(path: ''),
        ));

    expect(
      () => ocrService.processDocument(filePath),
      throwsA(predicate((e) => e.toString().contains('Invalid API key'))),
    );
  });
}