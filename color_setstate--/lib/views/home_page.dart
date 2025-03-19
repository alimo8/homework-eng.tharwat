import 'dart:math';
import 'package:flutter/material.dart';
import 'package:task/views/custom_elevated_button.dart';
import 'package:task/views/even_odd_section.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Color randomColor = Colors.orange;
  double sizeFont = 26;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [randomColor, Colors.white],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(widget.title, style: TextStyle(color: Colors.white)),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EvenOddSection(
                color: randomColor,
                number: _counter,
                text: _counter % 2 == 0 ? "Even" : "Odd",
                sizeFont: sizeFont,
              ),
              SizedBox(height: 25),
              Column(
                children: [
                  Text('Counter Value', style: TextStyle(color: randomColor)),
                  Text(
                    '$_counter',
                    style: TextStyle(
                      color: randomColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        icon: Icons.color_lens,
                        text: "Change Color",
                        color: randomColor,
                        onPressed: () {
                          setState(() {
                            randomColor =
                                Colors.primaries[Random().nextInt(
                                  Colors.primaries.length,
                                )];
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: CustomElevatedButton(
                        icon: Icons.text_fields,
                        text: "Change Size",
                        color: randomColor,
                        onPressed: () {
                          setState(() {
                            if (sizeFont == 26) {
                              sizeFont = 20;
                            } else {
                              sizeFont = 26;
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: Text("Increment", style: TextStyle(color: Colors.white)),
          icon: Icon(Icons.add, color: Colors.white),
          backgroundColor: randomColor,
          onPressed: _incrementCounter,
        ),
      ),
    );
  }
}
