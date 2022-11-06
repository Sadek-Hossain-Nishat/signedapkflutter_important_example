import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(FractionallySizedBoxFlutter());
}

class FractionallySizedBoxFlutter extends StatelessWidget {
  const FractionallySizedBoxFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomepageforFractionallySizedBox(),
    );
  }
}

class HomepageforFractionallySizedBox extends StatefulWidget {
  const HomepageforFractionallySizedBox({Key? key}) : super(key: key);

  @override
  State<HomepageforFractionallySizedBox> createState() =>
      _HomepageforFractionallySizedBoxState();
}

class _HomepageforFractionallySizedBoxState
    extends State<HomepageforFractionallySizedBox> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('FractionallySizedBox in Flutter'),
        centerTitle: true,
      ),
      body: SizedBox.expand(
        child: FractionallySizedBox(
          heightFactor: 0.5,
          widthFactor: 0.5,
          alignment: FractionalOffset.center,
          child: Container(
            color: Colors.purple,
          ),
        ),
      ),
    ));
  }
}
