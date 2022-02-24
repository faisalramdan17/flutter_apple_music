import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:kuncie_music/core.dart';
import 'package:matcher/matcher.dart' as m;
import 'song_mock.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpAll(() => HttpOverrides.global = null);
  final binding = BindingsBuilder(() {
    Get.lazyPut<ISongRepository>(() => MockRepository());
    Get.lazyPut<SongController>(
        () => SongController(songRepository: Get.find()));
  });

  test('Test Song Binding', () {
    expect(Get.isPrepared<SongController>(), false);
    expect(Get.isPrepared<ISongRepository>(), false);

    /// test you Binding class with BindingsBuilder
    binding.builder();

    expect(Get.isPrepared<SongController>(), true);
    expect(Get.isPrepared<ISongRepository>(), true);

    Get.reset();
  });

  test('Test Song Controller when Call onInit() => append()', () async {
    /// Controller can't be on memory
    expect(() => Get.find<SongController>(),
        throwsA(const m.TypeMatcher<String>()));

    /// build Binding
    binding.builder();

    /// recover your controller
    final controller = Get.find<SongController>();

    /// check if onInit was called
    expect(controller.initialized, true,
        reason: "Controller is not Initialized");

    /// check initial Status
    expect(controller.status.isLoading, true,
        reason: "Status Controller is not Loading");

    /// await time request
    await Future.delayed(const Duration(milliseconds: 50));

    if (controller.status.isError) {
      expect(controller.state, null,
          reason: "State Controller is not Null when status is error");
    }

    if (controller.status.isSuccess) {
      expect(controller.state!.resultCount, 14,
          reason:
              "State Controller resultCount is not 14 when status is success");
    }

    Get.reset();
  });

  test('Test Song Controller when Call getSearchArtistSongs()', () async {
    /// build Binding
    binding.builder();

    /// recover your controller
    final controller = Get.find<SongController>();

    /// Call Function after find instance
    await controller.getSearchArtistSongs();

    /// await time request
    await Future.delayed(const Duration(milliseconds: 50));

    if (controller.status.isError) {
      expect(controller.state, null,
          reason: "State Controller is not Null when status is error");
    }

    if (controller.status.isSuccess) {
      expect(controller.state!.resultCount, 50,
          reason:
              "State Controller resultCount is not 50 when status is success");
    }

    Get.reset();
  });

  test('Test Song Controller when Call getArtistSongs(id)', () async {
    /// build Binding
    binding.builder();

    /// recover your controller
    final controller = Get.find<SongController>();

    /// Call Function after find instance
    await controller.getArtistSongs("941107698");

    /// await time request
    await Future.delayed(const Duration(milliseconds: 50));

    if (controller.status.isError) {
      expect(controller.state, null,
          reason: "State Controller is not Null when status is error");
    }

    if (controller.status.isSuccess) {
      expect(controller.state!.resultCount, 7,
          reason:
              "State Controller resultCount is not 7 when status is success");
    }

    Get.reset();
  });
}
