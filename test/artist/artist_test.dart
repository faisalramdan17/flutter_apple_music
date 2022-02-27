import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kuncie_music/core.dart';
import 'package:matcher/matcher.dart' as m;
import 'artist_mock.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpAll(() => HttpOverrides.global = null);
  final bindingSuccess = BindingsBuilder(() {
    Get.lazyPut<IArtistRepository>(() => MockRepositorySuccess());
    Get.lazyPut<ArtistController>(
        () => ArtistController(artistRepository: Get.find()));
  });

  final bindingFailure = BindingsBuilder(() {
    Get.lazyPut<IArtistRepository>(() => MockRepositoryFailure());
    Get.lazyPut<ArtistController>(
        () => ArtistController(artistRepository: Get.find()));
  });

  test('Test Artist Binding', () {
    expect(Get.isPrepared<ArtistController>(), false);
    expect(Get.isPrepared<IArtistRepository>(), false);

    /// test you Binding class with BindingsBuilder
    bindingSuccess.builder();

    expect(Get.isPrepared<ArtistController>(), true);
    expect(Get.isPrepared<IArtistRepository>(), true);

    Get.reset();
  });

  group("Test Artist Controller :", () {
    group("Call getArtist(id)", () {
      test('at MockRepositorySuccess', () async {
        /// Controller can't be on memory
        expect(() => Get.find<ArtistController>(tag: 'success'),
            throwsA(const m.TypeMatcher<String>()));

        /// binding will put the controller on memory
        bindingSuccess.builder();

        /// recover your controller
        final controller = Get.find<ArtistController>();

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
        expect(controller.state!.resultCount, 1,
            reason:
                "State Controller resultCount is not 1 when status is success");

        Get.reset();
      });
      test('at MockRepositoryFailure', () async {
        /// binding will put the controller on memory
        bindingFailure.builder();

        /// recover your controller
        final controller = Get.find<ArtistController>();

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
