import 'package:json_annotation/json_annotation.dart';
import 'package:personality/features/test/models/answer.dart';

part 'question.g.dart';

@JsonSerializable()
class Question {
  Question(this.question, this.answers);

  String question;
  List<Answer> answers;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
