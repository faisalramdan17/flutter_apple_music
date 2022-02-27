import 'package:flutter/material.dart';

import 'components/home_appbar.dart';
import 'components/top_albums.dart';
import 'components/top_recent_songs.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              HomeAppBar(),
              TopAlbums(),
              TopRecentSongs(),
            ],
          ),
        ),
      ),
    );
  }
}
