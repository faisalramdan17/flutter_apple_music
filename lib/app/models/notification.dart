class NotificationMessage {
  String title;
  String? content;
  String? iconURL;
  int? progress;
  int? goal;
  bool? isRead;
  bool? isReward;
  bool? isDirect;
  DateTime? date;

  NotificationMessage({
    required this.title,
    this.content,
    this.iconURL,
    this.progress,
    this.goal = 100,
    this.isRead = true,
    this.isReward = false,
    this.isDirect = true,
    this.date,
  });

  NotificationMessage copyWith({
    String? title,
    String? content,
    String? iconURL,
    int? progress,
    int? goal,
    bool? isRead,
    bool? isReward,
    bool? isDirect,
    DateTime? date,
  }) =>
      NotificationMessage(
        title: title ?? this.title,
        content: content ?? this.content,
        iconURL: iconURL ?? this.iconURL,
        progress: progress ?? this.progress,
        goal: goal ?? this.goal,
        isRead: isRead ?? this.isRead,
        isReward: isReward ?? this.isReward,
        isDirect: isDirect ?? this.isDirect,
        date: date ?? this.date,
      );

  factory NotificationMessage.fromJson(dynamic json) => NotificationMessage(
        title:
            json["title"] == null || json["title"] == "" ? null : json["title"],
        content: json["content"] == null || json["content"] == ""
            ? null
            : json["content"],
        iconURL:
            json["icon"] == null || json["icon"] == "" ? null : json["icon"],
        progress: json["progress"] == null || json["progress"] == ""
            ? null
            : json["progress"],
        goal: json["goal"] == null || json["goal"] == "" ? null : json["goal"],
        isRead:
            json["read"] == null || json["read"] == "" ? null : json["read"],
        isDirect: json["isDirect"] == null || json["isDirect"] == ""
            ? null
            : json["isDirect"],
        date: json["date"] == null || json["date"] == ""
            ? null
            : DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
        "iconURL": iconURL,
        "progress": progress,
        "goal": goal,
        "read": isRead,
        "isReward": isDirect,
        "date": date?.toString(),
      };
}
