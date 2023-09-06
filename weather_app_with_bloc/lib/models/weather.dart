import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather extends Equatable {
  final String weatherStateName;
  final String weatherStateAbbr;
  final String created;
  final double minTemp;
  final double maxTemp;
  final double theTemp;
  final String title;
  final int woeid;
  final DateTime lastUpdated;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  const Weather({
    required this.weatherStateName,
    required this.weatherStateAbbr,
    required this.created,
    required this.minTemp,
    required this.maxTemp,
    required this.theTemp,
    required this.title,
    required this.woeid,
    required this.lastUpdated,
  });
  factory Weather.initial() => Weather(
        weatherStateName: '',
        weatherStateAbbr: '',
        created: '',
        minTemp: 100.0,
        maxTemp: 100.0,
        theTemp: 100.0,
        title: '',
        woeid: -1,
        lastUpdated: DateTime(1970),
      );

  @override
  List<Object> get props {
    return [
      weatherStateName,
      weatherStateAbbr,
      created,
      minTemp,
      maxTemp,
      theTemp,
      title,
      woeid,
      lastUpdated,
    ];
  }

  @override
  bool get stringify => true;
}
