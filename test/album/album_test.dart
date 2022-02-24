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

  final bindingSuccess = BindingsBuilder(() {
    Get.lazyPut<IAlbumRepository>(() => MockRepositorySuccess());
    Get.lazyPut<AlbumController>(
        () => AlbumController(albumRepository: Get.find()));
  });

  final bindingFailure = BindingsBuilder(() {
    Get.lazyPut<IAlbumRepository>(() => MockRepositoryFailure());
    Get.lazyPut<AlbumController>(
        () => AlbumController(albumRepository: Get.find()));
  });

  test('Test Album Binding', () {
    expect(Get.isPrepared<AlbumController>(), false);
    expect(Get.isPrepared<IAlbumRepository>(), false);

    /// test you Binding class with BindingsBuilder
    bindingSuccess.builder();

    expect(Get.isPrepared<AlbumController>(), true);
    expect(Get.isPrepared<IAlbumRepository>(), true);

    Get.reset();
  });

  group("Test Album Controller :", () {
    group("Call onInit() => get7MostRecentSongs()", () {
      test('at MockRepositorySuccess', () async {
        /// Controller can't be on memory
        expect(() => Get.find<AlbumController>(tag: 'success'),
            throwsA(const m.TypeMatcher<String>()));

        /// binding will put the controller on memory
        bindingSuccess.builder();

        /// recover your controller
        final controller = Get.find<AlbumController>();

        /// check if onInit was called
        expect(controller.initialized, true,
            reason: "Controller is not Initialized");

        /// check initial Status
        expect(controller.status.isLoading, true,
            reason: "Status Controller is not Loading");

        /// await time request
        await Future.delayed(const Duration(milliseconds: 100));

        /// test if status is success
        expect(controller.status.isSuccess, true,
            reason: "Status Controller is not Success");

        expect(controller.state!.resultCount, 8,
            reason:
                "State Controller resultCount is not 8 when status is success");
        expect(controller.state!.items!.length, 4,
            reason:
                "State Controller items length is not 4 when status is success");

        Get.reset();
      });
      test('at MockRepositoryFailure', () async {
        /// binding will put the controller on memory
        bindingFailure.builder();

        /// recover your controller
        final controller = Get.find<AlbumController>();

        /// await time request
        await Future.delayed(const Duration(milliseconds: 100));

        expect(controller.status.isError, true,
            reason: "Status Controller is not Error");
        expect(controller.state, null, reason: "Status Controller is not Null");

        Get.reset();
      });
    });
    group("Call getArtistAlbums(id)", () {
      test('at MockRepositorySuccess', () async {
        /// binding will put the controller on memory
        bindingSuccess.builder();

        /// recover your controller
        final controller = Get.find<AlbumController>();

        /// Call Function after find instance
        await controller.getArtistAlbums("941107698");

        /// await time request
        await Future.delayed(const Duration(milliseconds: 100));

        /// test if status is success
        expect(controller.status.isSuccess, true,
            reason: "Status Controller is not Success");
        expect(controller.state!.resultCount, 6,
            reason:
                "State Controller resultCount is not 6 when status is success");

        Get.reset();
      });
      test('at MockRepositoryFailure', () async {
        /// binding will put the controller on memory
        bindingFailure.builder();

        /// recover your controller
        final controller = Get.find<AlbumController>();

        /// Call Function after find instance
        await controller.getArtistAlbums("941107698");

        /// await time request
        await Future.delayed(const Duration(milliseconds: 100));

        expect(controller.status.isError, true,
            reason: "Status Controller is not Error");
        expect(controller.state, null, reason: "Status Controller is not Null");

        Get.reset();
      });
    });
  });
}
