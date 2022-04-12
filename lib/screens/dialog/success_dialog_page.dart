import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SuccessDialogPage extends StatelessWidget {
  final VoidCallback onRetry;
  final String message;
  const SuccessDialogPage({Key? key, required this.message, required this.onRetry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: const Icon(Icons.close),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Lottie.network(
                'https://assets1.lottiefiles.com/packages/lf20_pqnfmone.json',
                height: 200,
                width: 200,repeat: false),
            Text(
              message,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            OutlinedButton(
                onPressed: onRetry,
                child: const Text(
                  "ফিরে যান",
                  style: TextStyle(color: Colors.black54, fontSize: 12),
                ))
          ],
        ),
      ),
    );
  }
}
