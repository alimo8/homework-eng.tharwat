import 'package:flutter/material.dart';
import 'package:test/widgets/custom_container.dart';
import 'package:test/widgets/custom_text.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 400,
          height: 600,
          color: Colors.blue[100],
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 100),
                    CustomContainer(
                      width: 80,
                      height: 50,
                      color: Colors.red,
                      text: 'A',
                      textColor: Colors.white,
                    ),
                    CustomContainer(
                      width: 80,
                      height: 50,
                      color: Colors.orange,
                      text: 'B',
                      textColor: Colors.white,
                    ),
                    CustomContainer(
                      width: 80,
                      height: 50,
                      color: Colors.yellow,
                      text: 'C',
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),

              // ===============================================================
              Container(
                width: 370,
                height: 240,
                color: Colors.grey,
                child: const Column(
                  children: [
                    SizedBox(height: 20),
                    CustomText(text: 'Fancy Section'),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomContainer(
                          width: 60,
                          height: 60,
                          color: Colors.purple,
                          text: '1',
                          textColor: Colors.white,
                        ),
                        SizedBox(width: 20),
                        CustomContainer(
                          width: 60,
                          height: 60,
                          color: Colors.purpleAccent,
                          text: '2',
                          textColor: Colors.white,
                        ),
                        SizedBox(width: 20),
                        CustomContainer(
                          width: 60,
                          height: 60,
                          color: Colors.teal,
                          text: '3',
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomContainer(
                          width: 60,
                          height: 60,
                          color: Colors.tealAccent,
                          text: '4',
                          textColor: Colors.white,
                        ),
                        SizedBox(width: 20),
                        CustomContainer(
                          width: 60,
                          height: 60,
                          color: Colors.pink,
                          text: '5',
                          textColor: Colors.white,
                        ),
                        SizedBox(width: 20),
                        CustomContainer(
                          width: 60,
                          height: 60,
                          color: Colors.pinkAccent,
                          text: '6',
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              // ==============================================================
              const CustomText(text: 'Info Cards'),
              // ==============================================================
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomContainer2(
                      width: 100,
                      height: 100,
                      color: Colors.white,
                      text: '23',
                      text2: 'Actice',
                      textColor: Colors.green,
                    ),
                    CustomContainer2(
                      width: 100,
                      height: 100,
                      color: Colors.white,
                      text: '15',
                      text2: 'Pending',
                      textColor: Colors.yellow,
                    ),
                    CustomContainer2(
                      width: 100,
                      height: 100,
                      color: Colors.white,
                      text: '17',
                      text2: 'Completed',
                      textColor: Colors.lightGreen,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
