import 'package:climaapp/src/widgets/custom_card_clima.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather/weather.dart';

enum AppState { NOT_DOWNLOADED, DOWNLOADING, FINISHED_DOWNLOADING }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const String API_KEY = '41176dfd0287c2f74238bb8996f5c104';
  WeatherFactory ws;
  Weather data;
  AppState _state = AppState.DOWNLOADING;

  @override
  void initState() {
    super.initState();
    ws = WeatherFactory(API_KEY, language: Language.SPANISH);
    queryWeather('Cordoba');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.blue[800]),
        body: _resultView(),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue[800],
            child: Icon(Icons.add, color: Colors.white),
            onPressed: () => queryWeather('Cordoba')),
        drawer: Drawer(),
      ),
    );
  }

  Widget _resultView() {
    if (_state == AppState.FINISHED_DOWNLOADING) {
      return contentFinishedDownload();
    } else if (_state == AppState.DOWNLOADING) {
      return contentDownloading();
    } else
      return contentNotDownloaded();
  }

  Widget contentDownloading() {
    return Shimmer.fromColors(
        period: Duration(milliseconds: 300),
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: double.infinity,
              height: 270,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(25)),
            )),
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[50]);
  }

  Widget contentFinishedDownload() {
    return TarjetaClima(
      ciudad: data.areaName,
      pais: data.country,
      tempMin: data.tempMin.celsius.round().toString(),
      tempActual: data.temperature.celsius.round().toString(),
      tempMax: data.tempMax.celsius.round().toString(),
      dia: data.date.day.toString(),
      mes: data.date.month.toString(),
      anio: data.date.year.toString(),
      icono: data.weatherIcon,
      weatherDescription: data.weatherDescription,
    );
  }

  Widget contentNotDownloaded() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'No hay internet',
          ),
        ],
      ),
    );
  }

  void queryWeather(String ciudad) async {
    setState(() {
      _state = AppState.DOWNLOADING;
    });

    Weather weather = await ws.currentWeatherByCityName(ciudad);
    setState(() {
      data = weather;
      _state = AppState.FINISHED_DOWNLOADING;
    });
  }
}
