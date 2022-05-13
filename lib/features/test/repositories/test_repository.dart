import 'package:personality/features/test/models/question.dart';
import 'package:personality/features/test/repositories/test_repository_interface.dart';
import 'package:personality/services/api/api_service_interface.dart';

class TestRepository implements TestRepositoryInterface {
  final ApiServiceInterface apiService;

  TestRepository({required this.apiService});

  @override
  Future<List<Question>> getQuestions() {
    return apiService.getQuestions();
  }
}
