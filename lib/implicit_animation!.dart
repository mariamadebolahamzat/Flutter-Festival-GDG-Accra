import 'package:flutter/material.dart';

class ImplicitAnimation1 extends StatefulWidget {
  const ImplicitAnimation1({Key? key}) : super(key: key);

  @override
  State<ImplicitAnimation1> createState() => _ImplicitAnimation1State();
}

class _ImplicitAnimation1State extends State<ImplicitAnimation1> {
  double opacityLevel = 1.0;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

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
              child: AnimatedOpacity(
                curve: Curves.fastOutSlowIn,
                opacity: opacityLevel,
                duration: const Duration(milliseconds: 3000),
                child: const Text(
                  "Hi, I am Mariam",
                  style: TextStyle(
                      color: Colors.purple,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white70)),
              child: const Text(
                "Tap Me",
                style: TextStyle(color: Colors.purple, fontSize: 15),
              ),
              onPressed: _changeOpacity,
            ),
          ],
        ),
      ),
    );
  }
}
