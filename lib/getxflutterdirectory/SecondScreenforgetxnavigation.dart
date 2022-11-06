import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signedapk/getxflutterdirectory/FirstScreenforgetxnavigation.dart';

class SecondScreenforgetxnavigation extends StatelessWidget {
  final Controller c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Second Screen'),
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text('Second Screen'),
              SizedBox(
                height: 20,
              ),
              Text('${c.count}')
            ],
          )),
        ));
  }
}
