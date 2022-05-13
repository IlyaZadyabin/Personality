part of 'test_cubit.dart';

abstract class TestState extends Equatable {
  const TestState();
}

class TestInitialState extends TestState {
  @override
  List<Object> get props => [];
}

class TestProcessState extends TestState {
  final List<Question> questions;
  final int currentQuestionNumber;
  final int introvertAnswersAmount;

  const TestProcessState(
      {required this.currentQuestionNumber,
      required this.introvertAnswersAmount,
      required this.questions});

  @override
  List<Object> get props =>
      [questions, currentQuestionNumber, introvertAnswersAmount];

  TestProcessState copyWith({
    List<Question>? questions,
    int? currentQuestionNumber,
    int? introvertAnswersAmount,
  }) {
    return TestProcessState(
        questions: questions ?? this.questions,
        currentQuestionNumber:
            currentQuestionNumber ?? this.currentQuestionNumber,
        introvertAnswersAmount:
            introvertAnswersAmount ?? this.introvertAnswersAmount);
  }
}

class TestDoneState extends TestState {
  final String result;

  const TestDoneState({required this.result});

  @override
  List<Object> get props => [result];
}
