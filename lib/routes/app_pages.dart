// ignore_for_file: constant_identifier_names

import 'package:kuncie_music/core.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.DASBOARD;

  static final routes = [
    // GetPage(
    //     name: Routes.DASBOARD,
    //     page: () => const DashboardView(),
    //     binding: BindingsBuilder(() {
    //       Get.lazyPut(() => FlutterWeb3Controller());
    //     }),
    //     bindings: [
    //       TokenBinding()
    //     ],
    //     // participatesInRootNavigator: true,
    //     // preventDuplicates: true,
    //     children: [
    //       GetPage(
    //         name: Routes.ADD_TOKENS,
    //         page: () => const AddTokenView(),
    //         binding: BindingsBuilder(() {
    //           Get.lazyPut(() => AddTokenController());
    //           Get.lazyPut(() => FlutterWeb3Controller());
    //         }),
    //         bindings: [TokenBinding()],
    //       ),
    //       GetPage(
    //         name: Routes.INTERACT_TOKEN,
    //         page: () => const InteractTokenView(),
    //         binding: BindingsBuilder(() {
    //           Get.lazyPut(() => IntractTokenController());
    //           Get.lazyPut(() => FlutterWeb3Controller());
    //         }),
    //         bindings: [TokenBinding()],
    //       ),
    //     ]),
  ];
}
