import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'dart:async';
import 'package:vibration/vibration.dart';

const int timerDuration = 25;
const cozyGreen = Color(0xFF3D8361);

class HomeScreen extends StatefulWidget {
  final Function(bool)? onTimerToggle;

  const HomeScreen({super.key, this.onTimerToggle});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> _timeNotifier =
      ValueNotifier<int>(timerDuration * 60);
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
    _timeNotifier.value = timerDuration * 60;
    widget.onTimerToggle?.call(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: _timer?.isActive ?? false ? Container() : null,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _timer?.isActive ?? false
                ? SizedBox(
                    height: 275,
                    child: AnalogClock(
                        dateTime: DateTime.now(),
                        hourHandColor: Colors.white,
                        minuteHandColor: Colors.white,
                        secondHandColor: Colors.white,
                        dialBorderColor: Colors.transparent,
                        dialColor: Colors.transparent,
                        hourNumberColor: Colors.white,
                        markingColor: Colors.white,
                        centerPointColor: Colors.white))
                : const CatImage(),
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

class CatImage extends StatelessWidget {
  const CatImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          height: 250,
          child: Image.asset(
            'assets/pets/cat_icon.png',
            fit: BoxFit.contain,
            color: Colors.white,
          ),
        ));
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
            backgroundColor: Colors.transparent,
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
