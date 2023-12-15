import 'package:avtoclub24/assets/colors/colors.dart';
import 'package:avtoclub24/features/common/presentation/widgets/w_button.dart';
import 'package:flutter/material.dart';

class WAndroidDialog extends StatelessWidget {
  final bool isOneActions;
  final Color? noColor;
  final Color? yesColor;
  final Color? yesBtnColor;
  final String title;
  final String content;
  final String? noText;
  final String yesText;
  final VoidCallback? noFunc;
  final VoidCallback yesFunc;

  const WAndroidDialog(
      {Key? key,
      this.noColor,
      this.yesColor,
      this.yesBtnColor,
      required this.isOneActions,
      required this.title,
      required this.content,
      this.noText,
      required this.yesText,
      this.noFunc,
      required this.yesFunc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 17,
              color: dark,
              fontWeight: FontWeight.w700,
            ),
      ),
      content: Text(
        content,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 14,
              color: dark,
              fontWeight: FontWeight.w400,
            ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isOneActions
                  ? Container()
                  : Expanded(
                      child: WButton(
                        height: 44,
                        // width: 146,
                        onTap: noFunc ?? () {},
                        color: scaffoldColor.withOpacity(.2),
                        child: Text(
                          noText ?? '',
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                fontSize: 17,
                                color: dark,
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                      ),
                    ),
              isOneActions ? Container() : const SizedBox(width: 12),
              Expanded(
                child: WButton(
                  height: 44,
                  // width: 146,
                  onTap: yesFunc,
                  color: yesBtnColor ?? greyGreen,
                  child: Text(
                    yesText,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 17,
                          color: yesColor ?? white,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
