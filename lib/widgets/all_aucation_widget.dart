import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:matrix/constat.dart/colors.dart';
import 'package:matrix/screens/mazad_detail.dart';
import 'package:matrix/services/service.dart';
import 'package:matrix/widgets/loading_indicator_widget.dart';

class AllAucationWidget extends StatefulWidget {
  final Future<dynamic> serviceFunction;

  const AllAucationWidget({@required this.serviceFunction});
  @override
  _AllAucationWidgetState createState() => _AllAucationWidgetState();
}

class _AllAucationWidgetState extends State<AllAucationWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.serviceFunction,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return LoadingIndicatorWidget();
        }

        List all = snapshot.data;

        return all.length != 0
            ? ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: all.length,
                itemBuilder: (ctx, index) {
                  formatH(Duration h) => h
                      .toString()
                      .substring(0, 3)
                      .replaceAll(new RegExp(r'[^\w\s]+'), '');
                  formatM(Duration m) => m
                      .toString()
                      .substring(2, 4)
                      .replaceAll(new RegExp(r'[^\w\s]+'), '');
                  formatS(Duration s) => s
                      .toString()
                      .substring(4, 6)
                      .replaceAll(new RegExp(r'[^\w\s]+'), '');
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    width: MediaQuery.of(context).size.width / 2.3,
                    height: MediaQuery.of(context).size.height / 8,
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      border: Border(
                        top: BorderSide(width: 1, color: Colors.grey),
                        bottom: BorderSide(width: 1, color: Colors.grey),
                        right: translator.currentLanguage == "ar"
                            ? BorderSide(width: 10, color: primary)
                            : BorderSide(width: 1, color: Colors.grey),
                        left: translator.currentLanguage == "en"
                            ? BorderSide(width: 10, color: primary)
                            : BorderSide(width: 1, color: Colors.grey),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CachedNetworkImage(
                          imageUrl: all[index].img_path,
                          imageBuilder: (context, imageProvider) => Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width / 6.5,
                            height: MediaQuery.of(context).size.height / 13,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.fill)),
                          ),
                          placeholder: (context, url) =>
                              LoadingIndicatorWidget(),
                          errorWidget: (context, url, error) => Icon(
                            Icons.error,
                            size: 35,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.check_circle_outline_outlined,
                                  size: 10,
                                ),
                                AutoSizeText(
                                  translator.currentLanguage == 'ar'
                                      ? all[index].name_ar
                                      : all[index].name_en,
                                  maxLines: 1,
                                  minFontSize: 5,
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.check_circle_outline_outlined,
                                  size: 10,
                                ),
                                Text(
                                  " ${translator.translate("auction_open_price")}",
                                  style: TextStyle(fontSize: 10),
                                ),
                                AutoSizeText(
                                  "${all[index].opening_price} ${translator.translate("price")}",
                                  maxLines: 1,
                                  minFontSize: 5,
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            ),
                            Container(
                              margin: translator.currentLanguage == 'en'
                                  ? EdgeInsets.only(left: 30)
                                  : EdgeInsets.only(right: 30),
                              child: Text(
                                "${translator.translate("home_auction_time")}",
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                            Container(
                              margin: translator.currentLanguage == 'en'
                                  ? EdgeInsets.only(left: 20)
                                  : EdgeInsets.only(right: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: primary,
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    width:
                                        MediaQuery.of(context).size.width / 20,
                                    height:
                                        MediaQuery.of(context).size.height / 40,
                                    alignment: Alignment.center,
                                    child: AutoSizeText(
                                      "${formatS(DateTime.parse(all[index].end_date).difference(DateTime.now()))}",
                                      maxLines: 1,
                                      minFontSize: 5,
                                      style: TextStyle(fontSize: 10),
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
                                    width:
                                        MediaQuery.of(context).size.width / 20,
                                    height:
                                        MediaQuery.of(context).size.height / 40,
                                    alignment: Alignment.center,
                                    child: AutoSizeText(
                                      "${formatM(DateTime.parse(all[index].end_date).difference(DateTime.now()))}",
                                      maxLines: 1,
                                      minFontSize: 5,
                                      style: TextStyle(fontSize: 10),
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
                                    width:
                                        MediaQuery.of(context).size.width / 20,
                                    height:
                                        MediaQuery.of(context).size.height / 40,
                                    alignment: Alignment.center,
                                    child: AutoSizeText(
                                      "${formatH(DateTime.parse(all[index].end_date).difference(DateTime.now()))}",
                                      maxLines: 1,
                                      minFontSize: 5,
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                            onTap: () => Navigator.push(context,
                                    MaterialPageRoute(builder: (_) {
                                  return MazaDetailScreen(
                                    id: all[index].id,
                                  );
                                })),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 4,
                              height: MediaQuery.of(context).size.height / 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: primary),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "${translator.translate("see_Auction")}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    color: Colors.white,
                                    width:
                                        MediaQuery.of(context).size.width / 25,
                                    height:
                                        MediaQuery.of(context).size.height / 50,
                                    child: Image.asset(
                                      "assets/icons/auction n ewww.png",
                                      width: MediaQuery.of(context).size.width /
                                          50,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              35,
                                    ),
                                  )
                                ],
                              ),
                            ))
                      ],
                    ),
                  );
                },
              )
            : Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / 1.3,
                height: MediaQuery.of(context).size.height / 3.5,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/notFount.png",
                      ),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(10)),
              );
      },
    );
  }
}
