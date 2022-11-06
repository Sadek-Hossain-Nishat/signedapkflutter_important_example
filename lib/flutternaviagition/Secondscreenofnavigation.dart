import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Secondscreenofnavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Text('Second Screen'),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Back'))
      ],
    );
  }
}
