import 'package:dio/dio.dart';
import 'package:test2/model/weather_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService(this.dio);

  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      var response = await dio.get(
        'http://api.weatherapi.com/v1/forecast.json?key=8f823176451943fc931214243241909&q=$cityName&days=5&aqi=no&alerts=no',
      );
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioError catch (dioError) {
      throw Exception('Network error: ${dioError.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
