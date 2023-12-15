import 'package:avtoclub24/assets/themes/theme.dart';
import 'package:avtoclub24/core/storage/storage.dart';
import 'package:avtoclub24/core/storage/store_keys.dart';
import 'package:avtoclub24/features/authentification/presentation/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await StorageRepository.getInstance();
  runApp(EasyLocalization(
      path: 'lib/assets/translations',
      supportedLocales: const [
        Locale('uz'),
        Locale('en'),
        Locale('ru'),
      ],
      fallbackLocale: Locale(StorageRepository.getString(StoreKeys.deviceLanguage, defValue: 'uz')),
      startLocale: Locale(StorageRepository.getString(StoreKeys.deviceLanguage, defValue: 'uz')),
      saveLocale: true,
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'LMS APP',
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme(),
        
        home: const SplashScreen(),
        onGenerateRoute: (settings) => MaterialPageRoute(builder: (_) => const SplashScreen()),
      );
  }
}
