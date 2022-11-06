import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(AspectRatioWidget());
}

class AspectRatioWidget extends StatelessWidget {
  const AspectRatioWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepageforaspectratiowidget(),
    );
  }
}

class Homepageforaspectratiowidget extends StatefulWidget {
  const Homepageforaspectratiowidget({Key? key}) : super(key: key);

  @override
  State<Homepageforaspectratiowidget> createState() =>
      _HomepageforaspectratiowidgetState();
}

class _HomepageforaspectratiowidgetState
    extends State<Homepageforaspectratiowidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Flutter Aspect Ratio'),
      ),
      body: Center(
          child: AspectRatio(
        aspectRatio: 10 / 13,
        child: Container(
          color: Colors.green,
        ),
      )),
    ));
  }
}
