import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:matrix/constat.dart/colors.dart';
import 'package:matrix/widgets/header.dart';

class Bills extends StatefulWidget {
  @override
  _BillsState createState() => _BillsState();
}

class _BillsState extends State<Bills> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              /*------------------------------ header ----------------------- */
              Header(
                  notification: false,
                  back: true,
                  icon: 'assets/icons/trophy22.png',
                  logo: true),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              Text(
                "${translator.translate("bills")}",
                style: TextStyle(
                    color: secondary,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    width: MediaQuery.of(context).size.width / 10,
                    height: MediaQuery.of(context).size.height / 200,
                    decoration: BoxDecoration(
                        color: secondary,
                        borderRadius: BorderRadius.circular(100)),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 5,
                    height: MediaQuery.of(context).size.height / 200,
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(100)),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 25,
              ),

/*------------------------------- content ------------------------ */
//===================================================================

              Container(
                height: MediaQuery.of(context).size.height / 1.7,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, value) {
                      return Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height / 5,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.check_circle_outline_sharp,
                                    color: secondary,
                                    size: 18,
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${translator.translate("bills_number")} ",
                                          style: TextStyle(
                                            color: secondary,
                                          ),
                                        ),
                                        Text(
                                          ":",
                                          style: TextStyle(
                                            color: secondary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "141565",
                                    style: TextStyle(
                                      color: primary,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.check_circle_outline_sharp,
                                    color: secondary,
                                    size: 18,
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${translator.translate("bills_price")} ",
                                          style: TextStyle(
                                            color: secondary,
                                          ),
                                        ),
                                        Text(
                                          ":",
                                          style: TextStyle(
                                            color: secondary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "1000",
                                    style: TextStyle(
                                      color: primary,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.check_circle_outline_sharp,
                                    color: secondary,
                                    size: 18,
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${translator.translate("bills_status")}  ",
                                          style: TextStyle(
                                            color: secondary,
                                          ),
                                        ),
                                        Text(
                                          ":",
                                          style: TextStyle(
                                            color: secondary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "عملية غير مكتملة ",
                                    style: TextStyle(
                                      color: primary,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.check_circle_outline_sharp,
                                    color: secondary,
                                    size: 18,
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${translator.translate("bills_date")} ",
                                          style: TextStyle(
                                            color: secondary,
                                          ),
                                        ),
                                        Text(
                                          ":",
                                          style: TextStyle(
                                            color: secondary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "8/8/2021",
                                    style: TextStyle(
                                      color: primary,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
