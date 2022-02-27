import 'package:flutter/material.dart';
import 'package:kuncie_music/core.dart';
import 'package:transparent_image/transparent_image.dart';

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
                      return buildItemNotification(date!);
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

  Widget buildItemNotification(DateTime date) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23.0, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildHeadDate(date),
          Column(
            children: controller.messages
                .where((element) =>
                    XConverter.dateFormatYmdOnly(element.date) ==
                    XConverter.dateFormatYmdOnly(date))
                .map((element) => buildItemList(element))
                .toList(),
          ),
        ],
      ),
    );
  }

  Padding buildHeadDate(DateTime date) {
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

  Widget buildItemList(NotificationMessage? item) {
    bool dismissible = true;

    if (item?.progress != null && item?.goal != null) {
      if (item!.progress! < item.goal!) dismissible = false;
    }

    return !dismissible
        ? buildItemMessage(
            isDirect: item!.isDirect!,
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
            background: deleteLabel(MainAxisAlignment.start),
            secondaryBackground: deleteLabel(MainAxisAlignment.end),
            resizeDuration: const Duration(seconds: 1),
            onDismissed: (_) => controller.removeMessage(item!),
            child: buildItemMessage(
              isDirect: item!.isDirect!,
              onTap: !item.isDirect! ? null : () async {},
              title: item.title,
              content: item.content!,
              iconURL: item.iconURL,
              isRead: item.isRead!,
              progress: item.progress,
              goal: item.goal!,
            ),
          );
  }

  Widget buildItemMessage({
    void Function()? onTap,
    String? title,
    String? content,
    String? iconURL,
    int? progress = 0,
    int goal = 1,
    bool isDirect = true,
    bool isRead = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color:
                isRead ? Colors.white : Get.theme.primaryColor.withOpacity(0.9),
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: <Widget>[
            iconURL == null
                ? Container()
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FadeInImage(
                      placeholder: MemoryImage(kTransparentImage),
                      width: 70,
                      height: 50,
                      image: AssetImage(iconURL),
                    ),
                  ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            title == null
                                ? Container()
                                : Text(
                                    title,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: isRead
                                            ? Colors.black
                                            : Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                            content == null
                                ? Container()
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Text(
                                      content,
                                      style: TextStyle(
                                          color: isRead
                                              ? Colors.black
                                              : Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                      progress == null
                          ? Container()
                          : Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Image.asset(
                                AssetPaths.ICONS + "gift-circle.png",
                                height: 18,
                              ),
                            ),
                    ],
                  ),
                ),
                progress == null
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 0, bottom: 8),
                        child: XProgressBar(
                          value: progress / goal,
                        ),
                      ),
              ],
            )),
            progress != null || !isDirect
                ? Container()
                : Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(Icons.arrow_forward_ios,
                        color: isRead ? Colors.black : Colors.white, size: 20),
                  ),
          ],
        ),
      ),
    );
  }

  Widget deleteLabel(MainAxisAlignment mainAxisAlignment) {
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
