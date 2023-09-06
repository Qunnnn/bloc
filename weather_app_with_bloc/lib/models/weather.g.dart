// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      weatherStateName: json['weatherStateName'] as String,
      weatherStateAbbr: json['weatherStateAbbr'] as String,
      created: json['created'] as String,
      minTemp: (json['minTemp'] as num).toDouble(),
      maxTemp: (json['maxTemp'] as num).toDouble(),
      theTemp: (json['theTemp'] as num).toDouble(),
      title: json['title'] as String,
      woeid: json['woeid'] as int,
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'weatherStateName': instance.weatherStateName,
      'weatherStateAbbr': instance.weatherStateAbbr,
      'created': instance.created,
      'minTemp': instance.minTemp,
      'maxTemp': instance.maxTemp,
      'theTemp': instance.theTemp,
      'title': instance.title,
      'woeid': instance.woeid,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
    };
