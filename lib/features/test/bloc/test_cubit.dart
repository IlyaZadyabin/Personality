import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:personality/features/test/models/answer.dart';
import 'package:personality/features/test/models/question.dart';
import 'package:personality/features/test/repositories/test_repository_interface.dart';

part 'test_state.dart';

class TestCubit extends Cubit<TestState> {
  final TestRepositoryInterface testRepository;
  final PageController pageController = PageController();

  TestCubit({required this.testRepository}) : super(TestInitialState());

  void loadQuestions() async {
    var questions = await testRepository.getQuestions();
    emit(TestProcessState(
        currentQuestionNumber: 0,
        introvertAnswersAmount: 0,
        questions: questions));
  }

  void answerForQuestion({required int answerNumber}) {
    var curState = (state as TestProcessState);

    var isAnswerIntrovert = curState.questions[curState.currentQuestionNumber]
            .answers[answerNumber].type ==
        AnswerType.introvert;

    var introvertAnswerAmount =
        curState.introvertAnswersAmount + (isAnswerIntrovert ? 1 : 0);

    if (curState.currentQuestionNumber >= curState.questions.length - 1) {
      var result = introvertAnswerAmount / curState.questions.length > 0.5
          ? 'introvert'
          : 'extrovert';
      emit(TestDoneState(result: result));
    } else {
      var nextPage = (pageController.page?.toInt() ?? 0) + 1;
      pageController.animateToPage(nextPage,
          duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
      emit(curState.copyWith(
          introvertAnswersAmount: introvertAnswerAmount,
          currentQuestionNumber: curState.currentQuestionNumber + 1));
    }
  }
}
