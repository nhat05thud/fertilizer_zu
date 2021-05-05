import 'package:fertilizer_zu/screen/customer_page_screen.dart';
import 'package:fertilizer_zu/screen/home_page_sceen.dart';
import 'package:fertilizer_zu/screen/transaction_page_screen.dart';
import 'package:fertilizer_zu/screen/warehouse_page_screen.dart';
import 'package:flutter/material.dart';

class CurrentScreenIndex extends StatelessWidget {
  final int index;

  CurrentScreenIndex(
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        {
          return HomePageScreen();
        }
      case 1:
        {
          return TransactionPageScreen();
        }
      case 2:
        {
          return WarehousePageScreen();
        }
      case 3:
        {
          return CustomerPageScreen();
        }
      default:
        {
          return HomePageScreen();
        }
    }
  }
}
