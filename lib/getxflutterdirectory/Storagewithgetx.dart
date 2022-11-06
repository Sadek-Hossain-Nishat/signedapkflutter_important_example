import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(App());
}

class Controller extends GetxController {
  final box = GetStorage();
  int get count => box.read('count') ?? 0;

  void addCount() => box.write('count', count + 1);
  void substractCount() {
    if (count - 1 < 0) {
      box.write('count', 0);
    } else {
      box.write('count', count - 1);
    }
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller());
    return SimpleBuilder(builder: (_) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: Text("Getx storage")),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "${controller.count}",
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () => controller.addCount(),
                      child: Icon(Icons.add)),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () => controller.substractCount(),
                      child: Icon(Icons.remove))
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
