import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuncie_music/core.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  // Here we set the URL strategy for our web app. It is safe to call this function when running on mobile or desktop as well.
  setPathUrlStrategy();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      title: 'Kuncie Music',
      getPages: AppPages.routes,
      initialBinding: SongBinding(),
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
      debugShowCheckedModeBanner: false,
    );
  }
}
