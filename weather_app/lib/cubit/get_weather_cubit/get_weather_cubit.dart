import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test2/cubit/get_weather_cubit/get_weather_state.dart';
import 'package:test2/model/weather_model.dart';
import 'package:test2/service/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
      weatherModel = await WeatherService(Dio()).getWeather(cityName: cityName);

      emit(WeatherLoadedState(weatherModel!));
    } on Exception catch (e) {
      emit(WeatherFailureState(e.toString()));
      // TODO
    }
  }
}
