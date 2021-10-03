import 'dart:io';
import 'package:flutter/services.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:matrix/constat.dart/colors.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'screens/MyWallet/my_wallet_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/charge_unit_screen.dart';
import 'screens/myAuctions.dart';

BuildContext testContext;

class ProvidedStylesExample extends StatefulWidget {
  final BuildContext menuScreenContext;
  ProvidedStylesExample({this.menuScreenContext});

  @override
  _ProvidedStylesExampleState createState() => _ProvidedStylesExampleState();
}

class _ProvidedStylesExampleState extends State<ProvidedStylesExample> {
  // DateTime lastPressed ;
  PersistentTabController _controller;
  bool _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() {
    return [
      MainHomeScreen(),
      MyWalletScreen(),
      ChargeUnitScreen(),
      MyAuctions(),
      ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Image.asset(
          'assets/icons/home-icon-silhouette (1).png',
          color: Colors.white,
        ),
        title: "${translator.translate("nav_home")}",
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 9,
          color: Colors.white,
        ),
        activeColorSecondary: primary,
        activeColorPrimary: primary,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(
          'assets/icons/wallet.png',
          color: Colors.white,
        ),
        title: "${translator.translate("nav_wallet")}",
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 9,
          color: Colors.white,
        ),
        activeColorPrimary: primary,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: primary,
          ),
          width: MediaQuery.of(context).size.width / 6.4,
          height: MediaQuery.of(context).size.height / 4,
          child: Image.asset(
            'assets/icons/wireless-charging.png',
            color: Colors.white,
            width: MediaQuery.of(context).size.width / 7,
            height: MediaQuery.of(context).size.width / 8,
          ),
        ),
        title: "${translator.translate("nav_charge")}",
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 9,
          color: primary,
        ),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(
          'assets/icons/auction2.png',
          color: Colors.white,
        ),
        title: "${translator.translate("nav_myAuction")}",
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 9,
          color: Colors.white,
        ),
        activeColorPrimary: primary,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(
          'assets/icons/user2.png',
          color: Colors.white,
        ),
        title: "${translator.translate("nav_profile")}",
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 9,
          color: Colors.white,
        ),
        activeColorPrimary: primary,
        inactiveColorPrimary: Colors.white,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: secondary,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
            ? 0.0
            : MediaQuery.of(context).size.height / 12,
        hideNavigationBarWhenKeyboardShows: true,
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 30),
        popActionScreens: PopActionScreensType.all,
        bottomScreenMargin: 20,
        onWillPop: (context) async {
          await showCupertinoModalBottomSheet(
            context: context,
            builder: (context) => Container(
              height: MediaQuery.of(context).size.height / 1.7,
              color: Colors.white,
              child: FlatButton(
                color: secondary,
                child: Text(
                  "Close",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (Platform.isAndroid) {
                    SystemNavigator.pop();
                  } else {
                    exit(0);
                  }
                },
              ),
            ),
          );
          return false;
        },
        selectedTabScreenContext: (context) {
          testContext = context;
        },
        hideNavigationBar: _hideNavBar,
        popAllScreensOnTapOfSelectedTab: true,
        itemAnimationProperties: ItemAnimationProperties(
          duration: Duration(milliseconds: 400),
          curve: Curves.elasticInOut,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.easeInOutCirc,
          duration: Duration(milliseconds: 800),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        // ),
        decoration: NavBarDecoration(borderRadius: BorderRadius.circular(25)),
        navBarStyle: NavBarStyle.style15,
      ),
    );
  }
}
