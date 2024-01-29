import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:doa/doa_lib/pages/unknown_route.dart';
import 'package:doa/doa_lib/routes.dart';

Function(String)? doaCallback;

Future<void> openDoa(BuildContext context,
    {@required void Function(String)? callback}) async {
  await initializeDateFormatting().then((value) {
    Intl.defaultLocale = "in";
  }).then((value) {
    doaCallback = callback;
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WillPopScope(
        onWillPop: () {
          if (Get.rawRoute?.isFirst ?? false) {
            doaCallback!("Please complete all steps");
            return Future.value(true);
          }
          Get.back();
          return Future.value(false);
        },
        child: GetMaterialApp(
            defaultTransition: Transition.size,
            transitionDuration: const Duration(milliseconds: 500),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: 'montserrat'),
            initialRoute: ROUTE.onBoarding.name,
            getPages: routePage,
            unknownRoute: GetPage(
              name: '/notfound',
              page: () => const UnknownRoute(),
            )),
      );
    }));
  });
}
