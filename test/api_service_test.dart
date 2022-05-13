import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:personality/config/api_config.dart';
import 'package:personality/features/test/models/answer.dart';
import 'package:personality/services/api/api_service.dart';

void main() {
  test('Test api', () async {
    final Dio dio = Dio();
    final DioAdapter dioAdapter = DioAdapter(dio: dio);
    dioAdapter.onGet(
      ApiConfig.endpointQuestions,
      (server) => server.reply(200, [
        {
          'question':
              'You’re really busy at work and a colleague is telling you their life story and personal woes. You:',
          'answers': [
            {
              'answer': 'Don’t dare to interrupt them',
              'type': 'extrovert',
            },
          ]
        },
      ]),
    );

    final apiServer = ApiService(dio: dio, dioAdapter: dioAdapter);
    var questions = await apiServer.getQuestions();
    expect(questions.first.answers.first.type, AnswerType.extrovert);
  });
}
