// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventEntity _$EventEntityFromJson(Map<String, dynamic> json) => EventEntity(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      starts: EventEntity._timeStampToDate(json['starts'] as Timestamp),
      ends: EventEntity._timeStampToDate(json['ends'] as Timestamp),
      ownerUserId: json['ownerUserId'] as String,
      isAllDay: json['isAllDay'] as bool? ?? false,
    );

Map<String, dynamic> _$EventEntityToJson(EventEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'starts': EventEntity._dateToTimeStamp(instance.starts),
      'ends': EventEntity._dateToTimeStamp(instance.ends),
      'isAllDay': instance.isAllDay,
      'ownerUserId': instance.ownerUserId,
    };
