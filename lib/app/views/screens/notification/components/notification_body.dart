import 'package:flutter/material.dart';
import 'package:kuncie_music/core.dart';

import 'notification_item.dart';

class NotificationBody extends GetView<NotificationController> {
  const NotificationBody({this.date, Key? key}) : super(key: key);
  final DateTime? date;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: controller.messages
          .where((element) =>
              XConverter.dateFormatYmdOnly(element.date) ==
              XConverter.dateFormatYmdOnly(date))
          .map((item) {
        bool dismissible = true;

        if (item.progress != null && item.goal != null) {
          if (item.progress! < item.goal!) dismissible = false;
        }

        return !dismissible
            ? NotificationItem(
                isDirect: item.isDirect!,
                onTap: !item.isDirect! ? null : () async {},
                title: item.title,
                content: item.content!,
                iconURL: item.iconURL,
                isRead: item.isRead!,
                progress: item.progress!,
                goal: item.goal!,
              )
            : Dismissible(
                key: UniqueKey(),
                background: _deleteLabel(MainAxisAlignment.start),
                secondaryBackground: _deleteLabel(MainAxisAlignment.end),
                resizeDuration: const Duration(seconds: 1),
                onDismissed: (_) => controller.removeMessage(item),
                child: NotificationItem(
                  isDirect: item.isDirect!,
                  onTap: !item.isDirect! ? null : () async {},
                  title: item.title,
                  content: item.content!,
                  iconURL: item.iconURL,
                  isRead: item.isRead!,
                  progress: item.progress,
                  goal: item.goal!,
                ),
              );
      }).toList(),
    );
  }

  Widget _deleteLabel(MainAxisAlignment mainAxisAlignment) {
    return Container(
      color: Colors.red.withOpacity(0.4),
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: <Widget>[
          const Icon(Icons.delete, color: Colors.red),
          Container(width: 7),
          const Text(
            "Delete",
            style: TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }
}
