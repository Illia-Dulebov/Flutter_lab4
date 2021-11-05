import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            var args = ModalRoute.of(context)!.settings.arguments;
            print("Arguments " + args.toString());
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
