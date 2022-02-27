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
            return _songListView(state);
          },
          onError: (error) => Center(
              child: SizedBox(
            height: 300,
            width: double.infinity,
            child: Text(error ?? ""),
          )),
          onLoading: _songListView(),
        ),
      ],
    );
  }

  ListView _songListView([Song? state]) {
    return ListView.builder(
      padding:
          const EdgeInsets.only(left: 3.0, right: 3.0, top: 10.0, bottom: 100),
      primary: false,
      shrinkWrap: true,
      itemCount: state?.items?.isEmpty ?? false ? 0 : state?.items?.length ?? 7,
      itemBuilder: (context, index) => SongTile(
        item: state?.items?[index],
      ),
    );
  }
}
