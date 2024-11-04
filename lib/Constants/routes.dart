import 'package:flutter/material.dart';
import 'package:horeca_smart/Presentation/Screens/HomePage/bottom_nav_bar.dart';
import '../Presentation/Screens/DiscountsScreen/discounts_screen.dart';
import '../Presentation/Screens/MyCartScreen/cart_screen.dart';
import '../Presentation/Screens/Registration/login.dart';
import '../Presentation/Screens/Registration/sign_up.dart';

class AppRoutes {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String menu = '/menu';
  static const String cart = '/cart';
  static const String discounts = '/discounts';
  static const String bottomNavBar = '/bottomNavBar';

  static Map<String, WidgetBuilder> get routes {
    return {
      login: (context) => const Login(),
      signup: (context) => const SignUp(),
      bottomNavBar: (context) => const BottomNavBar(),
      cart: (context) => const MyCartScreen(),
      discounts: (context) => const DiscountsScreen(),
      
    };
  }
}
