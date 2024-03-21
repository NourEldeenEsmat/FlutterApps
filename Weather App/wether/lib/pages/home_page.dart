import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wether/cubits/weather_cubit.dart';
import 'package:wether/cubits/weather_states.dart';
import 'package:wether/pages/search_page.dart';
import '../models/weather_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUi() {
    setState(() {});
  }

  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
      weatherData = BlocProvider.of<WeatherCubit>(context).weatherModel;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchPage(
                  updateUi: updateUi,
                );
              }));
            },
            icon: const Icon(Icons.search),
          ),
        ],
        title: const Text('Weather App'),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherSuccess) {
            return Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  weatherData!.getThemeColor(),
                  weatherData!.getThemeColor()[300]!,
                  weatherData!.getThemeColor()[100]!,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  Text(
                    BlocProvider.of<WeatherCubit>(context).CityName!,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'updated at : ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',
                    style: const TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        weatherData!.getImage(),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    '${weatherData!.temp.toInt().toString()} C⁰',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Text('maxTemp :${weatherData!.maxTemp.toInt()} C⁰'),
                      Text('minTemp : ${weatherData!.minTemp.toInt()} C⁰'),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    weatherData!.weatherStateName,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(
                    flex: 5,
                  ),
                ],
              ),
            );
          } else if (state is WeatherFailure) {
            return const Center(
              child: Text('some thing ronge'),
            );
          } else if (state is WeatherSearch){
            return const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '  there is no weather 😔 ',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'click on search  🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            );
          }else{return Text('data');}
        },
      ),
    );
  }
}
