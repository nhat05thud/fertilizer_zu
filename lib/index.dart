import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'common/color_constants.dart';
import 'common/current_screen_index.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int selectedOptionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.kblackColor,
      bottomNavigationBar: _buildBottomNavigationBarPortrait(),
      body: CurrentScreenIndex(selectedOptionIndex),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text("Thêm giao dịch"),
        icon: Icon(Icons.add),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedOptionIndex = index;
    });
  }

  Widget _buildBottomNavigationBarPortrait() {
    return SizedBox(
      height: 80,
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            activeIcon: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: ColorConstants.kblackColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                CupertinoIcons.house,
                color: Colors.white,
              ),
            ),
            icon: Icon(CupertinoIcons.house),
            label: "",
            tooltip: "",
          ),
          BottomNavigationBarItem(
            activeIcon: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: ColorConstants.kblackColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(CupertinoIcons.list_dash),
            ),
            icon: Icon(CupertinoIcons.list_dash),
            label: "",
            tooltip: "",
          ),
          BottomNavigationBarItem(
            activeIcon: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: ColorConstants.kblackColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(CupertinoIcons.square_grid_2x2),
            ),
            icon: Icon(CupertinoIcons.square_grid_2x2),
            label: "",
            tooltip: "",
          ),
          BottomNavigationBarItem(
            activeIcon: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: ColorConstants.kblackColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(CupertinoIcons.person),
            ),
            icon: Icon(
              CupertinoIcons.person,
            ),
            label: "",
            tooltip: "",
          ),
        ],
        currentIndex: selectedOptionIndex,
        onTap: _onItemTapped,
        backgroundColor: ColorConstants.kwhiteColor,
        selectedItemColor: ColorConstants.kwhiteColor,
        unselectedItemColor: ColorConstants.kblackColor,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
