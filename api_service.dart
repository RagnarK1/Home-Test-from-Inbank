import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = 'http://localhost:8080';
  String responseAmount = '';
  String responsePeriod = '';
  String responseError = '';
  http.Client httpClient;

  ApiService({http.Client? client}) : httpClient = client ?? http.Client();

  Future<Map<String, String>> requestLoanDecision(
      String personalCode, int loanAmount, int loanPeriod) async {
    final response = await httpClient.post(
      Uri.parse('$_baseUrl/loan/decision'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'personalCode': personalCode,
        'loanAmount': loanAmount,
        'loanPeriod': loanPeriod,
      }),
    );

    try {
      final responseData = jsonDecode(response.body) as Map<String, dynamic>;

      responseAmount = responseData['loanAmount']?.toString() ?? '0';
      responsePeriod = responseData['loanPeriod']?.toString() ?? '0';
      responseError = responseData['errorMessage'] ?? '';

      // Handle 403 Forbidden separately
      if (response.statusCode == 403) {
        responseError = responseData['errorMessage'] ?? 'Loan rejected due to age restrictions.';
      }

      return {
        'loanAmount': responseAmount,
        'loanPeriod': responsePeriod,
        'errorMessage': responseError,
      };
    } catch (e) {
      responseAmount = '0';
      responsePeriod = '0';
      responseError = 'An unexpected error occurred.';

      return {
        'loanAmount': responseAmount,
        'loanPeriod': responsePeriod,
        'errorMessage': responseError,
      };
    }
  }
}