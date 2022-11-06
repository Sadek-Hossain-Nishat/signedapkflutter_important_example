import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:signedapk/flutternotification/BackgroundandTerminated.dart';
import 'package:signedapk/flutternotification/BackgroundnotTerminated.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Firebaseflutternotificationsforallstate());
}

class Firebaseflutternotificationsforallstate extends StatelessWidget {
  const Firebaseflutternotificationsforallstate({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'homepagefornotification',
      routes: {
        'homepagefornotification': (context) =>
            Homepageforflutternotificationsforallstate(),
        'terminated': (context) => BackgroundandTerminated(),
        'notterminated': (context) => BackgroundnotTerminated()
      },
    );
  }
}

class Homepageforflutternotificationsforallstate extends StatefulWidget {
  const Homepageforflutternotificationsforallstate({super.key});

  @override
  State<Homepageforflutternotificationsforallstate> createState() =>
      _HomepageforflutternotificationsforallstateState();
}

class _HomepageforflutternotificationsforallstateState
    extends State<Homepageforflutternotificationsforallstate> {
  var title = '';
  var body = '';

  @override
  void initState() {
    super.initState();

    handlingNotifications();
  }

  void handlingNotifications() {
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      setState(() {
        title = message!.notification!.title!;
        body = message.notification!.body!;
      });
      Navigator.pushNamed(context, message!.data['backandter']);
    });

    FirebaseMessaging.onMessage.listen((message) {
      setState(() {
        title = message!.notification!.title!;
        body = message.notification!.body!;
      });
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      setState(() {
        title = message!.notification!.title!;
        body = message.notification!.body!;
      });
      Navigator.pushNamed(context, message!.data['backnotter']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Flutter notifications'),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text('$title \n $body'),
          ],
        )),
      ),
    ));
  }
}
