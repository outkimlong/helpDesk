import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:helpDesk_app/core/services/firebase_services.dart';
import 'package:helpDesk_app/core/services/themes_services.dart';
import 'package:helpDesk_app/core/utils/app_language.dart';
import 'package:helpDesk_app/core/utils/local_storage.dart';
import 'package:helpDesk_app/firebase_options.dart';
import 'package:helpDesk_app/route.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint("-------------Handling a background message: ${message.data}");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseServices().getInstance();
  await LocalStorage.init();
  await GetStorage.init();
  await dotenv.load(fileName: "assets/.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final storage = GetStorage();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeService().lightTheme,
      darkTheme: ThemeService().darkTheme,
      themeMode: ThemeService().getThemeMode(),
      initialRoute: '/',
      getPages: appRoute,
      translations: AppTranslations(),
      fallbackLocale: AppTranslations().fallbackLocale,
      locale: storage.read('langCode') != null
          ? Locale(storage.read('langCode'), storage.read('countryCode'))
          : const Locale('km', 'KM'),
    );
  }
}
