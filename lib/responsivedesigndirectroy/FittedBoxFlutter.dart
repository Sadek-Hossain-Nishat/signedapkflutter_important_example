import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(FittedBoxFlutter());
}

class FittedBoxFlutter extends StatelessWidget {
  const FittedBoxFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomepageforFittedBoxFlutter(),
    );
  }
}

class HomepageforFittedBoxFlutter extends StatefulWidget {
  const HomepageforFittedBoxFlutter({Key? key}) : super(key: key);

  @override
  State<HomepageforFittedBoxFlutter> createState() =>
      _HomepageforFittedBoxFlutterState();
}

class _HomepageforFittedBoxFlutterState
    extends State<HomepageforFittedBoxFlutter> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Fitted Box'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          FittedBox(
            child: Row(
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width / 2,
                  color: Colors.yellow,
                ),
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width / 3,
                  color: Colors.red,
                ),
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width / 3,
                  color: Colors.purple,
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width / 2,
              color: Colors.black,
            ),
          ),
        ],
      ),
    ));
  }
}
