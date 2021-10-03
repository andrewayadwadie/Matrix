import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:matrix/widgets/mazad_bar.dart';
import 'authentication/login.dart';
import 'authentication/register.dart';
import 'constat.dart/colors.dart';
import 'screens/home/home_screen.dart';

class CustomNav extends StatefulWidget {
  @override
  _CustomNavState createState() => _CustomNavState();
}

class _CustomNavState extends State<CustomNav> {
  int currentTab = 5;

  Widget currentScreen = MainHomeScreen();
  final List<Widget> screens = [
    MainHomeScreen(),
    Login(),
    Register(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(child: currentScreen, bucket: bucket),
      floatingActionButton: FloatingActionButton(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/icons/wireless-charging.png',
            color: Colors.white,
          ),
        ),
        backgroundColor: primary,
        onPressed: () {
          translator.setNewLanguage(
            context,
            newLanguage: translator.currentLanguage == 'en' ? 'ar' : 'en',
            remember: true,
            restart: true,
          );
          print(translator.currentLanguage);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        // decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
        // margin: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        child: BottomAppBar(
          color: secondary,
          shape: CircularNotchedRectangle(),
          notchMargin: 5,
          child: Container(
            // width: MediaQuery.of(context).size.width / 2,
            //decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            height: MediaQuery.of(context).size.height / 14,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen =
                              Register(); // if user taps on this dashboard tab will be active
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            "assets/icons/user2.png",
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width / 20,
                            height: MediaQuery.of(context).size.height / 45,
                            color: currentTab == 0 ? primary : Colors.white,
                          ),
                          Text(
                            '${translator.translate("nav_profile")}',
                            style: TextStyle(
                                color: currentTab == 0 ? primary : Colors.white,
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen =
                              Login(); // if user taps on this dashboard tab will be active
                          currentTab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            "assets/icons/wallet.png",
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width / 20,
                            height: MediaQuery.of(context).size.height / 45,
                            color: currentTab == 1 ? primary : Colors.white,
                          ),
                          Text(
                            '${translator.translate("nav_wallet")}',
                            style: TextStyle(
                                color: currentTab == 1 ? primary : Colors.white,
                                fontSize: 12),
                          ),
                        ],
                      ),
                    )
                  ],
                ),

                /*midle text  */

                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text(
                    "${translator.translate("nav_charge")}",
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
                // Right Tab bar icons
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen =
                              MazadBar(); // if user taps on this dashboard tab will be active
                          currentTab = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            "assets/icons/auction2.png",
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width / 20,
                            height: MediaQuery.of(context).size.height / 45,
                            color: currentTab == 2 ? primary : Colors.white,
                          ),
                          Text(
                            '${translator.translate("nav_myAuction")}',
                            style: TextStyle(
                                color: currentTab == 2 ? primary : Colors.white,
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen =
                              MainHomeScreen(); // if user taps on this dashboard tab will be active
                          currentTab = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            "assets/icons/home-icon-silhouette (1).png",
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width / 20,
                            height: MediaQuery.of(context).size.height / 45,
                            color: currentTab == 3 ? primary : Colors.white,
                          ),
                          Text(
                            '${translator.translate("nav_home")}',
                            style: TextStyle(
                                color: currentTab == 3 ? primary : Colors.white,
                                fontSize: 12),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
