extension StringCasingExtension on String {
  String toCapitalized() {
    var firstLetter = this[0];
    if (length > 0) {
      if (firstLetter.contains(RegExp(r"[$&+,:;=?@#|'<>.^*()%!-]")) &&
          length > 1) {
        var firstSecondLetter = firstLetter + this[1].toUpperCase();
        return '$firstSecondLetter${substring(2).toLowerCase()}';
      } else {
        return '${firstLetter.toUpperCase()}${substring(1).toLowerCase()}';
      }
    } else {
      return '';
    }
  }

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
