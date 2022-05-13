import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:personality/config/core_styles.dart';
import 'package:personality/features/test/models/question.dart';
import 'package:personality/features/test/widgets/answer_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(
      {Key? key, required this.question, required this.onSelectAnswer})
      : super(key: key);

  final void Function(int) onSelectAnswer;
  final Question question;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int? selectedAnswerNumber;

  void _pressToggleButton(int selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      selectedAnswerNumber = selectedAnswer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 70),
            color: Colors.white,
            child: SafeArea(
              bottom: false,
              child: Center(
                child: AutoSizeText(
                  widget.question.question,
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      ?.copyWith(color: CoreStyles.black),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 16),
            color: CoreStyles.black,
            child: SafeArea(
              top: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ToggleButton(
                    onPressed: () => _pressToggleButton(0),
                    text: widget.question.answers[0].answer,
                    isSelected: selectedAnswerNumber == 0,
                    number: 'a',
                  ),
                  const SizedBox(height: 16),
                  ToggleButton(
                    onPressed: () => _pressToggleButton(1),
                    text: widget.question.answers[1].answer,
                    isSelected: selectedAnswerNumber == 1,
                    number: 'b',
                  ),
                  const SizedBox(height: 16),
                  ToggleButton(
                    onPressed: () => _pressToggleButton(2),
                    text: widget.question.answers[2].answer,
                    isSelected: selectedAnswerNumber == 2,
                    number: 'c',
                  ),
                  const SizedBox(height: 16),
                  ToggleButton(
                    onPressed: () => _pressToggleButton(3),
                    text: widget.question.answers[3].answer,
                    isSelected: selectedAnswerNumber == 3,
                    number: 'd',
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
