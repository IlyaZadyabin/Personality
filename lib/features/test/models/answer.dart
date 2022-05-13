import 'package:json_annotation/json_annotation.dart';

part 'answer.g.dart';

enum AnswerType {
  @JsonValue("extrovert")
  extrovert,
  @JsonValue("introvert")
  introvert,
}

@JsonSerializable()
class Answer {
  Answer(this.answer, this.type);

  String answer;
  AnswerType type;

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerToJson(this);
}
