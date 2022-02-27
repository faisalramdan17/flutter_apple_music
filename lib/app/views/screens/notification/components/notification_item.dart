import 'package:flutter/material.dart';
import 'package:kuncie_music/core.dart';
import 'package:transparent_image/transparent_image.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    this.onTap,
    this.title,
    this.content,
    this.iconURL,
    this.progress = 0,
    this.goal = 1,
    this.isDirect = true,
    this.isRead = false,
    Key? key,
  }) : super(key: key);

  final void Function()? onTap;
  final String? title;
  final String? content;
  final String? iconURL;
  final int? progress;
  final int goal;
  final bool isDirect;
  final bool isRead;

  @override
  Widget build(BuildContext context) {
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
                      image: AssetImage(iconURL!),
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
                                    title ?? "-",
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
                                      content ?? "",
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
                          value: progress! / goal,
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
}
