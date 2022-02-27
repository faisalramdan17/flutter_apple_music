import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kuncie_music/core.dart';
import 'package:matcher/matcher.dart' as m;
import 'song_mock.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpAll(() => HttpOverrides.global = null);

  final bindingSuccess = BindingsBuilder(() {
    Get.lazyPut<ISongRepository>(() => MockRepositorySuccess());
    Get.lazyPut<SongController>(
        () => SongController(songRepository: Get.find()));
  });

  final bindingFailure = BindingsBuilder(() {
    Get.lazyPut<ISongRepository>(() => MockRepositoryFailure());
    Get.lazyPut<SongController>(
        () => SongController(songRepository: Get.find()));
  });

  test('Test Song Binding', () {
    expect(Get.isPrepared<SongController>(), false);
    expect(Get.isPrepared<ISongRepository>(), false);

    /// test you Binding class with BindingsBuilder
    bindingSuccess.builder();

    expect(Get.isPrepared<SongController>(), true);
    expect(Get.isPrepared<ISongRepository>(), true);

    Get.reset();
  });

  group("Test Song Controller :", () {
    group("Call onInit() => get7MostRecentSongs()", () {
      test('at MockRepositorySuccess', () async {
        /// Controller can't be on memory
        expect(() => Get.find<SongController>(tag: 'success'),
            throwsA(const m.TypeMatcher<String>()));

        /// binding will put the controller on memory
        bindingSuccess.builder();

        /// recover your controller
        final controller = Get.find<SongController>();

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
        expect(controller.state!.resultCount, 14,
            reason:
                "State Controller resultCount is not 14 when status is success");
        expect(controller.state!.items!.length, 7,
            reason:
                "State Controller items length is not 7 when status is success");

        Get.reset();
      });
      test('at MockRepositoryFailure', () async {
        /// binding will put the controller on memory
        bindingFailure.builder();

        /// recover your controller
        final controller = Get.find<SongController>();

        /// await time request
        await Future.delayed(const Duration(milliseconds: 100));

        expect(controller.status.isError, true,
            reason: "Status Controller is not Error");
        expect(controller.state, null, reason: "Status Controller is not Null");

        Get.reset();
      });
    });
    group("Call getSearchArtistSongs()", () {
      test('at MockRepositorySuccess', () async {
        /// binding will put the controller on memory
        bindingSuccess.builder();

        /// recover your controller
        final controller = Get.find<SongController>();

        /// Call Function after find instance
        await controller.searchArtistSongs();

        /// await time request
        await Future.delayed(const Duration(milliseconds: 100));

        expect(controller.searchedSongs?.resultCount, 50,
            reason:
                "State Controller resultCount is not 50 when status is success");

        Get.reset();
      });
      test('at MockRepositoryFailure', () async {
        /// binding will put the controller on memory
        bindingFailure.builder();

        /// recover your controller
        final controller = Get.find<SongController>();

        /// Call Function after find instance
        await controller.searchArtistSongs();

        /// await time request
        await Future.delayed(const Duration(milliseconds: 100));

        expect(controller.searchedSongs?.resultCount, null,
            reason: "State Controller resultCount is not Null");

        Get.reset();
      });
    });
    group("Call getArtistSongs(id)", () {
      test('at MockRepositorySuccess', () async {
        /// binding will put the controller on memory
        bindingSuccess.builder();

        /// recover your controller
        final controller = Get.find<SongController>();

        /// Call Function after find instance
        await controller.getArtistSongs("941107698");

        /// await time request
        await Future.delayed(const Duration(milliseconds: 100));

        expect(controller.songsArtist?.resultCount, 7,
            reason:
                "State Controller resultCount is not 7 when status is success");

        Get.reset();
      });
      test('at MockRepositoryFailure', () async {
        /// binding will put the controller on memory
        bindingFailure.builder();

        /// recover your controller
        final controller = Get.find<SongController>();

        /// Call Function after find instance
        await controller.getArtistSongs("941107698");

        /// await time request
        await Future.delayed(const Duration(milliseconds: 100));

        expect(controller.songsArtist?.resultCount, null,
            reason: "State Controller resultCount is not Null");

        Get.reset();
      });
    });
  });
}
