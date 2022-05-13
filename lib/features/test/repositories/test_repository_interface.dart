import 'package:personality/features/test/models/question.dart';

abstract class TestRepositoryInterface {
  Future<List<Question>> getQuestions();
}
