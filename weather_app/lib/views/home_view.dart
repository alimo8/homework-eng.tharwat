import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test2/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:test2/cubit/get_weather_cubit/get_weather_state.dart';
import 'package:test2/model/weather_model.dart';
import 'package:test2/views/search_view.dart';
import 'package:test2/widgets/no_weather_body.dart';
import 'package:test2/widgets/weather_info_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        backgroundColor: Colors.blueAccent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchView()),
                );
              },
              icon: const Icon(Icons.search, size: 30),
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return WeatherInfoBody(weatherModel: state.weatherModel);
          } else {
            return Text("There Was error");
          }
        },
      ),
    );
  }
}
