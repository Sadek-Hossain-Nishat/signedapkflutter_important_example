import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(DevicePreview(builder: ((context) => OrientationBuilderFlutter())));
}

class OrientationBuilderFlutter extends StatelessWidget {
  const OrientationBuilderFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepagefororientationbuilder(),
    );
  }
}

class Homepagefororientationbuilder extends StatefulWidget {
  const Homepagefororientationbuilder({Key? key}) : super(key: key);

  @override
  State<Homepagefororientationbuilder> createState() =>
      _HomepagefororientationbuilderState();
}

class _HomepagefororientationbuilderState
    extends State<Homepagefororientationbuilder> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Flutter Orientation Builder'),
              centerTitle: true,
            ),
            body: OrientationBuilder(
              builder: ((context, orientation) {
                if (orientation == Orientation.portrait) {
                  return _portraitMode();
                } else {
                  return _landscapeMode();
                }
              }),
            )));
  }

  Widget _portraitMode() {
    return Center(
        child: Container(
      height: 100,
      width: 100,
      color: Colors.orange,
    ));
  }

  Widget _landscapeMode() {
    return Center(
      child: Container(height: 200, width: 200, color: Colors.green),
    );
  }
}
