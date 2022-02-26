import 'package:flutter/material.dart';
import 'package:kuncie_music/core.dart';
import 'package:lottie/lottie.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 10, bottom: 17),
      sliver: GetBuilder<SongController>(
        builder: (state) {
          if (state.searchedSongs == null) {
            return SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(70.0),
                child: Lottie.asset(
                  LottiePath.EMPTY_BOX,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => SongTile(
                item: state.searchedSongs!.items![index],
              ),
              childCount: state.searchedSongs?.items?.length ?? 0,
            ),
          );
        },
      ),
    );
  }
}