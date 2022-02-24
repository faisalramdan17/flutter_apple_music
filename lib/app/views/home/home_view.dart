import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuncie_music/core.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            TopRecentSongs(),
          ],
        ),
      ),
    );
  }
}

class TopRecentSongs extends GetView<SongController> {
  const TopRecentSongs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) {
        return Column(
          children: state!.items
                  ?.map((item) => Text(item.collectionName ?? "None"))
                  .toList() ??
              [],
        );
      },
      onLoading: const CircularProgressIndicator(),
    );
  }
}
