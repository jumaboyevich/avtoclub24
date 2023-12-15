import 'package:avtoclub24/assets/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultTextField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final EdgeInsets contentPadding;
  final Widget? prefix;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffix;
  final double prefixMaxWidth;
  final double suffixMaxWidth;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final String? hintText;
  final bool hasError;
  final bool isObscure;
  final String prefixText;
  final InputDecoration? inputDecoration;
  final TextInputType? keyboardType;
  final String title;
  final String errorText;
  final double? height;
  final int? maxLines;
   final int? minLines;
  final int? maxLength;
  final bool autoFocus;
  final FocusNode? focusNode;
  final TextAlignVertical? textAlignVertical;
  final bool? expands;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final bool showCount;
  final TextInputAction? textInputAction;
  final TextStyle? titleStyle;

  const DefaultTextField({
    this.autoFocus = false,
    this.showCount = false,
    this.focusNode,
    this.textInputAction,
    this.maxLengthEnforcement,
    required this.controller,
    required this.onChanged,
    this.prefix,
    this.title = '',
    this.errorText = '',
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16),
    this.inputFormatters,
    this.suffix,
    this.prefixMaxWidth = 40,
    this.suffixMaxWidth = 40,
    this.hintStyle,
    this.hintText,
    this.style,
    this.isObscure = false,
    this.hasError = false,
    this.prefixText = '',
    this.inputDecoration,
    this.keyboardType,
    this.height,
    this.maxLines=1,
     this.minLines=1,
    this.maxLength,
    this.titleStyle,
    this.textAlignVertical,
    this.expands,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
          height: height ?? 64,
          child: TextField(
            expands: expands ?? false,
            maxLengthEnforcement: maxLengthEnforcement,
            textAlignVertical: textAlignVertical,
            focusNode: focusNode,
            autofocus: autoFocus,
            controller: controller,
            onChanged: onChanged,
            textInputAction: textInputAction,
            style: style ?? const TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: dark),
            inputFormatters: inputFormatters,
            obscureText: isObscure,
            cursorColor: dark,
             obscuringCharacter: '●',
            keyboardType: keyboardType,
            maxLength: !isObscure ? null : maxLength,
            maxLines: !isObscure ? null : maxLines,
           minLines:  !isObscure ? null:minLines,
            decoration: inputDecoration ??
                InputDecoration(
                  
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: hasError ? red : grey, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
          
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: hasError ? red : grey, width: 2),
                  ),
                  hintText: hintText,
                  hintStyle: hintStyle ??
                      const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: greyGreen,
                      ),
                  contentPadding: contentPadding,
                  suffixIcon: suffix,
                  suffixIconColor: greyBlue,
                  suffixIconConstraints: BoxConstraints(
                    
                    maxWidth: suffixMaxWidth),
                  fillColor: Colors.transparent,
                  filled: true,
                  prefixIconConstraints: BoxConstraints(maxWidth: prefixMaxWidth),
                  prefixIcon: prefix,
                  
                  counterText: '',
                ),
          ));
  }
}
