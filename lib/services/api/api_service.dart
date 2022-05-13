import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:personality/config/api_config.dart';
import 'package:personality/features/test/models/question.dart';
import 'package:personality/services/api/api_service_interface.dart';

class ApiService implements ApiServiceInterface {
  final Dio dio;
  final DioAdapter dioAdapter;

  static const url = ApiConfig.endpointQuestions;

  ApiService({required this.dio, required this.dioAdapter});

  @override
  Future<List<Question>> getQuestions() async {
    return [
      for (var question in (await dio.get(url)).data)
        Question.fromJson(question)
    ];
  }
}
