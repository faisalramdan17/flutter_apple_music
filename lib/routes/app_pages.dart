// ignore_for_file: constant_identifier_names

import 'package:kuncie_music/core.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const MobileMenuView(),
      bindings: [
        MobileMenuBinding(),
        SongBinding(),
        AlbumBinding(),
      ],
      // participatesInRootNavigator: true,
      // preventDuplicates: true,
    ),
    GetPage(
      name: Routes.SEARCH,
      page: () => const MobileMenuView(initialValue: 1),
      bindings: [
        SongBinding(),
      ],
    ),
    GetPage(
      name: Routes.NOW_PLAYING,
      page: () => const NowPlayingView(),
      binding: BindingsBuilder(() {
        Get.put(NowPlayingController(), permanent: true);
      }),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: Routes.NOTIFICATION,
      page: () => const NotificationView(),
      bindings: [
        MobileMenuBinding(),
      ],
      transition: Transition.cupertino,
    ),
  ];
}
