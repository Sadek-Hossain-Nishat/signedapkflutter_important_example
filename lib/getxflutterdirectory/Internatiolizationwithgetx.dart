import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main(List<String> args) async {
  await GetStorage.init();
  runApp(Translationwithgetx());
}

class Messages extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'title': 'Hello World',
          'appbar_title': 'Translation with getx',
          'btn_text': 'Translation'
        },
        'bn_BD': {
          'title': 'ওহে বিশ্ব',
          'appbar_title': 'Getx এর সাথে অনুবাদ',
          'btn_text': 'অনুবাদ'
        }
      };
}

class TranslationController extends GetxController {
  final box = GetStorage();
  // Locale get locale => box.read('locale') ?? Locale('en', 'US');
  String get languagecode => box.read('code') ?? 'en';
  Locale get locale =>
      languagecode == 'bn' ? Locale('bn', 'BD') : Locale('en', 'US');
  // Locale get chnageablelocale =>
  //     isBangla ? Locale('en', 'US') : Locale('bn', 'BD');

  void changeLanguage(String value) => box.write('code', value);
}

class Translationwithgetx extends StatelessWidget {
  const Translationwithgetx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var langcontroller = Get.put(TranslationController());
    // var langc = Get.put(TranslationController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Messages(),
      locale: langcontroller.locale,
      fallbackLocale: Locale('en', 'UK'),
      home: Homepageforgetxinternationilization(),
    );
  }
}

class Homepageforgetxinternationilization extends StatefulWidget {
  const Homepageforgetxinternationilization({super.key});

  @override
  State<Homepageforgetxinternationilization> createState() =>
      _HomepageforgetxinternationilizationState();
}

class _HomepageforgetxinternationilizationState
    extends State<Homepageforgetxinternationilization> {
  @override
  Widget build(BuildContext context) {
    var langcontroller = Get.put(TranslationController());
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('appbar_title'.tr),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text('title'.tr),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  // Get.updateLocale(Locale('bn', 'BD'));

                  if (langcontroller.languagecode == 'bn') {
                    langcontroller.changeLanguage('en');
                    Get.updateLocale(Locale('en', 'US'));
                  } else {
                    langcontroller.changeLanguage('bn');
                    Get.updateLocale(Locale('bn', 'BD'));
                  }

                  // langc.isBangla
                  //     ? langc.changeLanguage(false)
                  //     : langc.changeLanguage(true);
                },
                child: Text('btn_text'.tr))
          ],
        ),
      ),
    ));
  }
}
