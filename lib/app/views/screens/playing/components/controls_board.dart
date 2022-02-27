import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:kuncie_music/core.dart';

class ControlsBoard extends StatelessWidget {
  const ControlsBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          _fastButton(),
          _playButton(),
        ],
      ),
    );
  }

  Widget _fastButton() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 245,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color(0xFFDCE4F4),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 20,
              offset: const Offset(2, 1.5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: GestureDetector(
                onTap: () => NowPlayingController.to.audioHandler.rewind(),
                child: const Icon(
                  Icons.fast_rewind,
                  color: Color(0xFF7B92CA),
                  size: 40,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: GestureDetector(
                onTap: () => NowPlayingController.to.audioHandler.fastForward(),
                child: const Icon(
                  Icons.fast_forward,
                  color: Color(0xFF7B92CA),
                  size: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _playButton() {
    return Align(
      alignment: Alignment.center,
      child: StreamBuilder<PlaybackState>(
          stream: NowPlayingController.to.audioHandler.playbackState,
          builder: (context, snapshot) {
            final isPlaying = snapshot.data?.playing ?? false;
            final isCompleted = snapshot.data?.processingState ==
                AudioProcessingState.completed;

            return GestureDetector(
              onTap: () {
                if (isCompleted) {
                  NowPlayingController.to
                      .addPlayingSong(NowPlayingController.to.state!);
                } else if (isPlaying) {
                  NowPlayingController.to.audioHandler.pause();
                } else {
                  NowPlayingController.to.audioHandler.play();
                }
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 30,
                      offset: const Offset(2, 1.5),
                    ),
                  ],
                ),
                child: Center(
                  child: AnimatedCrossFade(
                    duration: const Duration(milliseconds: 200),
                    crossFadeState: isPlaying
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    firstChild: const Icon(
                      Icons.pause,
                      size: 50,
                      color: Color(0xFF7B92CA),
                    ),
                    secondChild: const Icon(
                      Icons.play_arrow,
                      size: 50,
                      color: Color(0xFF7B92CA),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
