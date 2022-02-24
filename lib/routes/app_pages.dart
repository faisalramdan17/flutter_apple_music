// ignore_for_file: constant_identifier_names

import 'package:kuncie_music/core.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: BindingsBuilder(() {}),
      bindings: [],
      // participatesInRootNavigator: true,
      // preventDuplicates: true,
      children: [
        GetPage(
          name: Routes.SEARCH,
          page: () => const SearchView(),
          binding: BindingsBuilder(() {}),
          bindings: [],
        ),
      ],
    ),
  ];
}
