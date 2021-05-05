import 'package:fertilizer_zu/common/color_constants.dart';
import 'package:fertilizer_zu/common/number_converter.dart';
import 'package:fertilizer_zu/widget/pie_chart.dart';
import 'package:flutter/material.dart';

class HomeTopWidget extends StatefulWidget {
  @override
  _HomeTopWidgetState createState() => _HomeTopWidgetState();
}

class _HomeTopWidgetState extends State<HomeTopWidget>
    with TickerProviderStateMixin {
  late TabController _controller;
  Color color = ColorConstants.gblackColor;
  Color fcolor = ColorConstants.kgreyColor;
  bool isActive = false;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.transparent;
    }
    return Colors.transparent;
  }

  @override
  void initState() {
    super.initState();

    _controller = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 15,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.short_text,
                color: ColorConstants.kblackColor,
              ),
              Icon(
                Icons.more_vert,
                color: ColorConstants.kblackColor,
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Thống kê năm ${DateTime.now().year}",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: ColorConstants.kblackColor,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 120,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(50),
              ),
              child: TabBar(
                overlayColor: MaterialStateProperty.resolveWith(getColor),
                unselectedLabelColor: Colors.black,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.black,
                ),
                controller: _controller,
                tabs: [
                  Tab(
                    child: Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Theo tuần"),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Theo tháng"),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Theo năm"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 450,
            padding: EdgeInsets.symmetric(vertical: 15),
            child: TabBarView(
              controller: _controller,
              children: [
                PieChartWidget(
                  dataMap: {
                    "Đã thu ${NumberConverter.formatNumberToVietNamDong(9000000)} VNĐ":
                        90,
                    "Chưa thu ${NumberConverter.formatNumberToVietNamDong(1000000)} VNĐ":
                        10,
                  },
                  price: 10000000,
                ),
                PieChartWidget(
                  dataMap: {
                    "Đã thu ... VNĐ": 22,
                    "Chưa thu ... VNĐ": 78,
                  },
                  price: 450000000,
                ),
                PieChartWidget(
                  dataMap: {
                    "Đã thu ... VNĐ": 70,
                    "Chưa thu ... VNĐ": 30,
                  },
                  price: 986000000,
                )
              ],
            ),
          ),
          Text(
            "Giao dịch gần đây",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: ColorConstants.kblackColor,
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
