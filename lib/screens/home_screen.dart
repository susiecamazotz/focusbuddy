import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const maxSeconds = 25 * 60;
  int seconds = maxSeconds;
  Timer? timer;

  void startTimer() {
    if (timer == null || !timer!.isActive) {
      timer = Timer.periodic(Duration(seconds: 1), (_) {
        if (seconds > 0) {
          setState(() {
            seconds--;
          });
        } else {
          timer?.cancel();
        }
      });
    }
  }

  void cancelTimer() {
    if (timer != null && timer!.isActive) {
      timer?.cancel();
    }
    setState(() {
      seconds = maxSeconds;
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                '${(seconds ~/ 60).toString().padLeft(2, '0')}:${(seconds % 60).toString().padLeft(2, '0')}',
                style: TextStyle(fontSize: 92, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/pets/cat.png',
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: startTimer,
                child: Text('START'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20), // Spacing between buttons
              ElevatedButton(
                onPressed: cancelTimer,
                child: Text('CANCEL'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  textStyle:
                      TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
