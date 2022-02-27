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
            return _albumGridView(state);
          },
          onError: (error) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
                child: SizedBox(
              height: 150,
              width: double.infinity,
              child: Center(
                  child: Text(
                (error ?? "") + "\n\nPlease pull to refresh and try again!",
                style: Get.theme.textTheme.titleMedium!
                    .copyWith(color: Colors.red[400]),
              )),
            )),
          ),
          onLoading: _albumGridView(),
        ),
      ],
    );
  }

  GridView _albumGridView([Album? state]) {
    return GridView.builder(
      padding:
          const EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0, bottom: 23),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 15.0,
        crossAxisSpacing: 15.0,
      ),
      primary: false,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: state?.items?.isEmpty ?? false ? 0 : state?.items?.length ?? 6,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => XOpenDialog.info(
            lottiePath: LottiePath.COMING_SOON,
            lottiePadding: const EdgeInsets.only(top: 50),
          ),
          child: AlbumTile(
            item: state?.items?[index],
          ),
        );
      },
    );
  }
}
