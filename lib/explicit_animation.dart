import 'package:flutter/material.dart';

class ExplicitAnimation extends StatefulWidget {
  const ExplicitAnimation({Key? key}) : super(key: key);

  @override
  State<ExplicitAnimation> createState() => _ExplicitAnimationState();
}

class _ExplicitAnimationState extends State<ExplicitAnimation>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this, value: 0.1);
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceInOut);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: const Text("Explicit Animation Samples"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ScaleTransition(
                scale: animation,
                alignment: Alignment.center,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/logo.png"),
                    ),
                  ),
                  width: 150.0,
                  height: 150.0,
                ),
              ),
            ),
            const SizedBox(
              height: 400.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.white70)),
                  child: const Text(
                    "Start",
                    style: TextStyle(color: Colors.purple, fontSize: 15),
                  ),
                  onPressed: () => controller.forward(),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.white70)),
                  child: const Text(
                    "Stop",
                    style: TextStyle(color: Colors.purple, fontSize: 15),
                  ),
                  onPressed: () => controller.reverse(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
