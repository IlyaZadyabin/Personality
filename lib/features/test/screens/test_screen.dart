import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personality/config/app_router.dart';
import 'package:personality/config/core_styles.dart';
import 'package:personality/features/test/bloc/test_cubit.dart';
import 'package:personality/features/test/screens/question_screen.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  late TestCubit testCubit;

  @override
  void initState() {
    super.initState();

    testCubit = BlocProvider.of<TestCubit>(context);
    testCubit.loadQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer(
        listener: (BuildContext context, Object? state) {
          if (state is TestDoneState) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(Routes.result, (route) => false);
          }
        },
        bloc: testCubit,
        builder: (context, state) {
          return Stack(
            children: [
              if (state is TestProcessState)
                PageView.builder(
                    controller: testCubit.pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, idx) {
                      return QuestionScreen(
                        question: state.questions[idx],
                        onSelectAnswer: (int answerNumber) {
                          testCubit.answerForQuestion(
                              answerNumber: answerNumber);
                        },
                      );
                    }),
              if (state is TestProcessState)
                SafeArea(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: '0${state.currentQuestionNumber + 1}/',
                            style: Theme.of(context).textTheme.subtitle2,
                            children: [
                              TextSpan(
                                  text: '0${state.questions.length}',
                                  style: Theme.of(context).textTheme.bodyText1)
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        LinearProgressIndicator(
                          value: (state.currentQuestionNumber + 1) /
                              state.questions.length,
                          color: CoreStyles.black,
                          backgroundColor: CoreStyles.grey,
                          minHeight: 10,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
