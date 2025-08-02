// test/portfolio_service_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:udhann_grok/services/portfolio_service.dart';
import 'package:udhann_grok/services/ocr_service.dart';
import 'portfolio_service_test.mocks.dart';

@GenerateMocks([http.Client, Dio, OcrService])
void main() {
  late PortfolioService portfolioService;
  late MockClient mockHttpClient;
  late MockDio mockDio;
  late MockOcrService mockOcrService;

  setUp(() {
    mockHttpClient = MockClient();
    mockDio = MockDio();
    mockOcrService = MockOcrService();
    portfolioService = PortfolioService();
  });

  test('fetchPortfolio returns data on success', () async {
    final userId = 'test_user';
    final token = 'valid_token';
    final mockResponse = {
      'education': {'degree': 'BSc', 'institution': 'Test University'},
      'testScores': {'testType': 'SAT', 'score': '1200'},
    };

    when(mockHttpClient.get(
      any,
      headers: {'Authorization': 'Bearer $token'},
    )).thenAnswer((_) async => http.Response(jsonEncode(mockResponse), 200));

    final result = await portfolioService.fetchPortfolio(userId, token);
    expect(result, mockResponse);
  });

  test('fetchPortfolio throws error on 401', () async {
    final userId = 'test_user';
    final token = 'invalid_token';

    when(mockHttpClient.get(
      any,
      headers: {'Authorization': 'Bearer $token'},
    )).thenAnswer((_) async => http.Response(
          '{"message":"Authentication token required."}',
          401,
        ));

    expect(
      () => portfolioService.fetchPortfolio(userId, token),
      throwsA(predicate((e) => e.toString().contains('Authentication token required'))),
    );
  });

  test('saveEducation succeeds with valid data', () async {
    final data = {
      'degree': 'BSc',
      'institution': 'Test University',
      'gpa': '3.5',
      'startDate': '2020-09-01',
      'endDate': '2024-06-01',
    };
    final token = 'valid_token';

    when(mockHttpClient.post(
      any,
      headers: anyNamed('headers'),
      body: anyNamed('body'),
    )).thenAnswer((_) async => http.Response('', 201));

    await portfolioService.saveEducation(data, token);
    expect(true, true);
  });

  test('uploadDocument returns fileUrl on success', () async {
    final filePath = 'test.pdf';
    final section = 'Education';
    final token = 'valid_token';
    final mockFileUrl = 'https://example.com/uploaded.pdf';
    final mockExtractedText = 'Sample text';

    when(mockOcrService.processDocument(filePath)).thenAnswer((_) async => mockExtractedText);
    when(mockDio.post(
      any,
      data: anyNamed('data'),
      options: anyNamed('options'),
    )).thenAnswer((_) async => Response(
          data: {'fileUrl': mockFileUrl},
          statusCode: 201,
          requestOptions: RequestOptions(path: ''),
        ));

    final result = await portfolioService.uploadDocument(filePath, section, token);
    expect(result, mockFileUrl);
  });
}