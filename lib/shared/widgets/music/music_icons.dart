import 'package:flutter/material.dart';

class PlayIcon extends StatelessWidget {
  const PlayIcon({required Color color, Key? key})
      : _color = color,
        super(key: key);

  final Color _color;

  @override
  Widget build(BuildContext context) {
    const double _radius = 55.00;

    return Container(
      width: _radius,
      height: _radius,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: _color,
        ),
        borderRadius: BorderRadius.circular(
          _radius,
        ),
      ),
      child: Center(
        child: Icon(
          Icons.play_arrow,
          color: _color,
          size: 32.0,
        ),
      ),
    );
  }
}

class PauseIcon extends StatelessWidget {
  const PauseIcon({required Color color, Key? key})
      : _color = color,
        super(key: key);

  final Color _color;

  @override
  Widget build(BuildContext context) {
    const double _radius = 55;

    return Container(
      width: _radius,
      height: _radius,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: _color,
        ),
        borderRadius: BorderRadius.circular(
          _radius,
        ),
      ),
      child: Center(
        child: Icon(
          Icons.pause,
          color: _color,
          size: 32.0,
        ),
      ),
    );
  }
}

class ShowIcon extends StatelessWidget {
  const ShowIcon({required Color color, Key? key})
      : _color = color,
        super(key: key);

  final Color _color;

  @override
  Widget build(BuildContext context) {
    const double _radius = 32;
    return Container(
      width: _radius,
      height: _radius,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: _color,
        ),
        borderRadius: BorderRadius.circular(
          _radius,
        ),
      ),
      child: Center(
        child: Icon(
          Icons.keyboard_arrow_up,
          color: _color,
          size: 22.0,
        ),
      ),
    );
  }
}

class HideIcon extends StatelessWidget {
  const HideIcon({required Color color, Key? key})
      : _color = color,
        super(key: key);

  final Color _color;

  @override
  Widget build(BuildContext context) {
    const double _radius = 32;
    return Container(
      width: _radius,
      height: _radius,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: _color,
        ),
        borderRadius: BorderRadius.circular(
          _radius,
        ),
      ),
      child: Center(
        child: Icon(
          Icons.keyboard_arrow_down,
          color: _color,
          size: 22.0,
        ),
      ),
    );
  }
}
