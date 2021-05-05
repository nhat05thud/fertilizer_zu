import 'dart:ui';

import 'package:fertilizer_zu/common/color_constants.dart';
import 'package:fertilizer_zu/common/number_converter.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

enum LegendShape { Circle, Rectangle }

class PieChartWidget extends StatefulWidget {
  PieChartWidget({Key? key, required this.dataMap, required this.price})
      : super(key: key);

  final Map<String, double> dataMap;
  final double price;
  @override
  _PieChartWidgetState createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  List<Color> colorList = [
    Colors.red,
    Colors.green,
  ];

  int key = 0;

  @override
  Widget build(BuildContext context) {
    final chart = PieChart(
      key: ValueKey(key),
      dataMap: widget.dataMap,
      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: 15,
      chartRadius: MediaQuery.of(context).size.width / 2,
      colorList: colorList,
      initialAngleInDegree: 0,
      chartType: ChartType.disc,
      legendOptions: LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.bottom,
        showLegends: true,
        legendShape: BoxShape.rectangle,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: true,
        showChartValues: true,
        showChartValuesInPercentage: true,
        showChartValuesOutside: false,
      ),
      emptyColor: Colors.grey,
    );

    return Column(
      children: [
        Text(
          "Tổng số tiền đã giao dịch",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: ColorConstants.kblackColor,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "${NumberConverter.formatNumberToVietNamDong(widget.price)} VNĐ",
          style: TextStyle(
            fontSize: 30,
            color: ColorConstants.kblackColor,
          ),
        ),
        chart
      ],
    );
  }
}
