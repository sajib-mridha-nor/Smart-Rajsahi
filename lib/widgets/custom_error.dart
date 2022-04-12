import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomError extends StatelessWidget {
  final VoidCallback onRetry;
  final String? mesaage;

  const CustomError({Key? key, required this.onRetry, this.mesaage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Lottie.network(
              'https://assets2.lottiefiles.com/packages/lf20_e1pmabgl.json',
              height: 150,
              width: 150),
          Text(
            mesaage ?? "Unknown Error",
          ),
          const SizedBox(
            height: 8,
          ),
          OutlinedButton(
              onPressed: onRetry,
              child: const Text(
                "আবার চেষ্টা করুন",
                style: TextStyle(color: Colors.black54, fontSize: 12),
              ))
        ],
      ),
    );
  }
}
