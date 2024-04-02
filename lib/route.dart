import 'package:get/get.dart';
import 'package:help_desk/views/home/home_screen.dart';
import 'package:help_desk/widgets/splash_screen.dart';

final appRoute = [
  GetPage(name: '/', page: () => const SplashScreen()),
  GetPage(name: '/home', page: () => const MyHomePage()),
];
