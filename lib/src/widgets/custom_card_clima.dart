import 'package:flutter/material.dart';

class TarjetaClima extends StatelessWidget {
  final String ciudad;
  final String pais;
  final String weatherDescription;
  final String dia;
  final String mes;
  final String anio;
  final String icono;
  final String tempMin;
  final String tempActual;
  final String tempMax;

  TarjetaClima(
      {@required this.ciudad,
      @required this.pais,
      @required this.weatherDescription,
      @required this.dia,
      @required this.mes,
      @required this.anio,
      @required this.icono,
      @required this.tempMin,
      @required this.tempActual,
      @required this.tempMax});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 270,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blue[400], Colors.blue[800]]),
            borderRadius: BorderRadius.circular(25)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.room, color: Colors.white, size: 14),
              Text(ciudad != null && pais != null ? '$ciudad $pais' : '--',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              Image.network(icono != null
                  ? 'http://openweathermap.org/img/wn/$icono@2x.png'
                  : ''),
              Text(weatherDescription != null ? '$weatherDescription' : '--',
                  style: TextStyle(color: Colors.white, fontSize: 12)),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(tempMin != null ? '$tempMin°' : '--°',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.5), fontSize: 25)),
                  SizedBox(width: 10),
                  Text(tempActual != null ? '$tempActual°' : '--°',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold)),
                  SizedBox(width: 10),
                  Text(tempMax != null ? '$tempMax°' : '--°',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.5), fontSize: 25)),
                ],
              ),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.schedule, color: Colors.white, size: 12),
                  SizedBox(width: 3),
                  Text(
                      dia != null && mes != null && anio != null
                          ? '$dia/$mes/$anio'
                          : '--/--/--',
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
