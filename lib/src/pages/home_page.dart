import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [_TarjetaClima()],
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.orange,
            child: Icon(Icons.add, color: Colors.white),
            onPressed: () {}),
        drawer: Drawer(),
      ),
    );
  }
}

class _TarjetaClima extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 250,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blue[300], Colors.blue[600]]),
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.room, color: Colors.white, size: 14),
              Text('Villa Giardino, Córdoba Argentina',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Icon(Icons.brightness_low, color: Colors.white, size: 60),
              SizedBox(height: 10),
              Text('Soleado',
                  style: TextStyle(color: Colors.white, fontSize: 8)),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('15°',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.5), fontSize: 25)),
                  SizedBox(width: 10),
                  Text('27°',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold)),
                  SizedBox(width: 10),
                  Text('30°',
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
                  Text('Lunes 3 de Agosto',
                      style: TextStyle(color: Colors.white, fontSize: 10)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
