import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Homepagefornotification extends StatefulWidget {
  const Homepagefornotification({super.key});

  @override
  State<Homepagefornotification> createState() =>
      _HomepagefornotificationState();
}

class _HomepagefornotificationState extends State<Homepagefornotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
