// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wether/cubits/weather_cubit.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
  SearchPage({super.key, this.updateUi});
  VoidCallback? updateUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data)
            {
               cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;

              BlocProvider.of<WeatherCubit>(context).getWeather(cityName!);
              BlocProvider.of<WeatherCubit>(context).CityName = cityName;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              label: const Text('search'),
              suffixIcon: GestureDetector(
                
                onTap : () async 
                {
                    WeatherService service = WeatherService();

              WeatherModel? weather =
            await service.getWeather(cityName: cityName!);

              BlocProvider.of<WeatherCubit>(context,listen: false).weatherModel = weather;
                           BlocProvider.of<WeatherCubit>(context,listen: false).CityName = cityName;

              Navigator.pop(context);
                },
                child: const Icon(Icons.search)),
              border: const OutlineInputBorder(),
              hintText: 'Enter a city',
            ),
          ),
        ),
      ),
    );
  }
}

