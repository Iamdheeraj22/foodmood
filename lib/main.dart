import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodmood/app/res/size/size_config.dart';
import 'package:foodmood/app/res/strings/strings.dart';
import 'package:foodmood/app/res/styles/app_theme.dart';
import 'package:foodmood/app/routes/custom_router.dart';
import 'package:foodmood/firebase_options.dart';
import 'package:foodmood/provider/auth_provider/login_provider.dart';
import 'package:foodmood/screens/auth/login/login_screen.dart';
import 'package:foodmood/screens/food_brands/screens/food_brands_screen.dart';
import 'package:foodmood/screens/onboarding/screens/onboarding_screen.dart';
import 'package:provider/provider.dart';

import 'screens/today_mood_dishes/screens/today_mood_dishes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoginProviderModel>(
          create: (_) => LoginProviderModel(),
        )
      ],
      child: MaterialApp(
          title: Strings.appName,
          theme: AppTheme.lightTheme(context),
          darkTheme: AppTheme.darkTheme(context),
          themeMode: appTheme.themeMode,
          onGenerateRoute: CustomRouter.generateRoute,
          initialRoute: OnBoardingScreen.id,
          home: OnBoardingScreen(),
          builder: (context, child) {
            SizeConfig.initialize(
                context: context, draftWidth: 428, draftHeight: 926);
            return child!;
          }),
    );
  }
}
