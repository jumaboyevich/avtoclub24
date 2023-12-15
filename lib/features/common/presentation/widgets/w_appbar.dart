import 'package:avtoclub24/assets/colors/colors.dart';
import 'package:avtoclub24/assets/constants/icons.dart';
import 'package:avtoclub24/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool hasBackButton;
  final VoidCallback? onTapBack;
  final String? title;
  final Widget? child;
  final TextStyle? titleStyle;
  final List<Widget> extraActions;
  final Color? backgroundColor;
  final String? backgroundAsset;
  final double? bottomRadius;
  final bool filledBackButton;
  final double? topMargin;
  final bool hasUnderline;
  final bool isTitleText;
  final double? height;
  final Color? underlineColor;
  final Color? roundedEndColor;
  final String textWithButton;
  final Widget? childWithButton;
  final Widget? titleWidget;

  final List<BoxShadow>? boxShadow;

  ///Default is 20
  final double backButtonSize;

  ///Default is 8
  final double backTitleBetweenSize;

  ///Default is set true
  final bool centerTitle;

  final Widget? bottom;

  const WAppBar({
    Key? key,
    this.backTitleBetweenSize = 8,
    this.backButtonSize = 20,
    this.bottomRadius,
    this.topMargin,
    this.underlineColor,
    this.hasUnderline = false,
    this.filledBackButton = false,
    this.backgroundAsset,
    this.child,
    this.onTapBack,
    this.backgroundColor,
    this.hasBackButton = true,
    this.isTitleText = true,
    this.title,
    this.titleWidget,
    this.titleStyle,
    this.extraActions = const [],
    this.centerTitle = true,
    this.boxShadow,
    this.height,
    this.roundedEndColor,
    this.textWithButton = '',
    this.childWithButton,
    this.bottom,
  }) : super(key: key);

  @override
  Size get preferredSize {
    if (hasUnderline) {
      return Size.fromHeight((height == null ? 60 : height! + 1));
    } else {
      return Size.fromHeight((height ?? 60));
    }
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Container(
            height: (height ?? 56) + MediaQuery.of(context).padding.top,
            padding: EdgeInsets.only(
                left: filledBackButton ? 16 : 0, top: (topMargin ?? 0) + MediaQuery.of(context).padding.top),
            decoration: BoxDecoration(
              boxShadow: boxShadow ??
                  [
                    BoxShadow(
                      offset: const Offset(0, 4),
                      blurRadius: 16,
                      color: white.withOpacity(0.1),
                    ),
                  ],
              color: backgroundColor ?? Theme.of(context).appBarTheme.backgroundColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(bottomRadius ?? 0),
                bottomRight: Radius.circular(bottomRadius ?? 0),
              ),
              image: backgroundAsset != null && backgroundAsset!.isNotEmpty
                  ? DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(backgroundAsset!),
                    )
                  : null,
            ),
            child: Column(
              children: [
                Flexible(
                  flex: 1,
                  child: Stack(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (hasBackButton)
                            Align(
                              alignment: Alignment.center,
                              child: WScaleAnimation(
                                onTap: onTapBack ?? () => Navigator.pop(context),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 16,
                                    right: 16,
                                    top: 8,
                                    bottom: 8,
                                  ),
                                  child: SvgPicture.asset(
                                    width: 24,
                                    height: 24,
                                    AppIcons.arrowLeft,
                                    fit: BoxFit.scaleDown,
                                    color: black
                                  ),
                                ),
                              ),
                            )
                          else
                            const SizedBox(),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              textWithButton,
                              style: titleStyle ?? Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16),
                            ),
                          ),
                          if (childWithButton != null)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [childWithButton!],
                            ),
                          const Spacer(),
                          ...List.of(extraActions)
                        ],
                      ),
                      if (child != null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [child!],
                        )
                      else
                        isTitleText
                            ? Row(
                                mainAxisAlignment: centerTitle ? MainAxisAlignment.center : MainAxisAlignment.start,
                                children: [
                                  if (!centerTitle) ...{
                                    SizedBox(
                                      width: backButtonSize + 16 + backTitleBetweenSize,
                                    )
                                  },
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      title ?? '',
                                      style: titleStyle ??
                                          Theme.of(context).textTheme.displayLarge!.copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                    ),
                                  ),
                                ],
                              )
                            : titleWidget ?? Container()
                    ],
                  ),
                ),
                if (bottom != null) bottom!,
              ],
            ),
          ),
          if (hasUnderline)
            Container(
              height: 1,
              color: underlineColor ?? const Color(0xffEBECEB),
            )
          else
            const SizedBox()
        ],
      );
}
