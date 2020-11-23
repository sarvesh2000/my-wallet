import 'package:flutter/material.dart';

import 'cardwidget.dart';
import 'components/appbar.dart';
import 'config/colors.dart';
import 'config/size.dart';
import 'expenseswidget.dart';
import 'addcard.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.getHeight(context);
    var width = SizeConfig.getWidth(context);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.primaryWhite,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          // Respond to item press.
          print("Selected:");
          print(value);
          if (value == 2) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddCard()));
          }
        },
        items: [
          BottomNavigationBarItem(
            title: Text('Dashboard'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('Add Transaction'),
            icon: Icon(Icons.plus_one),
          ),
          BottomNavigationBarItem(
            title: Text('Add Account / Card'),
            icon: Icon(Icons.credit_card),
          )
        ],
      ),
      body: Container(
        color: AppColors.primaryWhite,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                height: height / 8,
                child: CustomAppBar(),
              ),
              Expanded(
                child: CardWidget(),
              ),
              Expanded(child: ExpensesWidget())
            ],
          ),
        ),
      ),
    );
  }
}
