import 'package:flutter/material.dart';
import 'package:foodmood/screens/account_details/edit_screen/edit_screen.dart';
import 'package:foodmood/screens/account_details/preview_screen/preview_screen.dart';
import 'package:foodmood/screens/account_details/profile_screen/profile_screen.dart';
import 'package:foodmood/screens/account_details/settings/settings_screen.dart';
import 'package:foodmood/screens/address/screens/addresses_screen.dart';
import 'package:foodmood/screens/auth/change_password_success_screen.dart';
import 'package:foodmood/screens/auth/forget_password/forget_password_screen.dart';
import 'package:foodmood/screens/auth/login/login_screen.dart';
import 'package:foodmood/screens/auth/logout/logout_screen.dart';
import 'package:foodmood/screens/auth/otp_verify/otp_verification_screen.dart';
import 'package:foodmood/screens/auth/register/screens/sign_up_screen.dart';
import 'package:foodmood/screens/auth/reset_password/reset_password_screen.dart';
import 'package:foodmood/screens/cart/screens/cart_screen.dart';
import 'package:foodmood/screens/food_brands/screens/food_brands_screen.dart';
import 'package:foodmood/screens/home/home_screen.dart';
import 'package:foodmood/screens/onboarding/screens/onboarding_complete.dart';
import 'package:foodmood/screens/onboarding/screens/onboarding_screen.dart';
import 'package:foodmood/screens/order_place_confirm/order_place_confirm.dart';
import 'package:foodmood/screens/payment/screens/payment_screen.dart';
import 'package:foodmood/screens/restaurant/screens/restaurant_screen.dart';
import 'package:foodmood/screens/today_mood_dishes/screens/today_mood_dishes.dart';

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case OnBoardingScreen.id:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const OnBoardingScreen());
      case OnBoardingCompleteScreen.id:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => const OnBoardingCompleteScreen());
      case LoginScreen.id:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const LoginScreen());
      case SignUpScreen.id:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SignUpScreen());
      case ForgetPasswordScreen.id:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const ForgetPasswordScreen());
      case OtpVerificationScreen.id:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const OtpVerificationScreen());
      case ResetPasswordScreen.id:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const ResetPasswordScreen());
      case ChangePasswordSuccessScreen.id:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => const ChangePasswordSuccessScreen());
      case ProfileScreenPage.id:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const ProfileScreenPage());
      case SettingsScreenPage.id:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SettingsScreenPage());
      case HomePageScreen.id:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const HomePageScreen());
      case PreviewScreenPage.id:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const PreviewScreenPage());
      case EditScreenPage.id:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const EditScreenPage());
      case LogoutScreenPage.id:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const LogoutScreenPage());
      case PaymentScreen.id:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const PaymentScreen());
      case CartScreen.id:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const CartScreen());
      case AddressScreen.id:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const AddressScreen());
      case RestaurantScreen.id:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const RestaurantScreen());
      case OrderPlaceConfirmScreen.id:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => const OrderPlaceConfirmScreen());
      case FoodBrandsScreen.id:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const FoodBrandsScreen());
      case TodayMoodDishes.id:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const TodayMoodDishes());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
