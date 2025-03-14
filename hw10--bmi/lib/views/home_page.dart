import 'package:bmi/widgets/counter_card.dart';
import 'package:bmi/widgets/gender_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender? selectedGender;
  double height = 174;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),

      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Text('BMI CALCULATOR', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GenderCard(
                    icon: Icons.male,
                    text: 'MALE',
                    isSelected: selectedGender == Gender.male,
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: GenderCard(
                    icon: Icons.female,
                    text: 'FEMALE',
                    isSelected: selectedGender == Gender.female,
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Container(
              // width: 200,
              // height: 200,
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF1D1E33),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toInt().toString(),
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'cm',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                  Slider(
                    value: height,
                    max: 220,
                    min: 100,

                    activeColor: Colors.pink,
                    inactiveColor: Colors.grey,
                    onChanged: (newvalue) {
                      setState(() {
                        height = newvalue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CounterCard(
                    text: 'WEIGHT',
                    value: weight,
                    onDecrement: () {
                      setState(() {
                        if (weight > 1) weight--;
                      });
                    },
                    onIncrement: () {
                      setState(() {
                        weight++;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: CounterCard(
                    text: 'AGE',
                    value: age,
                    onDecrement: () {
                      setState(() {
                        if (age > 1) age--;
                      });
                    },
                    onIncrement: () {
                      setState(() {
                        age++;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 60,
            color: Colors.pink,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "CALCULATE",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
