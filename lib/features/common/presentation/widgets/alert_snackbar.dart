import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

enum MessageStatus { Success, Error, Warning }

Future<void> alertSnackbar(BuildContext context, String message, String title,
    MessageStatus status) async {
  await Flushbar(
    icon: status == MessageStatus.Success
        ? const Icon(
            Icons.check_circle_outline,
          )
        : status == MessageStatus.Error
            ? const Icon(
                Icons.cancel_outlined,
              )
            : const Icon(
                Icons.warning,
              ),
    backgroundColor: status == MessageStatus.Success
        ? Colors.green
        : status == MessageStatus.Error
            ? Colors.red
            : const Color.fromARGB(255, 225, 206, 34),
    flushbarPosition: FlushbarPosition.TOP,
    title: title,
    message: message,
    duration: const Duration(milliseconds: 1500),
    isDismissible: false,
  ).show(context);
}
