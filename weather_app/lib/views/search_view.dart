// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:test2/model/weather_model.dart';
// import 'package:test2/service/weather_service.dart';

// class SearchView extends StatelessWidget {
//   const SearchView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Search City')),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: TextField(
//             onSubmitted: (value) async {
//               weatherModel = await WeatherService(
//                 Dio(),
//               ).getWeather(cityName: value);
//               log(value);
//               Navigator.pop(context);
//             },
//             decoration: InputDecoration(
//               labelText: 'Search',
//               hintText: 'Enter city name',
//               suffixIcon: Icon(Icons.search),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// WeatherModel? weatherModel;

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test2/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:test2/model/weather_model.dart';
import 'package:test2/service/weather_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search City')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            onSubmitted: (value) async {
              try {
                var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
                getWeatherCubit.getWeather(cityName: value);

                log('Weather fetched for $value');

                // رجّع النتيجة للصفحة اللي استدعت SearchView
                Navigator.pop(context);
              } catch (e) {
                log('Error: $e');
                // تقدر تعرض SnackBar أو Alert للمستخدم
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('City not found or error fetching weather.'),
                  ),
                );
              }
            },
            decoration: InputDecoration(
              labelText: 'Search',
              hintText: 'Enter city name',
              suffixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
