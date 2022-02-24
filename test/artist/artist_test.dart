import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:kuncie_music/core.dart';
import 'package:matcher/matcher.dart' as m;
import 'artist_mock.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpAll(() => HttpOverrides.global = null);
  final binding = BindingsBuilder(() {
    Get.lazyPut<IArtistRepository>(() => MockRepository());
    Get.lazyPut<ArtistController>(
        () => ArtistController(artistRepository: Get.find()));
  });

  test('Test Artist Binding', () {
    expect(Get.isPrepared<ArtistController>(), false);
    expect(Get.isPrepared<IArtistRepository>(), false);

    /// test you Binding class with BindingsBuilder
    binding.builder();

    expect(Get.isPrepared<ArtistController>(), true);
    expect(Get.isPrepared<IArtistRepository>(), true);

    Get.reset();
  });

  test('Test Artist Controller when Call getArtist(id)', () async {
    /// Controller can't be on memory
    expect(() => Get.find<ArtistController>(),
        throwsA(const m.TypeMatcher<String>()));

    /// build Binding
    binding.builder();

    /// recover your controller
    final controller = Get.find<ArtistController>();

    /// Call Function after find instance
    await controller.getArtist("941107698");

    /// await time request
    await Future.delayed(const Duration(milliseconds: 50));

    if (controller.status.isError) {
      expect(controller.state, null,
          reason: "State Controller is not Null when status is error");
    }

    if (controller.status.isSuccess) {
      expect(controller.state!.resultCount, 1,
          reason:
              "State Controller resultCount is not 1 when status is success");
    }

    Get.reset();
  });
}
