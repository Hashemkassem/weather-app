import 'dart:ui';

import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constant/constant.dart';
import '../bloc/weather_bloc.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        flexibleSpace: ClipRRect(
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10))),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Weather App',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 25),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            color: Color(0xff1D1F22),
            image: DecorationImage(
                image: AssetImage('images/2.jpg'), fit: BoxFit.cover)),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Enter city name',
                        fillColor: const Color(0xffF3F3F3).withOpacity(0.5),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      onChanged: (query) {
                        context.read<WeatherBloc>().add(OnCityChange(query));
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 32.0),
                BlocBuilder<WeatherBloc, WeatherState>(
                  builder: (context, state) {
                    if (state is WeatherLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is WeatherLoaded) {
                      return Column(
                        key: const Key('weather_data'),
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                state.result.cityname,
                                style: const TextStyle(
                                    fontSize: 22.0, color: Colors.white),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '${(state.result.tempreture.toInt() - 273)}°',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 48.0,
                                        letterSpacing: 1.2,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Image(
                                    image: NetworkImage(
                                      Urls.weatherIcon(
                                        state.result.iconCode,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            ' ${state.result.description}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 24.0),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.height * 0.06),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          'Humidity',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0,
                                            letterSpacing: 1.2,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 24.0),
                                      CircularPercentIndicator(
                                        animation: true,
                                        animationDuration: 1000,
                                        radius: 60,
                                        lineWidth: 12,
                                        percent:
                                            state.result.humidity.toDouble() /
                                                100,
                                        progressColor: Colors.black,
                                        backgroundColor: Colors.black12,
                                        circularStrokeCap:
                                            CircularStrokeCap.round,
                                        center: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '${state.result.humidity}%',
                                            style: const TextStyle(
                                              fontSize: 16.0,
                                              letterSpacing: 1.2,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          'Pressure',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0,
                                            letterSpacing: 1.2,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 24.0),
                                      CircularPercentIndicator(
                                        animation: true,
                                        animationDuration: 1000,
                                        radius: 60,
                                        lineWidth: 12,
                                        percent:
                                            state.result.pressure.toDouble() /
                                                10000,
                                        progressColor: Colors.black,
                                        backgroundColor: Colors.black12,
                                        circularStrokeCap:
                                            CircularStrokeCap.round,
                                        center: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '${state.result.pressure}%',
                                            style: const TextStyle(
                                              fontSize: 16.0,
                                              letterSpacing: 1.2,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    if (state is WeatherLoadFailure) {
                      return Center(
                        child: Text(state.message),
                      );
                    }
                    return Container();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
