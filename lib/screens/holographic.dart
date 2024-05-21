import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' hide Colors;
import 'package:dchs_motion_sensors/dchs_motion_sensors.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Holo(),
    );
  }
}

class Holo extends StatefulWidget {
  const Holo({super.key});

  @override
  State<Holo> createState() => _HoloState();
}

class _HoloState extends State<Holo> {

  // Vector3 _gyroscope = Vector3.zero();

  // @override
  // void initState() {
  //   super.initState();
  //   motionSensors.gyroscope.listen((GyroscopeEvent event) {
  //     setState(() {
  //       _gyroscope.setValues(event.x, event.y, event.z);
  //     });
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    final Stream<AbsoluteOrientationEvent> stream =
        motionSensors.absoluteOrientation;
    const scale = 6;
    const hue = 0.7;
    const saturation = 0.6;

    return Scaffold(
      body: Center(
        child: StreamBuilder(
            stream: stream,
            builder: (_, snapshot) {
              if (snapshot.hasError) return const Text('ERROR');
              final event = snapshot.data ?? AbsoluteOrientationEvent(0, 0, 0);

              return ShaderMask(
                shaderCallback: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    for (var value in event.values.map(_radianToDegree))
                      HSVColor.fromAHSV(
                              hue, value * scale % 360, saturation, 1.0)
                          .toColor(),
                  ],
                ).createShader,
                child: const Icon(
                  Icons.apple,
                  size: 200,
                  color: Colors.white,
                ),
              );
            }),
      ),
    );
  }

  double _radianToDegree(double radian) => (radian * 180 / math.pi) + 180;
}

extension AbsoluteOrientationEventX on AbsoluteOrientationEvent {
  List<double> get values => [yaw, pitch, roll];
}