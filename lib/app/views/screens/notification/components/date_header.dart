import 'package:flutter/material.dart';
import 'package:kuncie_music/core.dart';

class DateHeader extends StatelessWidget {
  const DateHeader({
    required this.date,
    Key? key,
  }) : super(key: key);

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 8),
      child: Text(
        XConverter.dateFormatYmdOnly(DateTime.now()) ==
                XConverter.dateFormatYmdOnly(date)
            ? "New"
            : XConverter.stringFormatDmyHeader(date) ?? "-",
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
    );
  }
}
