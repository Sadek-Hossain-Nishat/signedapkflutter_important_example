import 'package:flutter/material.dart';

import 'ScreenArguments.dart';

// ignore: must_be_immutable
class Screenwitharguments extends StatelessWidget {
  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text('Title: ${args.title}\nMessage: ${args.message}'),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Back'))
            ],
          ),
        ));
  }
}
