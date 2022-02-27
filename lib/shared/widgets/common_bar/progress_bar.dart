import 'package:flutter/material.dart';

class XProgressBar extends StatelessWidget {
  const XProgressBar({
    required this.value,
    this.valueStyle,
    this.minHeight = 16,
    Key? key,
  }) : super(key: key);

  final double value;
  final double minHeight;
  final TextStyle? valueStyle;
  final double height = 16;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(7),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Stack(
          children: [
            SizedBox(
              height: minHeight < height ? height : minHeight,
              child: LinearProgressIndicator(
                value: value,
                backgroundColor: Colors.white70,
                valueColor:
                    const AlwaysStoppedAnimation<Color>(Color(0xFF33D0AE)),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: minHeight < height ? height : minHeight,
                padding: const EdgeInsets.only(right: 6),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "${(value * 100).toStringAsFixed(0)} %",
                    style: valueStyle ?? const TextStyle(fontSize: 12.5),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
