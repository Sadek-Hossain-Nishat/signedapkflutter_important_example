import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  runApp(Validatorswithgetx());
}

class Validatorswithgetx extends StatelessWidget {
  var texteditingcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: Text('Validators with getx'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Mail Checker'),
                  controller: texteditingcontroller,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () => executableTask(), child: Text('Validate'))
              ],
            ),
          ),
        ),
      )),
    );
  }

  executableTask() {
    GetUtils.isEmail(texteditingcontroller.text)
        ? Get.snackbar('Hi', 'It is valid mail',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.black,
            colorText: Colors.white)
        : Get.snackbar('Hi', 'It is not valid mail'.toString(),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.black,
            colorText: Colors.white);
  }
}
