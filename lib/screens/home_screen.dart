import 'package:flutter/material.dart';
import 'dart:async';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class HomeScreen extends StatefulWidget {
  final Function(bool)? onTimerToggle; // Callback function

  const HomeScreen({super.key, this.onTimerToggle});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentSliderValue =
      10; // Initialize with the minimum value i.e., 10 minutes
  late int seconds; // Declared as late
  Timer? timer;

  @override
  void initState() {
    super.initState();
    seconds = _currentSliderValue * 60;
  }

  void startTimer() {
    timer?.cancel(); // Cancel any existing timers
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (seconds > 0) {
        setState(() {
          seconds--;
        });
      } else {
        timer?.cancel();
        widget.onTimerToggle?.call(false); // Inform that the timer has stopped
      }
    });
    widget.onTimerToggle?.call(true); // Inform that the timer has started
  }

  void cancelTimer() {
    timer?.cancel();
    setState(() {
      seconds = _currentSliderValue * 60;
    });
    widget.onTimerToggle?.call(false); // Inform that the timer has stopped
  }

  @override
  Widget build(BuildContext context) {
    bool isTimerActive = timer?.isActive ?? false;
    double sliderSize = MediaQuery.of(context).size.width *
        0.8; // Example size, adjust as needed

    return Scaffold(
      appBar: AppBar(
        title: const Text('Focus Buddy'),
        leading: isTimerActive
            ? Container()
            : null, // Hide back button when timer is active
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Circular Slider with Cat Image in the center
          Stack(
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
                    progressBarColor: Colors.green,
                    dotColor: Colors.green,
                  ),
                  infoProperties: InfoProperties(
                    mainLabelStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.transparent,
                    ),
                  ),
                ),
                initialValue: _currentSliderValue.toDouble(),
                min: 10,
                max: 120,
                onChange: (double value) {
                  setState(() {
                    _currentSliderValue = (value ~/ 5) * 5;
                    seconds = _currentSliderValue * 60;
                  });
                },
                innerWidget: (double value) {
                  return const SizedBox();
                },
              ),
              Container(
                width: sliderSize /
                    2, // Adjust the size of the cat image as needed
                height: sliderSize / 2,
                padding: const EdgeInsets.all(
                    20), // Add some padding to avoid overlaying the slider track
                child: Image.asset(
                  'assets/pets/cat.png',
                  fit: BoxFit
                      .contain, // Ensure the image maintains its aspect ratio
                ),
              ),
            ],
          ),
          // Timer Text below the Circular Slider
          const SizedBox(
              height:
                  50), // Provide some spacing between the slider and the timer text

          Text(
            '${(seconds ~/ 60).toString().padLeft(2, '0')}:${(seconds % 60).toString().padLeft(2, '0')}',
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: isTimerActive
          ? FloatingActionButton.extended(
              onPressed: cancelTimer,
              label: const Text('CANCEL'),
              backgroundColor: Colors.red,
            )
          : FloatingActionButton.extended(
              onPressed: startTimer,
              label: const Text('START'),
              backgroundColor: Colors.green,
            ),
    );
  }
}
