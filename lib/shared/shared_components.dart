import 'package:bmi_calculator/cubit/cubit.dart';
import 'package:flutter/material.dart';

Widget gender(String gender, BuildContext context) {
  return GestureDetector(
    onTap: () => AppCubit.get(context).changeGender(gender),
    child: Card(
      elevation: 4.0,
      child: Container(
        height: 150.0,
        width: 150.0,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: gender == 'Female' && AppCubit.get(context).isMale == false ||
                  gender == 'Male' && AppCubit.get(context).isMale == true
              ? Colors.yellow
              : const Color(0xFFFFF9E8),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                gender == 'Male'
                    ? 'assets/images/male.png'
                    : 'assets/images/female.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(bottom: 2.0),
              child: Text(
                gender,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
                textAlign: TextAlign.end,
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget weightAge(String wa, BuildContext context) {
  return Card(
    elevation: 4.0,
    child: Container(
      height: 150.0,
      width: 150.0,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF9E8),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Text(
            wa,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            '${wa == 'Weight' ? AppCubit.get(context).weight : AppCubit.get(context).age}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              babyButton(
                  wa == 'Weight'
                      ? () => AppCubit.get(context).incDecWeight('sub')
                      : () => AppCubit.get(context).incDecAge('sub'),
                  Icons.remove),
              const SizedBox(
                width: 8.0,
              ),
              babyButton(
                  wa == 'Weight'
                      ? () => AppCubit.get(context).incDecWeight('add')
                      : () => AppCubit.get(context).incDecAge('add'),
                  Icons.add),
            ],
          )
        ],
      ),
    ),
  );
}

Widget babyButton(Function? f, IconData icon) {
  return Container(
    width: 40.0,
    height: 40.0,
    decoration: BoxDecoration(
      color: Colors.yellow,
      borderRadius: BorderRadius.circular(40.0),
    ),
    child: IconButton(
      onPressed: () => f!(),
      icon: Icon(icon),
    ),
  );
}
