import 'dart:math';

import 'package:bmi_calculator/cubit/cubit.dart';
import 'package:bmi_calculator/cubit/states.dart';
import 'package:bmi_calculator/shared/shared_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          double result = cubit.weight / pow(cubit.height / 100, 2);

          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'BMI Calculator',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        gender('Male', context),
                        gender('Female', context),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Card(
                      elevation: 4.0,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF9E8),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Height',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              textBaseline: TextBaseline.alphabetic,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${cubit.height.round()}',
                                  style: const TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  'cm',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            Slider(
                              max: 220,
                              min: 80,
                              activeColor: Colors.yellow,
                              value: cubit.height.toDouble(),
                              onChanged: (value) {
                                cubit.changeHeight(value);
                              },
                              label: cubit.height.round().toString(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        weightAge('Weight', context),
                        weightAge('Age', context),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: MaterialButton(
                      onPressed: () => showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            elevation: 20.0,
                            title: const Text(
                              'Your BMI result is:',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 24.0,
                              ),
                            ),
                            content: Text(
                              '${result.round()}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text(
                                  'OK',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      color: Colors.yellow,
                      height: 70.0,
                      child: const Text(
                        'Calculate',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
