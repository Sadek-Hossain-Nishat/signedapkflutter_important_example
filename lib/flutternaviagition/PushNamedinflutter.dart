import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:signedapk/flutternaviagition/Secondscreenofnavigation.dart';

void main(List<String> args) {
  runApp(DevicePreview(builder: (context) => PushNamedinflutter()));
}

class PushNamedinflutter extends StatelessWidget {
  const PushNamedinflutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/homepage',
      routes: {
        '/homepage': (context) => Homepageforpushnamedinflutter(),
        '/secondscreen': (context) => Secondscreenofnavigation()
      },
    );
  }
}

class Homepageforpushnamedinflutter extends StatefulWidget {
  const Homepageforpushnamedinflutter({Key? key}) : super(key: key);

  @override
  State<Homepageforpushnamedinflutter> createState() =>
      _HomepageforpushnamedinflutterState();
}

class _HomepageforpushnamedinflutterState
    extends State<Homepageforpushnamedinflutter> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Push Named in Flutter'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/secondscreen');
            },
            child: Text('Go to Second Screen')),
      ),
    ));
  }
}
