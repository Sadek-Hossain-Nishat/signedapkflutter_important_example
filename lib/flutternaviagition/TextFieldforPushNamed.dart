import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:signedapk/flutternaviagition/ScreenArguments.dart';
import 'package:signedapk/flutternaviagition/Screenwitharguments.dart';

void main(List<String> args) {
  runApp(DevicePreview(builder: (context) => TextFieldforPushNamed()));
}

class TextFieldforPushNamed extends StatelessWidget {
  const TextFieldforPushNamed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'homefortextfield',
      routes: {
        'homefortextfield': (context) => Homepagefortextfieldpushnamed(),
        Screenwitharguments.routeName: (context) => Screenwitharguments()
      },
    );
  }
}

class Homepagefortextfieldpushnamed extends StatefulWidget {
  const Homepagefortextfieldpushnamed({Key? key}) : super(key: key);

  @override
  State<Homepagefortextfieldpushnamed> createState() =>
      _HomepagefortextfieldpushnamedState();
}

class _HomepagefortextfieldpushnamedState
    extends State<Homepagefortextfieldpushnamed> {
  var title = TextEditingController();
  var message = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Push Named with Arguments'),
            ),
            body: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  TextField(
                    controller: title,
                    decoration: InputDecoration(hintText: 'First Name'),
                  ),
                  TextField(
                    controller: message,
                    decoration: InputDecoration(hintText: 'Last Name'),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (title.text.isNotEmpty && message.text.isNotEmpty) {
                          Navigator.pushNamed(
                              context, Screenwitharguments.routeName,
                              arguments:
                                  ScreenArguments(title.text, message.text));
                          title.text = '';
                          message.text = '';
                        }
                      },
                      child: Text('Click me'))
                ],
              ),
            )));
  }
}
