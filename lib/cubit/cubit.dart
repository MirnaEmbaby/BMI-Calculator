import 'package:bmi_calculator/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isMale = true;

  void changeGender(String gender) {
    if (gender == 'Male') {
      isMale = true;
      emit(AppChangeGender());
      debugPrint('male');
    } else {
      isMale = false;
      emit(AppChangeGender());
      debugPrint('female');
    }
  }

  double height = 160;

  void changeHeight(double value) {
    height = value.roundToDouble();
    emit(AppChangeHeight());
    debugPrint(height.toString());
  }

  int age = 16;
  int weight = 70;

  void incDecAge(String op) {
    if (op == 'add') {
      age++;
      emit(AppIncreaseAge());
      debugPrint('age++');
      debugPrint(age.toString());
    } else {
      age--;
      emit(AppDecreaseAge());
      debugPrint('age--');
      debugPrint(age.toString());
    }
  }

  void incDecWeight(String op) {
    if (op == 'add') {
      weight++;
      emit(AppIncreaseWeight());
      debugPrint('weight++');
      debugPrint(weight.toString());
    } else {
      weight--;
      emit(AppDecreaseWeight());
      debugPrint('weight++');
      debugPrint(weight.toString());
    }
  }
}
