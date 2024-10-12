import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // List to track if the card is face-up (true) or face-down (false)
  List<bool> isFaceUp = [false, false, false, false];

  List<double> rotationAngles = [0.0, 0.0, 0.0, 0.0];

  // Function to toggle the card image and animate the flip
  void _flipCard(int index) {
    setState(() {
      rotationAngles[index] += 180; // Rotate by 180 degrees
      isFaceUp[index] = !isFaceUp[index]; // Toggle face-up state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Card Matching Game'),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => _flipCard(0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    transformAlignment:
                        Alignment.center, // Keep the card centered
                    transform:
                        Matrix4.rotationY(rotationAngles[0] * 3.14159 / 180),
                    child: AnimatedSwitcher(
                      duration: const Duration(
                          milliseconds: 60), // Delay the switch halfway through
                      child: rotationAngles[0] % 360 >= 90 &&
                              rotationAngles[0] % 360 <= 270
                          ? Image.asset(
                              'assets/images/back.png',
                              width: 100,
                              height: 100,
                              key: ValueKey('back'),
                            )
                          : Image.asset(
                              'assets/images/Card1.png',
                              width: 100,
                              height: 100,
                              key: ValueKey('front'),
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () => _flipCard(0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    transformAlignment:
                        Alignment.center, // Keep the card centered
                    transform:
                        Matrix4.rotationY(rotationAngles[0] * 3.14159 / 180),
                    child: AnimatedSwitcher(
                      duration: const Duration(
                          milliseconds: 60), // Delay the switch halfway through
                      child: rotationAngles[0] % 360 >= 90 &&
                              rotationAngles[0] % 360 <= 270
                          ? Image.asset(
                              'assets/images/back.png',
                              width: 100,
                              height: 100,
                              key: ValueKey('back'),
                            )
                          : Image.asset(
                              'assets/images/Card1.png',
                              width: 100,
                              height: 100,
                              key: ValueKey('front'),
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () => _flipCard(0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    transformAlignment:
                        Alignment.center, // Keep the card centered
                    transform:
                        Matrix4.rotationY(rotationAngles[0] * 3.14159 / 180),
                    child: AnimatedSwitcher(
                      duration: const Duration(
                          milliseconds: 60), // Delay the switch halfway through
                      child: rotationAngles[0] % 360 >= 90 &&
                              rotationAngles[0] % 360 <= 270
                          ? Image.asset(
                              'assets/images/back.png',
                              width: 100,
                              height: 100,
                              key: ValueKey('back'),
                            )
                          : Image.asset(
                              'assets/images/Card1.png',
                              width: 100,
                              height: 100,
                              key: ValueKey('front'),
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () => _flipCard(0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    transformAlignment:
                        Alignment.center, // Keep the card centered
                    transform:
                        Matrix4.rotationY(rotationAngles[0] * 3.14159 / 180),
                    child: AnimatedSwitcher(
                      duration: const Duration(
                          milliseconds: 60), // Delay the switch halfway through
                      child: rotationAngles[0] % 360 >= 90 &&
                              rotationAngles[0] % 360 <= 270
                          ? Image.asset(
                              'assets/images/back.png',
                              width: 100,
                              height: 100,
                              key: ValueKey('back'),
                            )
                          : Image.asset(
                              'assets/images/Card1.png',
                              width: 100,
                              height: 100,
                              key: ValueKey('front'),
                            ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => _flipCard(0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    transformAlignment:
                        Alignment.center, // Keep the card centered
                    transform:
                        Matrix4.rotationY(rotationAngles[0] * 3.14159 / 180),
                    child: AnimatedSwitcher(
                      duration: const Duration(
                          milliseconds: 60), // Delay the switch halfway through
                      child: rotationAngles[0] % 360 >= 90 &&
                              rotationAngles[0] % 360 <= 270
                          ? Image.asset(
                              'assets/images/back.png',
                              width: 100,
                              height: 100,
                              key: ValueKey('back'),
                            )
                          : Image.asset(
                              'assets/images/Card1.png',
                              width: 100,
                              height: 100,
                              key: ValueKey('front'),
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () => _flipCard(0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    transformAlignment:
                        Alignment.center, // Keep the card centered
                    transform:
                        Matrix4.rotationY(rotationAngles[0] * 3.14159 / 180),
                    child: AnimatedSwitcher(
                      duration: const Duration(
                          milliseconds: 60), // Delay the switch halfway through
                      child: rotationAngles[0] % 360 >= 90 &&
                              rotationAngles[0] % 360 <= 270
                          ? Image.asset(
                              'assets/images/back.png',
                              width: 100,
                              height: 100,
                              key: ValueKey('back'),
                            )
                          : Image.asset(
                              'assets/images/Card1.png',
                              width: 100,
                              height: 100,
                              key: ValueKey('front'),
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () => _flipCard(0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    transformAlignment:
                        Alignment.center, // Keep the card centered
                    transform:
                        Matrix4.rotationY(rotationAngles[0] * 3.14159 / 180),
                    child: AnimatedSwitcher(
                      duration: const Duration(
                          milliseconds: 60), // Delay the switch halfway through
                      child: rotationAngles[0] % 360 >= 90 &&
                              rotationAngles[0] % 360 <= 270
                          ? Image.asset(
                              'assets/images/back.png',
                              width: 100,
                              height: 100,
                              key: ValueKey('back'),
                            )
                          : Image.asset(
                              'assets/images/Card1.png',
                              width: 100,
                              height: 100,
                              key: ValueKey('front'),
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () => _flipCard(0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    transformAlignment:
                        Alignment.center, // Keep the card centered
                    transform:
                        Matrix4.rotationY(rotationAngles[0] * 3.14159 / 180),
                    child: AnimatedSwitcher(
                      duration: const Duration(
                          milliseconds: 60), // Delay the switch halfway through
                      child: rotationAngles[0] % 360 >= 90 &&
                              rotationAngles[0] % 360 <= 270
                          ? Image.asset(
                              'assets/images/back.png',
                              width: 100,
                              height: 100,
                              key: ValueKey('back'),
                            )
                          : Image.asset(
                              'assets/images/Card1.png',
                              width: 100,
                              height: 100,
                              key: ValueKey('front'),
                            ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => _flipCard(0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    transformAlignment:
                        Alignment.center, // Keep the card centered
                    transform:
                        Matrix4.rotationY(rotationAngles[0] * 3.14159 / 180),
                    child: AnimatedSwitcher(
                      duration: const Duration(
                          milliseconds: 60), // Delay the switch halfway through
                      child: rotationAngles[0] % 360 >= 90 &&
                              rotationAngles[0] % 360 <= 270
                          ? Image.asset(
                              'assets/images/back.png',
                              width: 100,
                              height: 100,
                              key: ValueKey('back'),
                            )
                          : Image.asset(
                              'assets/images/Card1.png',
                              width: 100,
                              height: 100,
                              key: ValueKey('front'),
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () => _flipCard(0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    transformAlignment:
                        Alignment.center, // Keep the card centered
                    transform:
                        Matrix4.rotationY(rotationAngles[0] * 3.14159 / 180),
                    child: AnimatedSwitcher(
                      duration: const Duration(
                          milliseconds: 60), // Delay the switch halfway through
                      child: rotationAngles[0] % 360 >= 90 &&
                              rotationAngles[0] % 360 <= 270
                          ? Image.asset(
                              'assets/images/back.png',
                              width: 100,
                              height: 100,
                              key: ValueKey('back'),
                            )
                          : Image.asset(
                              'assets/images/Card1.png',
                              width: 100,
                              height: 100,
                              key: ValueKey('front'),
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () => _flipCard(0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    transformAlignment:
                        Alignment.center, // Keep the card centered
                    transform:
                        Matrix4.rotationY(rotationAngles[0] * 3.14159 / 180),
                    child: AnimatedSwitcher(
                      duration: const Duration(
                          milliseconds: 60), // Delay the switch halfway through
                      child: rotationAngles[0] % 360 >= 90 &&
                              rotationAngles[0] % 360 <= 270
                          ? Image.asset(
                              'assets/images/back.png',
                              width: 100,
                              height: 100,
                              key: ValueKey('back'),
                            )
                          : Image.asset(
                              'assets/images/Card1.png',
                              width: 100,
                              height: 100,
                              key: ValueKey('front'),
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () => _flipCard(0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    transformAlignment:
                        Alignment.center, // Keep the card centered
                    transform:
                        Matrix4.rotationY(rotationAngles[0] * 3.14159 / 180),
                    child: AnimatedSwitcher(
                      duration: const Duration(
                          milliseconds: 60), // Delay the switch halfway through
                      child: rotationAngles[0] % 360 >= 90 &&
                              rotationAngles[0] % 360 <= 270
                          ? Image.asset(
                              'assets/images/back.png',
                              width: 100,
                              height: 100,
                              key: ValueKey('back'),
                            )
                          : Image.asset(
                              'assets/images/Card1.png',
                              width: 100,
                              height: 100,
                              key: ValueKey('front'),
                            ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => _flipCard(0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    transformAlignment:
                        Alignment.center, // Keep the card centered
                    transform:
                        Matrix4.rotationY(rotationAngles[0] * 3.14159 / 180),
                    child: AnimatedSwitcher(
                      duration: const Duration(
                          milliseconds: 60), // Delay the switch halfway through
                      child: rotationAngles[0] % 360 >= 90 &&
                              rotationAngles[0] % 360 <= 270
                          ? Image.asset(
                              'assets/images/back.png',
                              width: 100,
                              height: 100,
                              key: ValueKey('back'),
                            )
                          : Image.asset(
                              'assets/images/Card1.png',
                              width: 100,
                              height: 100,
                              key: ValueKey('front'),
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () => _flipCard(0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    transformAlignment:
                        Alignment.center, // Keep the card centered
                    transform:
                        Matrix4.rotationY(rotationAngles[0] * 3.14159 / 180),
                    child: AnimatedSwitcher(
                      duration: const Duration(
                          milliseconds: 60), // Delay the switch halfway through
                      child: rotationAngles[0] % 360 >= 90 &&
                              rotationAngles[0] % 360 <= 270
                          ? Image.asset(
                              'assets/images/back.png',
                              width: 100,
                              height: 100,
                              key: ValueKey('back'),
                            )
                          : Image.asset(
                              'assets/images/Card1.png',
                              width: 100,
                              height: 100,
                              key: ValueKey('front'),
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () => _flipCard(0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    transformAlignment:
                        Alignment.center, // Keep the card centered
                    transform:
                        Matrix4.rotationY(rotationAngles[0] * 3.14159 / 180),
                    child: AnimatedSwitcher(
                      duration: const Duration(
                          milliseconds: 60), // Delay the switch halfway through
                      child: rotationAngles[0] % 360 >= 90 &&
                              rotationAngles[0] % 360 <= 270
                          ? Image.asset(
                              'assets/images/back.png',
                              width: 100,
                              height: 100,
                              key: ValueKey('back'),
                            )
                          : Image.asset(
                              'assets/images/Card1.png',
                              width: 100,
                              height: 100,
                              key: ValueKey('front'),
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () => _flipCard(0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    transformAlignment:
                        Alignment.center, // Keep the card centered
                    transform:
                        Matrix4.rotationY(rotationAngles[0] * 3.14159 / 180),
                    child: AnimatedSwitcher(
                      duration: const Duration(
                          milliseconds: 60), // Delay the switch halfway through
                      child: rotationAngles[0] % 360 >= 90 &&
                              rotationAngles[0] % 360 <= 270
                          ? Image.asset(
                              'assets/images/back.png',
                              width: 100,
                              height: 100,
                              key: ValueKey('back'),
                            )
                          : Image.asset(
                              'assets/images/Card1.png',
                              width: 100,
                              height: 100,
                              key: ValueKey('front'),
                            ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ));
  }
}
