import 'package:flutter/material.dart';

class SliderPlayingSong extends StatelessWidget {
  const SliderPlayingSong({
    required this.value,
    required this.onChanged,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions,
    this.label,
    Key? key,
  }) : super(key: key);

  final double value, min, max;
  final String? label;
  final int? divisions;
  final void Function(double)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3, right: 6),
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          trackHeight: 3,
          trackShape: const RoundedRectSliderTrackShape(),
          thumbShape: const RoundSliderThumbShape(
            enabledThumbRadius: 7,
          ),
          overlayShape: const RoundSliderOverlayShape(
            overlayRadius: 0,
          ),
          tickMarkShape: const RoundSliderTickMarkShape(),
          valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
          valueIndicatorTextStyle: const TextStyle(
            fontSize: 11,
            color: Colors.white,
          ),
        ),
        child: Slider(
          value: value,
          min: min,
          max: max,
          divisions: divisions,
          label: label,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
