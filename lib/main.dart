import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;
  bool get isEmpty => count == 0;
  bool get isFull => count == 20;

  void decrement() {
    if (!isEmpty) {
      setState(() {
        count--;
      });
    }
  }

  void increment() {
    if (isFull) return;
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFull ? 'Lotou!' : 'Pode entrar caraio!',
              style: TextStyle(
                  fontSize: 26,
                  color: isFull ? Colors.red : Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Text(
                count.toString(),
                style: TextStyle(
                    color: isFull ? Colors.red : Colors.green, fontSize: 40),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: decrement,
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      fixedSize: const Size(100, 100)),
                  child: const Text('Saiu',
                      style: TextStyle(color: Colors.black, fontSize: 18)),
                ),
                const SizedBox(width: 32),
                TextButton(
                    onPressed: increment,
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        fixedSize: const Size(100, 100)),
                    child: const Text('Entrou',
                        style: TextStyle(color: Colors.black, fontSize: 18))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
