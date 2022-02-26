import 'package:flutter/material.dart';
import 'package:kuncie_music/core.dart';

class TopRecentSongs extends GetView<SongController> {
  const TopRecentSongs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const XTitleListView(
          text: "Recent Top Songs",
        ),
        controller.obx(
          (state) {
            return ListView.builder(
              padding: const EdgeInsets.only(
                  left: 3.0, right: 3.0, top: 10.0, bottom: 23),
              primary: false,
              shrinkWrap: true,
              itemCount: state!.items?.length ?? 0,
              itemBuilder: (context, index) => SongTile(
                item: state.items![index],
              ),
            );
          },
          onLoading: const Center(child: CircularProgressIndicator()),
        ),
      ],
    );
  }
}
