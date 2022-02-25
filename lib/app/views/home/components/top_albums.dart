import 'package:flutter/material.dart';
import 'package:kuncie_music/core.dart';

class TopAlbums extends GetView<AlbumController> {
  const TopAlbums({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const XTitleListView(
          text: "Top Albums",
        ),
        controller.obx(
          (state) {
            return GridView.builder(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 10.0, bottom: 23),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15.0,
                crossAxisSpacing: 15.0,
              ),
              primary: false,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: state!.items?.length ?? 4,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => Provider<Album>.value(
                    //         value: _albums[index],
                    //         child: SpecificAlbumScreen(),
                    //       ),
                    //     ));
                  },
                  child: AlbumTile(
                    item: state.items![index],
                  ),
                );
              },
            );
          },
          onLoading: const Center(child: CircularProgressIndicator()),
        ),
      ],
    );
  }
}
