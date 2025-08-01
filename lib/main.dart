import 'package:check_van_frontend/provider/login_provider.dart';
import 'package:check_van_frontend/provider/student_provider.dart';
import 'package:check_van_frontend/provider/trip_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:provider/provider.dart';
import 'core/theme.dart';
import 'features/forms/my_profile_form.dart';
import 'features/pages/home_page.dart';
import 'features/pages/login_page.dart';
import 'features/pages/my_profile.dart';
import 'features/pages/signup_page.dart';
import 'features/pages/students_page.dart';
import 'features/pages/trip_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => StudentProvider()),
        ChangeNotifierProvider(create: (_) => TripProvider()),
      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      title: 'Check Van',
      theme: AppTheme.theme,
      initialRoute: '/',
      routes: {
        '/': (_) => LoginPage(),
        '/signup': (_) => const SignUpPage(),
        '/home': (_) => const HomePage(),
        '/my_profile': (context) => const Scaffold(
          body: SafeArea(
            child: MyProfile(),
          ),
        ),
        '/students': (context) => const StudentPage(),
        '/trips': (context) => const TripPage(),

      },
    );
  }
}
