import 'package:avtoclub24/assets/colors/colors.dart';
import 'package:avtoclub24/assets/constants/icons.dart';
import 'package:avtoclub24/core/utils/formatters.dart';
import 'package:avtoclub24/features/auth/presentation/pages/registration_screen.dart';
import 'package:avtoclub24/features/common/presentation/navigator.dart';
import 'package:avtoclub24/features/common/presentation/w_android_dialog.dart';
import 'package:avtoclub24/features/common/presentation/widgets/alert_snackbar.dart';
import 'package:avtoclub24/features/common/presentation/widgets/default_text_field.dart';
import 'package:avtoclub24/features/common/presentation/widgets/o_button.dart';
import 'package:avtoclub24/features/common/presentation/widgets/w_appbar.dart';
import 'package:avtoclub24/features/common/presentation/widgets/w_button.dart';
import 'package:avtoclub24/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController phoneController;
  late TextEditingController passwordController;

  @override
  void initState() {
    phoneController = TextEditingController(text: Formatters.phoneFormatter('998').getMaskedText());
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      LocaleKeys.login.tr(),
                      style: Theme.of(context).textTheme.displayMedium,
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    DefaultTextField(
                      expands: true,
                      errorText: "",
                      keyboardType: TextInputType.phone,
                      controller: phoneController,
                      inputFormatters: [Formatters.phoneFormatter(null)],
                      onChanged: (s) {},
                      hintText: LocaleKeys.enter_your_phone.tr(),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    DefaultTextField(
                      expands: true,
                      errorText: "",
                      controller: passwordController,
                      onChanged: (s) {},
                      hintText: LocaleKeys.enter_your_password.tr(),
                      suffix: Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: SvgPicture.asset(AppIcons.eye),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextButton(
                        onPressed: ()async {
                               await  alertSnackbar(context, LocaleKeys.forget_password.tr(), LocaleKeys.forget_password.tr(), MessageStatus.Success);
           
                        },
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            LocaleKeys.forget_password.tr(),
                            style: const TextStyle(color: violet), textAlign: TextAlign.start,
                          ),
                        )),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  OButton(
                    isDisabled: false,
                    disabledColor: grey,
                    color: violet,
                    textColor: black,
                    text: LocaleKeys.btn_registation.tr(),
                    onTap: () {},
                  ),
                      const SizedBox(
                      height: 16,
                    ),
                  WButton(
                    isDisabled: false,
                    disabledColor: grey,
                    color: violet,
                    textColor: 1 == 1 ? white : greyGreen,
                    text: LocaleKeys.btn_continue.tr(),
                    onTap: () {
                      Navigator.of(context)
                          .push(fade(page: const RegistrationScreen()));
                    },
                  ),
                   const SizedBox(
                      height: 16,
                    ),
                    RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.headlineSmall,
        children: <TextSpan>[
          TextSpan(text: LocaleKeys.you_confirm_our_rules_start.tr()),
          TextSpan(
              text:LocaleKeys.you_confirm_our_rules_keyword.tr(),
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: violet),
              recognizer: TapGestureRecognizer()
                ..onTap = ()async {
                 await  alertSnackbar(context, LocaleKeys.you_confirm_our_rules_keyword.tr(), LocaleKeys.you_confirm_our_rules_keyword.tr(), MessageStatus.Success);
           
                }),
          TextSpan(text: LocaleKeys.you_confirm_our_rules_end.tr()),
        
        ],
      ),
    )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
