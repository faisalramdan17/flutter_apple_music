import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:kuncie_music/core.dart';
import 'package:matcher/matcher.dart' as m;
import 'album_mock.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpAll(() => HttpOverrides.global = null);
  final binding = BindingsBuilder(() {
    Get.lazyPut<IAlbumRepository>(() => MockRepository());
    Get.lazyPut<AlbumController>(
        () => AlbumController(albumRepository: Get.find()));
  });

  test('Test Album Binding', () {
    expect(Get.isPrepared<AlbumController>(), false);
    expect(Get.isPrepared<IAlbumRepository>(), false);

    /// test you Binding class with BindingsBuilder
    binding.builder();

    expect(Get.isPrepared<AlbumController>(), true);
    expect(Get.isPrepared<IAlbumRepository>(), true);

    Get.reset();
  });

  test('Test Album Controller when Call onInit() => append()', () async {
    /// Controller can't be on memory
    expect(() => Get.find<AlbumController>(),
        throwsA(const m.TypeMatcher<String>()));

    /// build Binding
    binding.builder();

    /// recover your controller
    final controller = Get.find<AlbumController>();

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
      expect(controller.state!.resultCount, 8,
          reason:
              "State Controller resultCount is not 8 when status is success");
    }

    Get.reset();
  });

  test('Test Album Controller when Call getArtistAlbums(id)', () async {
    /// build Binding
    binding.builder();

    /// recover your controller
    final controller = Get.find<AlbumController>();

    /// Call Function after find instance
    await controller.getArtistAlbums("941107698");

    /// await time request
    await Future.delayed(const Duration(milliseconds: 50));

    if (controller.status.isError) {
      expect(controller.state, null,
          reason: "State Controller is not Null when status is error");
    }

    if (controller.status.isSuccess) {
      expect(controller.state!.resultCount, 6,
          reason:
              "State Controller resultCount is not 6 when status is success");
    }

    Get.reset();
  });
}
