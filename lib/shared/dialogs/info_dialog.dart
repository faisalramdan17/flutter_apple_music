import 'package:kuncie_music/core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class InfoDialog extends StatelessWidget {
  const InfoDialog({
    this.title,
    this.content,
    this.lottiePath,
    this.lottiePadding,
    this.padding,
    this.labelButton,
    this.colorButton,
    this.colorTextButton,
    this.fontSizeButton,
    this.iconButton,
    this.onPressed,
    this.customWidget,
    Key? key,
  }) : super(key: key);

  final String? title, content, lottiePath;
  final EdgeInsets? lottiePadding, padding;
  final String? labelButton;
  final Color? colorButton;
  final Color? colorTextButton;
  final double? fontSizeButton;
  final Function()? onPressed;
  final Icon? iconButton;
  final Widget? customWidget;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: padding,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              (lottiePath == null)
                  ? Container()
                  : Padding(
                      padding: lottiePadding!.copyWith(bottom: 15.0),
                      child: Lottie.asset(
                        lottiePath!,
                        height: 130,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
              (title == null)
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 15),
                      child: Text(
                        title!,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
              (content == null)
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 8),
                      child: Text(
                        content!,
                        style: const TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
              (customWidget == null)
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 8),
                      child: customWidget,
                    ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
                child: XActionButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    label: Text(
                      labelButton ?? "Ok, Thanks!",
                      style: TextStyle(
                        color: colorTextButton,
                        fontSize: fontSizeButton ?? 16,
                      ),
                    )),
                // child: InkWell(
                //   onTap: onPressed,
                //   child: Container(
                //     height: 45,
                //     padding: const EdgeInsets.symmetric(horizontal: 15),
                //     decoration: BoxDecoration(
                //       color: colorButton ?? Get.theme.primaryColor,
                //       borderRadius: const BorderRadius.all(
                //         Radius.circular(7),
                //       ),
                //       border: Border.all(
                //         color: Get.theme.primaryColor,
                //         width: 1,
                //       ),
                //     ),
                //     child: Center(
                //         child: Text(
                //       labelButton ?? "Ok, Thanks!",
                //       style: TextStyle(
                //         color: colorTextButton,
                //         fontSize: fontSizeButton ?? 16,
                //       ),
                //     )),
                //   ),
                // ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
