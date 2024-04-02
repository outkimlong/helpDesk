import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_desk/core/utils/app_fonts.dart';
import 'package:help_desk/views/home/home_screen.dart';
import 'package:help_desk/views/more/more.dart';

class BottomNavigationBarController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedIndex = 0;
  List listTitle = [
    'Home Screen',
    'Business',
    'More',
  ];
  List screenWidget = [
    const MyHomePage(),
    Text(
      'Index 1: Business',
      style: appbarTextSyle(),
    ),
    const MoreScreen(),
  ];
}
