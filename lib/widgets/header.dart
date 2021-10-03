import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:matrix/constat.dart/colors.dart';
import 'package:matrix/screens/notification_screen.dart';
import 'package:matrix/widgets/transition_page_route.dart';

class Header extends StatefulWidget {
  final bool notification;
  final bool back;
  final String icon;
  final bool logo;

  Header(
      {@required this.notification,
      @required this.back,
      @required this.icon,
      @required this.logo});

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 9, vertical: 7),
          color: primary,
          height: MediaQuery.of(context).size.height / 10.2,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (widget.notification == true)
                IconButton(
                    icon: Image.asset(
                      'assets/icons/notification.png',
                      color: Colors.white,
                    ),
                    iconSize: 28,
                    onPressed: () {
                      Navigator.push(context,
                          TransitionPageRoute(widget: NotificationScreen()));
                    }),
              if (translator.currentLanguage == 'ar') Spacer(),
              if (widget.back == true)
                IconButton(
                    icon: Icon(
                      translator.currentLanguage == 'ar'
                          ? Icons.arrow_forward_ios
                          : Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 25,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
            ],
          ),
        ),
        if (widget.logo == true)
          Positioned(
              top: MediaQuery.of(context).size.height / 27,
              left: MediaQuery.of(context).size.width / 2.6,
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.height / 8,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: primary,
                  border: Border.all(color: Colors.white, width: 4),
                  borderRadius: BorderRadius.circular(80),
                ),
                child: Image.asset(widget.icon,
                    color: Colors.white, fit: BoxFit.contain),
              )),
      ],
    );
  }
}
