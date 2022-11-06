import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signedapk/getxflutterdirectory/SecondScreenforgetxnavigation.dart';

void main(List<String> args) {
  runApp(DevicePreview(builder: (context) => FirstScreenforgetxnavigation()));
}

class FirstScreenforgetxnavigation extends StatelessWidget {
  const FirstScreenforgetxnavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepageforfirstscreengetxnavigation(),
    );
  }
}

class Homepageforfirstscreengetxnavigation extends StatefulWidget {
  const Homepageforfirstscreengetxnavigation({Key? key}) : super(key: key);

  @override
  State<Homepageforfirstscreengetxnavigation> createState() =>
      _HomepageforfirstscreengetxnavigationState();
}

class Controller extends GetxController {
  var count = 0.obs;
  increment() => count++;
}

class _HomepageforfirstscreengetxnavigationState
    extends State<Homepageforfirstscreengetxnavigation> {
  var count = 0.obs;

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Getx Navigation First Screen'),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(children: [
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(SecondScreenforgetxnavigation());
              },
              child: Text('go to second screen')),
          Obx(() => Text('$count')),
          ElevatedButton(
              onPressed: () {
                count++;
              },
              child: Text('Increment')),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Get.snackbar('Hi', 'I am Nishat',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.black,
                    colorText: Colors.white);
              },
              child: Text('Show SnackBar')),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Get.defaultDialog(
                    title: 'Exit',
                    middleText: 'Are you sure to exit',
                    textCancel: 'No',
                    textConfirm: 'Yes');
              },
              child: Text('Show dialog')),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Get.bottomSheet(Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  child: Text('This is a bottom sheet',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  color: Colors.purple,
                ));
              },
              child: Text('Show bottomsheet')),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: c.increment(),
              child: Text('Count by Get Instantiate method')),
          SizedBox(
            height: 20,
          ),
          Obx(() => Text('${c.count}')),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(SecondScreenforgetxnavigation());
              },
              child: Text('Go to Secondscreen with Arguments'))
        ])),
      ),
    ));
  }
}
