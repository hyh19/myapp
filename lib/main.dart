import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'theme/app_theme.dart';
import 'pages/home_page.dart';
import 'pages/support_page.dart';
import 'pages/privacy_policy_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Batch File Rename Assistant',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomePage(),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: '/support',
          page: () => const SupportPage(),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: '/privacy',
          page: () => const PrivacyPolicyPage(),
          transition: Transition.noTransition,
        ),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
