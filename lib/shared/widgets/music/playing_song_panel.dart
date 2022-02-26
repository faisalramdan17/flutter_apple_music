import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kuncie_music/core.dart';

class PlayingSongPanel extends GetView<PlayingSongController> {
  const PlayingSongPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx((state) {
      if (state?.trackId == null) return const SizedBox();
      return AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFD1EDFF).withOpacity(0.7),
              Colors.white,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 60,
                    width: 60,
                    margin: const EdgeInsets.only(left: 15.0),
                    decoration: BoxDecoration(
                      image: state!.artworkUrl100 == null
                          ? null
                          : DecorationImage(
                              image: NetworkImage(state.artworkUrl100!),
                              fit: BoxFit.fill,
                            ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0, left: 8),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      state.trackName?.toTitleCase() ?? "-",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.7,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      state.artistName?.toTitleCase() ?? "-",
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Color(0xFF58595C),
                                        letterSpacing: 1,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: const Padding(
                                  padding: EdgeInsets.only(right: 16.0),
                                  child: Icon(
                                    Iconsax.play,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // const SizedBox(height: 4),
                        ValueBuilder<double?>(
                          initialValue: 50,
                          builder: (_value, updateFn) {
                            return SliderPlayingSong(
                              value: _value!,
                              min: 0,
                              max: 100,
                              divisions: 100,
                              label: "$_value",
                              onChanged: (value) {
                                updateFn(value);
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
