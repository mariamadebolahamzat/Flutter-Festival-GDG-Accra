import 'package:flutter/material.dart';

class ExplicitAnimation1 extends StatefulWidget {
  const ExplicitAnimation1({Key? key}) : super(key: key);

  @override
  State<ExplicitAnimation1> createState() => _ExplicitAnimation1State();
}

class _ExplicitAnimation1State extends State<ExplicitAnimation1>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this);
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
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.0, 0.0),
                  end: const Offset(0.0, 20),
                ).animate(CurvedAnimation(
                  parent: controller,
                  curve: Curves.fastOutSlowIn,
                )),
                child: const Text("Slidinnnnnggggggggggggggggg!!!",
                    style: TextStyle(color: Colors.purple, fontSize: 20)),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
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
