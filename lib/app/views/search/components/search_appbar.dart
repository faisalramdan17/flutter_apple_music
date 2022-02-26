import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kuncie_music/core.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Debouncer onSearchDebouncer =
        Debouncer(delay: const Duration(milliseconds: 500));

    return SliverAppBar(
      floating: true,
      centerTitle: true,
      elevation: 0.7,
      titleSpacing: 0.0,
      backgroundColor: Colors.white,
      title: GetBuilder<SongController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: TextField(
              controller: controller.searchTextCtrl,
              autocorrect: false,
              autofocus: false,
              onChanged: (val) {
                controller.update();
                onSearchDebouncer.call(
                  () {
                    if (val.isNotEmpty) {
                      controller.searchArtistSongs();
                    }
                  },
                );
              },
              decoration: InputDecoration(
                hintText: "Search song by artist name",
                hintStyle: const TextStyle(fontSize: 17),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(width: 0, style: BorderStyle.none),
                ),
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: const EdgeInsets.all(0),
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(bottom: 3),
                  child: Icon(Iconsax.search_normal_1, size: 21),
                ),
                suffixIcon: controller.searchTextCtrl.text.isEmpty
                    ? const SizedBox()
                    : GestureDetector(
                        onTap: controller.onClearTapped,
                        child: Icon(
                          Icons.clear,
                          color: Colors.red[400],
                        ),
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
