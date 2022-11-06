import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Flutterfirebasenotification());
}

class Flutterfirebasenotification extends StatelessWidget {
  const Flutterfirebasenotification({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepageforflutternotification(),
    );
  }
}

class Homepageforflutternotification extends StatefulWidget {
  const Homepageforflutternotification({super.key});

  @override
  State<Homepageforflutternotification> createState() =>
      _HomepageforflutternotificationState();
}

class _HomepageforflutternotificationState
    extends State<Homepageforflutternotification> {
  // It is assumed that all messages contain a data field with the key 'type'

  var title = '';
  var body = '';

  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    setState(() {
      title = message.notification!.title.toString();
      body = message.notification!.body.toString();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    //background notification
    //setupInteractedMessage();

    // foreground notification
    foregroundNotification();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Firebase Notification'),
      ),
      body: Center(
        child: Text('$title \n $body'),
      ),
    ));
  }

  Future<void> foregroundNotification() async {
    await FirebaseMessaging.instance.getInitialMessage();

    FirebaseMessaging.onMessage.listen((event) {
      setState(() {
        title = event.notification!.title.toString();
        body = event.notification!.body.toString();
      });
    });
  }
}
