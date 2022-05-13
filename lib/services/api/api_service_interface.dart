import 'package:personality/features/test/models/question.dart';

abstract class ApiServiceInterface {
  Future<List<Question>> getQuestions();
}
