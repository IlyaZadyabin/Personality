// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Answer _$AnswerFromJson(Map<String, dynamic> json) => Answer(
      json['answer'] as String,
      $enumDecode(_$AnswerTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$AnswerToJson(Answer instance) => <String, dynamic>{
      'answer': instance.answer,
      'type': _$AnswerTypeEnumMap[instance.type],
    };

const _$AnswerTypeEnumMap = {
  AnswerType.extrovert: 'extrovert',
  AnswerType.introvert: 'introvert',
};
