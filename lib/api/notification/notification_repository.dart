import 'package:kuncie_music/core.dart';

class NotificationRepository {
  List<NotificationMessage> getMessageList() {
    return <NotificationMessage>[
      NotificationMessage(
        title: "Progress",
        content: "Please finish tour guide, how to book car!",
        progress: 70,
        date: DateTime.now(),
        isRead: false,
      ),
      NotificationMessage(
        title: "Updates",
        content: "We have some of the newest features in this version",
        iconURL: "assets/images/notifications/news.png",
        date: DateTime.now(),
        isRead: false,
      ),
      NotificationMessage(
        title: "Analytics",
        content: "Analysis your all transaction daily, monthly, or annual.",
        iconURL: "assets/images/notifications/analytics.png",
        date: DateTime.now(),
        isRead: true,
      ),
      NotificationMessage(
        title: "Share",
        content: "You can share any information to your friends.",
        iconURL: "assets/images/notifications/info-sharing.png",
        date: DateTime.now().subtract(const Duration(days: 1)),
        isRead: true,
      ),
      NotificationMessage(
        title: "Verification",
        content: "Your personal data was already verified.",
        iconURL: "assets/images/notifications/verification.png",
        date: DateTime.now().subtract(const Duration(days: 1)),
        isRead: true,
        isDirect: false,
      ),
    ];
  }

  List<DateTime?> getMessageDateList() {
    List<DateTime?> list =
        getMessageList().map((message) => message.date).toList();

    list.sort((b, a) => a!.compareTo(b!));

    list =
        list.map((date) => XConverter.dateFormatYmdOnly(date)).toSet().toList();

    return list;
  }
}
