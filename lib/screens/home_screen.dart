import 'package:flutter/material.dart';
import 'dart:async';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:vibration/vibration.dart';

const int minTime = 10;
const int maxTime = 120;
const cozyGreen = Color(0xFF3D8361); // Define the cozy green color

class HomeScreen extends StatefulWidget {
  final Function(bool)? onTimerToggle;

  const HomeScreen({super.key, this.onTimerToggle});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> _timeNotifier = ValueNotifier<int>(minTime * 60);
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_timeNotifier.value > 0) {
        _timeNotifier.value--;
      } else {
        _timer?.cancel();
        Vibration.vibrate(pattern: [500, 1000, 500, 2000]);
        widget.onTimerToggle?.call(false);
      }
    });
    Vibration.vibrate(pattern: [0, 500]);
    widget.onTimerToggle?.call(true);
  }

  void cancelTimer() {
    _timer?.cancel();
    _timeNotifier.value = minTime * 60;
    widget.onTimerToggle?.call(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Focus Buddy'),
        backgroundColor: cozyGreen,
        leading: _timer?.isActive ?? false ? Container() : null,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircularSlider(),
            TimerText(timeNotifier: _timeNotifier),
          ],
        ),
      ),
      floatingActionButton: TimerFAB(
        isTimerActive: _timer?.isActive ?? false,
        startTimer: startTimer,
        cancelTimer: cancelTimer,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class CircularSlider extends StatefulWidget {
  const CircularSlider({super.key});

  @override
  State<CircularSlider> createState() => _CircularSliderState();
}

class _CircularSliderState extends State<CircularSlider> {
  double _currentSliderValue = minTime.toDouble();

  @override
  Widget build(BuildContext context) {
    double sliderSize = MediaQuery.of(context).size.width * 0.8;
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        SleekCircularSlider(
          appearance: CircularSliderAppearance(
            size: sliderSize,
            angleRange: 360,
            startAngle: 90,
            customWidths: CustomSliderWidths(
              trackWidth: 4,
              progressBarWidth: 15,
              handlerSize: 8,
            ),
            customColors: CustomSliderColors(
              trackColor: Colors.grey[300],
              progressBarColor: cozyGreen,
              dotColor: cozyGreen,
            ),
            infoProperties: InfoProperties(
              mainLabelStyle: const TextStyle(
                fontSize: 20,
                color: Colors.transparent,
              ),
            ),
          ),
          initialValue: _currentSliderValue,
          min: minTime.toDouble(),
          max: maxTime.toDouble(),
          onChangeEnd: (double value) {
            setState(() {
              _currentSliderValue = (value ~/ 5) * 5;
              context
                  .findAncestorStateOfType<_HomeScreenState>()
                  ?._timeNotifier
                  .value = _currentSliderValue.toInt() * 60;
            });
          },
        ),
        CatImage(sliderSize: sliderSize),
      ],
    );
  }
}

class CatImage extends StatelessWidget {
  final double sliderSize;

  const CatImage({super.key, required this.sliderSize});

  @override
  Widget build(BuildContext context) {
    // This is where you would add your cat image asset
    // Make sure to add your actual cat image asset path in 'assets/pets/cat.png'
    return Container(
      width: sliderSize,
      height: sliderSize,
      padding: const EdgeInsets.all(20),
      child: Image.asset(
        'assets/pets/cat.png',
        fit: BoxFit.contain,
      ),
    );
  }
}

class TimerText extends StatelessWidget {
  final ValueNotifier<int> timeNotifier;

  const TimerText({super.key, required this.timeNotifier});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: timeNotifier,
      builder: (context, value, child) {
        return Text(
          '${(value ~/ 60).toString().padLeft(2, '0')}:${(value % 60).toString().padLeft(2, '0')}',
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        );
      },
    );
  }
}

class TimerFAB extends StatelessWidget {
  final bool isTimerActive;
  final VoidCallback startTimer;
  final VoidCallback cancelTimer;

  const TimerFAB({
    super.key,
    required this.isTimerActive,
    required this.startTimer,
    required this.cancelTimer,
  });

  @override
  Widget build(BuildContext context) {
    return isTimerActive
        ? FloatingActionButton.extended(
            onPressed: cancelTimer,
            icon: const Icon(Icons.pause),
            label: const Text('CANCEL'),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          )
        : FloatingActionButton.extended(
            onPressed: startTimer,
            icon: const Icon(Icons.play_arrow),
            label: const Text('START'),
            backgroundColor: cozyGreen,
            foregroundColor: Colors.white,
          );
  }
}
