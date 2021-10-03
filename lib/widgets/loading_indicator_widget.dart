import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:matrix/constat.dart/colors.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 15,
      height: MediaQuery.of(context).size.height / 20,
      child: LoadingIndicator(
        color: secondary,
        indicatorType: Indicator.pacman,
        colors: [primary, secondary],

        //duration: Duration(milliseconds: 5000),
      ),
    );
  }
}
