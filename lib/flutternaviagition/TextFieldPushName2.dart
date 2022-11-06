import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:signedapk/flutternaviagition/PassArgumentsScreen.dart';
import 'package:signedapk/flutternaviagition/ScreenArguments.dart';

void main(List<String> args) {
  runApp(DevicePreview(builder: (context) => TextFieldPushNamed2()));
}

class TextFieldPushNamed2 extends StatelessWidget {
  const TextFieldPushNamed2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        if (settings.name == PassArgumentsScreen.routeName) {
          final args = settings.arguments as ScreenArguments;
          return MaterialPageRoute(
              builder: (context) => PassArgumentsScreen(
                  firstname: args.title, lastname: args.message));
        }
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
      home: Homepagefortextfieldpushnamed2(),
    );
  }
}

class Homepagefortextfieldpushnamed2 extends StatefulWidget {
  const Homepagefortextfieldpushnamed2({Key? key}) : super(key: key);

  @override
  State<Homepagefortextfieldpushnamed2> createState() =>
      _Homepagefortextfieldpushnamed2State();
}

class _Homepagefortextfieldpushnamed2State
    extends State<Homepagefortextfieldpushnamed2> {
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
                              context, PassArgumentsScreen.routeName,
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
