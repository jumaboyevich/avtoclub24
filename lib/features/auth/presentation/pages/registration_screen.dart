import 'package:avtoclub24/assets/colors/colors.dart';
import 'package:avtoclub24/core/storage/storage.dart';
import 'package:avtoclub24/core/storage/store_keys.dart';
import 'package:avtoclub24/core/utils/formatters.dart';
import 'package:avtoclub24/features/auth/presentation/pages/otp_screen.dart';
import 'package:avtoclub24/features/common/presentation/navigator.dart';
import 'package:avtoclub24/features/common/presentation/widgets/default_text_field.dart';
import 'package:avtoclub24/features/common/presentation/widgets/w_appbar.dart';
import 'package:avtoclub24/features/common/presentation/widgets/w_button.dart';
import 'package:avtoclub24/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late TextEditingController phoneController;

  @override
  void initState() {
    phoneController = TextEditingController(
        text: Formatters.phoneFormatter().getMaskedText());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WAppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, bottom: 24, right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    LocaleKeys.login.tr(),
                    style: Theme.of(context).textTheme.displayMedium,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  DefaultTextField(
                    expands: true,
                    errorText: "",
                    keyboardType: TextInputType.phone,
                    title: LocaleKeys.phone_number.tr(),
                    controller: phoneController,
                    inputFormatters: [Formatters.phoneFormatter()],
                    onChanged: (s) {},
                    hintText: LocaleKeys.enter_your_phone.tr(),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    '... dan ro’yxatdan o’tishingiz bilan bizning shartlarga rozi bo’lasiz',
                    style: Theme.of(context).textTheme.headlineLarge,
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
              onTap: () async {
                debugPrint(phoneController.text);
                await StorageRepository.putString(
                        StoreKeys.phoneNumber,
                        phoneController.text.isNotEmpty
                            ? phoneController.text
                            : '')!
                    .whenComplete(() {
                  Navigator.of(context).push(fade(page: const OtpScreen()));
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
