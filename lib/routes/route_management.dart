import 'package:flutter/material.dart';
import 'package:sevapremi/pages/splash_screens/splash_screen.dart';
import 'package:sevapremi/pages/static_pages/about_page.dart';
import 'package:sevapremi/pages/static_pages/contact_page.dart';
import 'package:sevapremi/pages/static_pages/faq_page.dart';
import 'package:sevapremi/pages/static_pages/tos.dart';

class RouteManagement {
  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case '/about_page':
        return MaterialPageRoute(builder: (_) => const AboutPage());

      case "/contact_us":
        return MaterialPageRoute(builder: (_) => const ContactPage());
      case "/faq_page":
        return MaterialPageRoute(builder: (_) => const FaqPage());
      case "/tos_page":
        return MaterialPageRoute(builder: (_) => const TosPage());
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
