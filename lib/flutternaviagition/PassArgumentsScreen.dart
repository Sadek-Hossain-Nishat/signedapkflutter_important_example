import 'package:flutter/material.dart';

class PassArgumentsScreen extends StatelessWidget {
  final String firstname, lastname;
  static const routeName = 'passArguments';
  PassArgumentsScreen(
      {Key? key, required this.firstname, required this.lastname})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SecondScreen'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text('$firstname $lastname')
          ],
        ),
      ),
    );
  }
}
