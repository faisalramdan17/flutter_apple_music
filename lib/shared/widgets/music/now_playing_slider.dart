import 'dart:math';
import 'package:flutter/material.dart';
import 'package:kuncie_music/core.dart';

class NowPlayingSlider extends StatefulWidget {
  final Duration duration;
  final Duration position;
  final Duration bufferedPosition;
  final ValueChanged<Duration>? onChanged;
  final ValueChanged<Duration>? onChangeEnd;

  const NowPlayingSlider({
    Key? key,
    required this.duration,
    required this.position,
    this.bufferedPosition = Duration.zero,
    this.onChanged,
    this.onChangeEnd,
  }) : super(key: key);

  @override
  _NowPlayingSliderState createState() => _NowPlayingSliderState();
}

class _NowPlayingSliderState extends State<NowPlayingSlider> {
  double? _dragValue;
  bool _dragging = false;
  late SliderThemeData _sliderThemeData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _sliderThemeData = SliderTheme.of(context).copyWith(
      trackHeight: 2.0,
      trackShape: const RoundedRectSliderTrackShape(),
      thumbShape: const RoundSliderThumbShape(
        enabledThumbRadius: 5,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    final value = min(
      _dragValue ?? widget.position.inMilliseconds.toDouble(),
      widget.duration.inMilliseconds.toDouble(),
    );
    if (_dragValue != null && !_dragging) {
      _dragValue = null;
    }
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 57),
          child: SliderTheme(
            data: _sliderThemeData,
            child: Slider(
              min: 0.0,
              max: widget.duration.inMilliseconds.toDouble(),
              value: value,
              label: XConverter.durationToTime(
                  Duration(milliseconds: value.round())),
              divisions: widget.duration.inMilliseconds > 0
                  ? widget.duration.inMilliseconds
                  : 1,
              onChanged: (value) {
                if (!_dragging) {
                  _dragging = true;
                }
                setState(() {
                  _dragValue = value;
                });
                if (widget.onChanged != null) {
                  widget.onChanged!(Duration(milliseconds: value.round()));
                }
              },
              onChangeEnd: (value) {
                if (widget.onChangeEnd != null) {
                  widget.onChangeEnd!(Duration(milliseconds: value.round()));
                }
                _dragging = false;
              },
            ),
          ),
        ),
        Positioned(
          right: 12.0,
          bottom: -1.7,
          child: Text("-" + XConverter.durationToTime(_remaining),
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(fontSize: 11.5)),
        ),
      ],
    );
  }

  Duration get _remaining => widget.duration - widget.position;
}
