import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kuncie_music/core.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  // Here we set the URL strategy for our web app.
  // It is safe to call this function when running on mobile or desktop as well.
  setPathUrlStrategy();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /// To prevent device orientation changes and force portrait.
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return GetMaterialApp(
      title: 'Kuncie Apple Music',
      getPages: AppPages.routes,
      initialBinding: BindingsBuilder(() {
        Get.put(NowPlayingController(), permanent: true);
      }),
      theme: AppTheme.lightTheme,
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
      debugShowCheckedModeBanner: false,
    );
  }
}
