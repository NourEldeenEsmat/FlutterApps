import 'package:wether/cubits/weather_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wether/models/weather_model.dart';
import 'package:wether/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherSearch());
  WeatherService weatherService;
  String? CityName;
  WeatherModel? weatherModel;
  void getWeather(String cityName) async {
    emit(WeatherLoading());
    try {
      weatherModel = await weatherService.getWeather(cityName: cityName);
      emit(WeatherSuccess());
    } on Exception catch (e) {
      emit(WeatherFailure());
    }
  }
}
