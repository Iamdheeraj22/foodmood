import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodmood/app/res/size/size_config.dart';
import 'package:foodmood/app/res/strings/strings.dart';
import 'package:foodmood/app/res/styles/app_theme.dart';
import 'package:foodmood/app/routes/custom_router.dart';
import 'package:foodmood/firebase_options.dart';
import 'package:foodmood/provider/auth_provider/login_provider.dart';
import 'package:foodmood/provider/auth_provider/register_provider.dart';
import 'package:foodmood/provider/auth_provider/reset_password_provider.dart';
import 'package:foodmood/screens/auth/login/login_screen.dart';
import 'package:provider/provider.dart';

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
        ChangeNotifierProvider<LoginProviderModel>(
          create: (_) => LoginProviderModel(),
        ),
        ChangeNotifierProvider<RegisterViewModel>(
            create: (_) => RegisterViewModel()),
        ChangeNotifierProvider<ResetPasswordViewModel>(
            create: (_) => ResetPasswordViewModel())
      ],
      child: MaterialApp(
          title: AppStrings.appName,
          themeMode: appTheme.themeMode,
          onGenerateRoute: CustomRouter.generateRoute,
          initialRoute: LoginScreen.id,
          home: const LoginScreen(),
          builder: (context, child) {
            SizeConfig.initialize(
                context: context, draftWidth: 428, draftHeight: 926);
            return child!;
          }),
    );
  }
}
