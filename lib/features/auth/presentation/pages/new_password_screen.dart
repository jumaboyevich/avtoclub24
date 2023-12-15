import 'package:avtoclub24/assets/colors/colors.dart';
import 'package:avtoclub24/assets/constants/icons.dart';
import 'package:avtoclub24/features/auth/presentation/pages/success_screen.dart';
import 'package:avtoclub24/features/common/presentation/navigator.dart';
import 'package:avtoclub24/features/common/presentation/widgets/alert_snackbar.dart';
import 'package:avtoclub24/features/common/presentation/widgets/default_text_field.dart';
import 'package:avtoclub24/features/common/presentation/widgets/w_appbar.dart';
import 'package:avtoclub24/features/common/presentation/widgets/w_button.dart';
import 'package:avtoclub24/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  late TextEditingController passrordController;
  late TextEditingController confirmPassrordController;
  late bool _passwordVisible, _confirmPasswordVisible;
  late GlobalKey<FormState> _formKey;
  @override
  void initState() {
    passrordController = TextEditingController();
    confirmPassrordController = TextEditingController();
    _passwordVisible = false;
    _confirmPasswordVisible = false;
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, bottom: 24, right: 24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      LocaleKeys.set_passwod.tr(),
                      style: Theme.of(context).textTheme.displayMedium,
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    DefaultTextField(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 22, horizontal: 15),
                      expands: !_passwordVisible,
                      errorText: "",
                      controller: passrordController,
                      isObscure: _passwordVisible,
                      onChanged: (s) {},
                      maxLines: 1,
                      minLines: null,
                      hintText: LocaleKeys.put_new_passwod.tr(),
                      suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        icon: _passwordVisible
                            ? SvgPicture.asset(
                                AppIcons.eye,
                                color: greyBlue,
                              )
                            : const Icon(
                                Icons.visibility_off_outlined,
                                color: greyBlue,
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    DefaultTextField(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 22, horizontal: 15),
                      expands: !_confirmPasswordVisible,
                      maxLines: 1,
                      minLines: null,
                      errorText: "",
                      controller: confirmPassrordController,
                      onChanged: (s) {},
                      isObscure: _confirmPasswordVisible,
                      hintText: LocaleKeys.confirm_new_passwod.tr(),
                      suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            _confirmPasswordVisible = !_confirmPasswordVisible;
                          });
                        },
                        icon: _confirmPasswordVisible
                            ? SvgPicture.asset(AppIcons.eye)
                            : const Icon(Icons.visibility_off_outlined),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      LocaleKeys.you_confirm_our_rules2.tr(),
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
                  if (passrordController.text.isEmpty &&
                      confirmPassrordController.text.isEmpty) {
                    await alertSnackbar(
                        context,
                        'Maydonlarga qiymat kiritilmadi',
                        'Ogohlantirish!',
                        MessageStatus.Warning);
                  } else if (confirmPassrordController.text
                      .contains(passrordController.text)) {
                    Navigator.of(context)
                        .push(fade(page: const SuccessScreen()));
                  } else {
                    await alertSnackbar(
                        context, 'Mos emas', 'Xatolik!', MessageStatus.Error);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
