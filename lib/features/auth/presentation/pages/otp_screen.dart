import 'dart:async';

import 'package:avtoclub24/assets/colors/colors.dart';
import 'package:avtoclub24/core/storage/storage.dart';
import 'package:avtoclub24/core/storage/store_keys.dart';
import 'package:avtoclub24/core/utils/formatters.dart';
import 'package:avtoclub24/features/auth/presentation/pages/new_password_screen.dart';
import 'package:avtoclub24/features/common/presentation/navigator.dart';
import 'package:avtoclub24/features/common/presentation/widgets/default_text_field.dart';
import 'package:avtoclub24/features/common/presentation/widgets/w_appbar.dart';
import 'package:avtoclub24/features/common/presentation/widgets/w_button.dart';
import 'package:avtoclub24/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  int timer = 59;
  @override
  void initState() {
    super.initState();
    Timer.periodic(
        const Duration(seconds: 1), (_) => timer > 0 ? _getDateTime() : null);
  }

  _getDateTime() {
    setState(() {
      --timer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    LocaleKeys.confirm_phone_number.tr(),
                    style: Theme.of(context).textTheme.displayMedium,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '${StorageRepository.getString(StoreKeys.phoneNumber)} ${LocaleKeys.otp_sms.tr()}',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  OtpTextField(
                    numberOfFields: 4,
                    borderColor: dark,
                    fieldWidth: MediaQuery.of(context).size.width / 5.5,
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: false,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Verification Code"),
                              content:
                                  Text('Code entered is $verificationCode'),
                            );
                          });
                    }, // end onSubmit
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  RichText(
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                        style: Theme.of(context).textTheme.headlineLarge,
                        children: <TextSpan>[
                          TextSpan(text: '00:${timer.toString().padLeft(2,'0')} ', style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                            color: violet
                          )),
                          TextSpan(
                            text: LocaleKeys.otp_retry.tr(),
                          ),
                        ]),
                  ),
               
                ],
              ),
            ),
            WButton(
              isDisabled: false,
              disabledColor: grey,
              color: violet,
              textColor: 1 == 1 ? white : greyGreen,
              text: LocaleKeys.btn_continue.tr(),
              onTap: () {
                Navigator.of(context).push(fade(page: const NewPasswordScreen()));
              },
            )
          ],
        ),
      ),
    );
  }
}
