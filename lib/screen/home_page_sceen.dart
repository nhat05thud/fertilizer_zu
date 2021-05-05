import 'package:fertilizer_zu/common/color_constants.dart';
import 'package:fertilizer_zu/widget/home_top_widget.dart';
import 'package:flutter/material.dart';
import 'package:fertilizer_zu/common/number_converter.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.kwhiteColor,
      body: ListView.builder(
        itemCount: 11,
        itemBuilder: (BuildContext context, int index) {
          return index == 0 ? HomeTopWidget() : _latestTransaction(index - 1);
        },
      ),
    );
  }

  _latestTransaction(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        margin: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () {},
          child: ListTile(
            leading: Container(
              height: double.infinity,
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            title: Text(
              "Person $index",
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              "Ngày giao dịch",
              style: TextStyle(color: Colors.white),
            ),
            trailing: Text(
              "${NumberConverter.formatNumberToVietNamDong(350500)} VNĐ",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
