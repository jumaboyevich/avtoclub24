import 'dart:async';
import 'package:avtoclub24/assets/constants/icons.dart';
import 'package:avtoclub24/core/storage/storage.dart';
import 'package:avtoclub24/core/storage/store_keys.dart';
import 'package:avtoclub24/features/auth/presentation/pages/sign_in_screen.dart';
import 'package:avtoclub24/features/common/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    final isFirstTime =
        StorageRepository.getBool(StoreKeys.isFirstTime, defValue: true);
    Timer(const Duration(seconds: 1), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(fade(
          page: const SignInScreen(),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(alignment: Alignment.center, child: Text("AvtoClub24")),
        ],
      ),
    );
  }
}
