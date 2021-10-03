import 'dart:async';

import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:matrix/constat.dart/colors.dart';
import 'package:matrix/screens/mazad_detail.dart';

class MazadWidget extends StatefulWidget {
  final String imagePath;
  final DateTime mazadEndDate;
  final DateTime mazadStartDate;
  final String title;
  final String price;
  final int aucationId;

  const MazadWidget(
      {@required this.imagePath,
      @required this.mazadEndDate,
      @required this.title,
      @required this.price,
      @required this.mazadStartDate,
      @required this.aucationId});

  @override
  _MazadWidgetState createState() => _MazadWidgetState();
}

class _MazadWidgetState extends State<MazadWidget> {
  int second = 0;
  int minute = 0;
  int hour = 0;
  bool isFirst = true;

  /*
   second:
                                    "${Timer.periodic(oneSec, (Timer t) => formatS(DateTime.parse(daily[index].end_date).difference(DateTime.now())))..toString()}",
                               */
  @override
  void initState() {
    if (isFirst) {
      minute = widget.mazadEndDate.difference(DateTime.now()).inMinutes;
      second = 59;
      setState(() {
        isFirst = false;
      });
    }
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!isFirst) {
      if (second > 1) {
        Timer.periodic(Duration(seconds: 1), (timer) {
          if (second > 0) {
            setState(() {
              second -= 1;
            });
          }
          if (minute > 0 && second == 0) {
            setState(() {
              second = 59;
              minute -= 1;
            });
            if (minute <= 0) {
              timer.cancel();
            }
          }
        });
      }
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      // width: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: secondary, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Image.network(
            widget.imagePath,
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 5.7,
          ),
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height / 12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "${translator.translate("home_auction_price")}",
                      style: TextStyle(
                          color: secondary,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${widget.price} ${translator.translate("price")} ",
                      style: TextStyle(
                          color: primary, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "${translator.translate("home_auction_time")}",
                      style: TextStyle(
                          color: secondary,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          width: MediaQuery.of(context).size.width / 20,
                          height: MediaQuery.of(context).size.height / 40,
                          alignment: Alignment.center,
                          child: Text(
                            second.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                              color: primary,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          width: MediaQuery.of(context).size.width / 20,
                          height: MediaQuery.of(context).size.height / 40,
                          alignment: Alignment.center,
                          child: Text(
                            minute.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                              color: primary,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          width: MediaQuery.of(context).size.width / 20,
                          height: MediaQuery.of(context).size.height / 40,
                          alignment: Alignment.center,
                          child: Text(
                            hour.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 15,
              ),
              Text(
                widget.title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return MazaDetailScreen(id: widget.aucationId);
                  }));
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: primary),
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: MediaQuery.of(context).size.height / 18,
                  child: Text(
                    "${translator.translate("see_Auction")}",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
/*
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:matrix/constat.dart/colors.dart';
import 'package:matrix/screens/mazad_detail.dart';

class MazadWidget extends StatefulWidget {
  final String imagePath;
  final DateTime mazadEndDate;
  final DateTime mazadStartDate;
  final String title;
  final String price;

  const MazadWidget(
      {@required this.imagePath,
      @required this.mazadEndDate,
      @required this.title,
      @required this.price,
      @required this.mazadStartDate});

  @override
  _MazadWidgetState createState() => _MazadWidgetState();
}

class _MazadWidgetState extends State<MazadWidget> {
  int second = 0;
  int minute = 0;
  int hour = 0;
  bool isFirst = true;
  formatH(Duration h) {
    List hMS = [];
    hMS.add(
        h.toString().substring(0, 2).replaceAll(new RegExp(r'[^\w\s]+'), ''));

    hMS.add(
        h.toString().substring(2, 4).replaceAll(new RegExp(r'[^\w\s]+'), ''));
    hMS.add(
        h.toString().substring(4, 7).replaceAll(new RegExp(r'[^\w\s]+'), ''));
    print("daaaate : ${widget.mazadEndDate.difference(DateTime.now())}");
    return hMS;
  }

  Duration oneSec = Duration(seconds: 1);
  Duration onMin = Duration(minutes: 1);
  Duration onHour = Duration(hours: 1);
  /*
   second:
                                    "${Timer.periodic(oneSec, (Timer t) => formatS(DateTime.parse(daily[index].end_date).difference(DateTime.now())))..toString()}",
                               */
  @override
  void initState() {
    if (isFirst) {
      print("date from api ${widget.mazadEndDate}");
      print("date now ${DateTime.now()}");
      print("dif ${widget.mazadEndDate.difference(DateTime.now()).inSeconds}");
      var formatHres = formatH(widget.mazadEndDate.difference(DateTime.now()));
      print("formatHres : ${formatHres}");
      hour = int.parse(formatHres[0]);
      minute = int.parse(formatHres[1]);
      second = int.parse(formatHres[2]);
      setState(() {
        isFirst = false;
      });
    }
    print("now ${DateTime.now()}");
    if (second > 1) {
      Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          second -= 1;
        });
        if (second <= 0) {
          timer.cancel();
        }
      });
    }
    if (minute > 1) {
      Timer.periodic(Duration(minutes: 1), (timer) {
        setState(() {
          minute -= 1;
        });
        if (minute <= 0) {
          timer.cancel();
        }
      });
    }
    if (hour > 1) {
      Timer.periodic(Duration(hours: 1), (timer) {
        setState(() {
          hour -= 1;
        });
        if (hour <= 0) {
          timer.cancel();
        }
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      // width: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: secondary, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Image.network(
            widget.imagePath,
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 5.7,
          ),
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height / 12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "${translator.translate("home_auction_price")}",
                      style: TextStyle(
                          color: secondary,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${widget.price} ${translator.translate("price")} ",
                      style: TextStyle(
                          color: primary, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "${translator.translate("home_auction_time")}",
                      style: TextStyle(
                          color: secondary,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          width: MediaQuery.of(context).size.width / 20,
                          height: MediaQuery.of(context).size.height / 40,
                          alignment: Alignment.center,
                          child: Text(
                            second.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                              color: primary,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          width: MediaQuery.of(context).size.width / 20,
                          height: MediaQuery.of(context).size.height / 40,
                          alignment: Alignment.center,
                          child: Text(
                            minute.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                              color: primary,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          width: MediaQuery.of(context).size.width / 20,
                          height: MediaQuery.of(context).size.height / 40,
                          alignment: Alignment.center,
                          child: Text(
                            hour.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 15,
              ),
              Text(
                widget.title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return MazaDetailScreen();
                  }));
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: primary),
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: MediaQuery.of(context).size.height / 18,
                  child: Text(
                    "${translator.translate("see_Auction")}",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
*/