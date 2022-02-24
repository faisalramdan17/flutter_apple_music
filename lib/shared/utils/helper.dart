import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class XHelper {
  static Color generateRandomColor() {
    return Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }

  static void copyText(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  static String shortAddress(String text) {
    return text.substring(0, 5) +
        "..." +
        text.substring(text.length - 4, text.length);
  }
}
