import 'package:get/get.dart';
import 'package:helpDesk_app/views/home/home_screen.dart';
import 'package:helpDesk_app/widgets/splash_screen.dart';

final appRoute = [
  GetPage(name: '/', page: () => const SplashScreen()),
  GetPage(name: '/home', page: () => const MyHomePage()),
];
