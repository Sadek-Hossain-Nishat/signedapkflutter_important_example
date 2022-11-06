import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main(List<String> args) async {
  await GetStorage.init();
  runApp(ChangeThemewithGetx());
}

class ThemeController extends GetxController {
  GetStorage box = GetStorage();
  bool get isdark => box.read('dark') ?? false;

  ThemeData get theme => isdark ? ThemeData.dark() : ThemeData.light();

  existdarkTheme(bool val) {
    box.write('dark', val);

    print(val);
  }
}

class ChangeThemewithGetx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themcontroller = Get.put(ThemeController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themcontroller.theme,
      home: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: Text('Theme Change with Getx'),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.isDarkMode
                        ? themcontroller.existdarkTheme(false)
                        : themcontroller.existdarkTheme(true);
                    Get.changeTheme(
                        Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
                  },
                  child: Text('Change Theme'))
            ],
          ),
        ),
      )),
    );
  }
}
