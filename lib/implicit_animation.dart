import 'dart:math';

import 'package:flutter/material.dart';

class ImplicitAnimation extends StatefulWidget {
  const ImplicitAnimation({Key? key}) : super(key: key);

  @override
  State<ImplicitAnimation> createState() => _ImplicitAnimationState();
}

class _ImplicitAnimationState extends State<ImplicitAnimation> {
  double _width = 40;
  double _height = 40;
  Color _color = Colors.purple;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(4.0);
  final BoxShape _boxShape = BoxShape.rectangle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: const Text("Implicit Animation Samples"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 1000),
                curve: Curves.fastOutSlowIn,
                width: _width,
                height: _height,
                decoration: BoxDecoration(
                    color: _color,
                    borderRadius: _borderRadius,
                    shape: _boxShape),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.purpleAccent)),
              onPressed: () {
                setState(() {
                  // Random() is gotten from an imported package dart:math
                  final random = Random();
                  //using random to generate different width and height sizes for the container
                  _width = random.nextInt(200).toDouble();
                  _height = random.nextInt(250).toDouble();
                  //using random to generate different colors
                  _color = Color.fromRGBO(
                    random.nextInt(128),
                    random.nextInt(165),
                    random.nextInt(256),
                    1,
                  );
                  //using random to generate different sizes for circular edges
                  _borderRadius =
                      BorderRadius.circular(random.nextInt(128).toDouble());
                });
              },
              child: const Text(
                "Tap Me!!!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
