import 'package:flutter/material.dart';
import 'package:kuncie_music/core.dart';

import 'components/date_header.dart';
import 'components/notification_body.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: GetBuilder<NotificationController>(
        initState: (_) => controller.loadData(),
        builder: (_) => SafeArea(
          bottom: false,
          child: Container(
            color: Colors.grey[200],
            child: Column(
              children: [
                const XAppBar(
                  title: "Notifications",
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.only(top: 7),
                    children: controller.messageDates.map((date) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 23.0, vertical: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            DateHeader(date: date!),
                            NotificationBody(date: date),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
