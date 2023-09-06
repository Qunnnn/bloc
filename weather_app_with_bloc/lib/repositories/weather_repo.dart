import '../core/exceptions/weather_exceptions.dart';
import '../core/services/weather_api_service.dart';
import '../models/custom_error.dart';
import '../models/weather.dart';

class WeatherRepository {
  final WeatherApiServices weatherApiServices;
  WeatherRepository({
    required this.weatherApiServices,
  });

  Future<Weather> fetchWeather(String city) async {
    try {
      final int woeid = await weatherApiServices.getWoeid(city);
      print('woeid: $woeid');

      final Weather weather = await weatherApiServices.getWeather(woeid);
      print('weather: $weather');

      return weather;
    } on WeatherException catch (e) {
      throw CustomError(msg: e.message);
    } catch (e) {
      throw CustomError(msg: e.toString());
    }
  }
}
