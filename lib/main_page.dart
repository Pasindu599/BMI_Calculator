import 'package:bmicalculator/constant.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 150;
  int weight = 70;
  String gender = "";
  late double bmi = calculateBMI(height: height, weight: weight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      print("Male");
                      setState(() {
                        gender = "M";
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: (gender == "M")
                            ? Color.fromARGB(255, 166, 0, 255)
                            : Color.fromARGB(255, 232, 190, 255),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          Icon(Icons.male, size: 150),
                          Text("Male"),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      print("FeMale");
                      setState(() {
                        gender = "F";
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: (gender == "F")
                            ? Color.fromARGB(255, 166, 0, 255)
                            : Color.fromARGB(255, 232, 190, 255),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          Icon(Icons.female, size: 150),
                          Text("Female"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text("Height"),
                        Text(
                          "$height",
                          style: kInputLabelColor,
                        ),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (height > 50) height--;
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                });
                              },
                              child: const Icon(
                                Icons.remove,
                                size: 30,
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (height <= 200) height++;
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                });
                              },
                              child: const Icon(
                                Icons.add,
                                size: 30,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text("Weight"),
                        Text(
                          "$weight",
                          style: kInputLabelColor,
                        ),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (weight > 20) weight--;
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                });
                              },
                              child: const Icon(
                                Icons.remove,
                                size: 30,
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (weight <= 120) weight++;
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                });
                              },
                              child: const Icon(
                                Icons.add,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  const Text("BMI"),
                  Text(
                    bmi.toStringAsFixed(2),
                    style: kInputLabelColor.copyWith(color: kOutputTextColor),
                  ),
                  Text(
                    getResult(bmi),
                    style: TextStyle(
                        color: (getResult(bmi) == "Underweight")
                            ? Colors.red
                            : const Color.fromARGB(255, 0, 6, 10)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  double calculateBMI({required int height, required int weight}) {
    return (weight / (height * height)) * 10000;
  }

  String getResult(bmiValue) {
    if (bmiValue >= 25) {
      return "Overweight";
    } else if (bmiValue > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }
}
