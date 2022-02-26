import 'package:flutter/material.dart';

import 'components/search_appbar.dart';
import 'components/search_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SearchAppBar(),
            SearchBody(),
          ],
        ),
      ),
    );
  }
}
