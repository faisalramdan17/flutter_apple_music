import 'package:kuncie_music/core.dart';

class NotificationController extends GetxController {
  List<NotificationMessage> messages = [];
  List<DateTime?> messageDates = [];
  String title = "qwerty";

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  loadData() {
    messages = NotificationRepository().getMessageList();
    messageDates = NotificationRepository().getMessageDateList();
  }

  removeMessage(NotificationMessage item) {
    messages.remove(item);
    update();
  }
}
