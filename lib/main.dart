import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter sensors',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List? accelerometer;
  List? gyroscope;

  String accel1 = '';
  String accel2 = '';
  String accel3 = '';

  String gyro1 = '';
  String gyro2 = '';
  String gyro3 = '';

  @override
  void initState() {
    super.initState();

    accelerometerEvents.listen(
      (event) {
        setState(
          () {
            accelerometer = <double>[event.x, event.y, event.z];
            accel1 = ((accelerometer![0] * 100).round() / 100).toString();
            accel2 = ((accelerometer![1] * 100).round() / 100).toString();
            accel3 = ((accelerometer![2] * 100).round() / 100).toString();
          },
        );
      },
    );

    gyroscopeEvents.listen(
      (event) {
        setState(
          () {
            gyroscope = <double>[event.x, event.y, event.z];
            gyro1 = ((gyroscope![0] * 100).round() / 100).toString();
            gyro2 = ((gyroscope![1] * 100).round() / 100).toString();
            gyro3 = ((gyroscope![2] * 100).round() / 100).toString();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Accelerometer'),
            (accelerometer == null)
                ? const Text('')
                : Text(
                    '$accel1, $accel2, $accel3',
                  ),
            const SizedBox(
              height: 50,
            ),
            const Text('Gyroscope'),
            (gyroscope == null)
                ? const Text('')
                : Text(
                    '$gyro1, $gyro2, $gyro3',
                  ),
          ],
        ),
      ),
    );
  }
}
