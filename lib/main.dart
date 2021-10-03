import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:matrix/authentication/login.dart';
import 'package:matrix/constat.dart/colors.dart';
import 'package:matrix/custom_nav_bar.dart';
import 'package:matrix/provider/main_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:matrix/sharedPrefrences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'authentication/register.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up :  ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;

  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  await translator.init(
    localeDefault: LocalizationDefaultType.device,
    languagesList: <String>['en', 'ar'],
    assetsDirectory: 'assets/langs/',
    // NOT YET TESTED
  );
  await NotificationSwitcher.init();
  await LoginPref.init();

  runApp(LocalizedApp(
    child: MyApp(),
  ));
}

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey(debugLabel: "Main Navigator");

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ChangeNotifierProvider(
      create: (_) => MainProvider(),
      child: MaterialApp(
        key: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Matrix',
        theme: ThemeData(
          fontFamily: 'Cairo',
          // primarySwatch: Colors.yellow[900],
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                primary: primary,
                onPrimary: secondary,
                shadowColor: Colors.red,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 100)),
          ),
        ),
        home: Provider(
            create: (_) => MainProvider(),
            child: LoginPref.getTokenValue() == '' ||
                    LoginPref.getTokenValue() == null
                ? Login()
                : ProvidedStylesExample()),
        localizationsDelegates: translator.delegates, // Android + iOS Delegates
        locale: translator.locale, // Active locale
        supportedLocales: translator.locals(),
      ),
    );
  }
}
