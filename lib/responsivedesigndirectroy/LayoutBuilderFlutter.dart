import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

// void main(List<String> args) {
//   runApp(LayoutBuilderFlutter());
// }

void main(List<String> args) {
  runApp(
    DevicePreview(
      enabled: true,
      tools: [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => const LayoutBuilderFlutter(),
    ),
  );
}

class LayoutBuilderFlutter extends StatelessWidget {
  const LayoutBuilderFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepageforlayoutbuilder(),
    );
  }
}

class Homepageforlayoutbuilder extends StatefulWidget {
  const Homepageforlayoutbuilder({Key? key}) : super(key: key);

  @override
  State<Homepageforlayoutbuilder> createState() =>
      _HomepageforlayoutbuilderState();
}

class _HomepageforlayoutbuilderState extends State<Homepageforlayoutbuilder> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Layout Builder Flutter'),
        centerTitle: true,
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          Text('Device Preview'),
          ElevatedButton(
              onPressed: (() => {}),
              child: Icon(Icons.bluetooth_connected_sharp)),
          Text('Navigation Drawer')
        ],
      )),
      body: LayoutBuilder(builder: ((context, constraints) {
        if (constraints.maxWidth > 600) {
          return _buildwideContainers();
        } else {
          return _buildnormalContainers();
        }
      })),
    ));
  }

  Widget _buildwideContainers() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.yellow,
          )
        ],
      ),
    );
  }

  Widget _buildnormalContainers() {
    return Center(
        child: Container(
      width: 100,
      height: 100,
      color: Colors.red,
    ));
  }
}
