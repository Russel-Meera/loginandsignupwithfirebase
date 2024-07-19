import 'package:flutter/material.dart';
import 'package:loginandsignup/main.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key, required this.email});

  final String email;

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Text(widget.email),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyHomePage(title: ""),
                      ),
                    );
                  },
                  label: const Text('Sign Out'),
                  icon: const Icon(Icons.logout),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
