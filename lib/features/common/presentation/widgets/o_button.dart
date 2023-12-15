import 'package:avtoclub24/assets/colors/colors.dart';
import 'package:avtoclub24/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String text;
  final Color? color;
  final Color textColor;
  final TextStyle? textStyle;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final GestureTapCallback onTap;
  final BoxBorder? border;
  final double borderRadius;
  final Widget? child;
  final Color disabledColor;
  final bool isDisabled;
  final bool isLoading;
  final double? scaleValue;
  final List<BoxShadow>? shadow;
  final Gradient? gradient;

  const OButton({
    required this.onTap,
    this.child,
    this.text = '',
    this.color=Colors.transparent,
    this.textColor = white,
    this.borderRadius = 8,
    this.disabledColor = greyGreen,
    this.isDisabled = false,
    this.isLoading = false,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.textStyle,
    this.border,
    this.scaleValue,
    this.shadow,
    this.gradient,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      scaleValue: scaleValue ?? 0.98,
      onTap: () {
        if (!(isLoading || isDisabled)) {
          onTap();
        }
      },
      isDisabled: isDisabled,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: width,
        height: height ?? 56,
        margin: margin,
        padding: padding ?? EdgeInsets.zero,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius),
          border: border?? Border.all(color:violet),
          gradient: isDisabled
              ? null
              : color != null
                  ? null
                  : (gradient),
          boxShadow: shadow,
        ),
        child: isLoading
            ? const Center(
                child: CupertinoActivityIndicator(
                color: Colors.white,
              ))
            : AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      height: 1.36,
                      color: isDisabled ? white : textColor,
                    ),
                child: child ??
                    Text(
                      text,
                      style: textStyle?? TextStyle(fontSize: 16, fontStyle: FontStyle.normal, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
              ),
      ),
    );
  }
}
