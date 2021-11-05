import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return getDrawerWidget();
  }

  Widget getDrawerWidget() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.black87),
            padding: EdgeInsets.all(65),
            child: Text(
              "Some menu",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Text('Choose 1', style: TextStyle(fontSize: 25)),
              SizedBox(
                height: 15,
              ),
              Text('Choose 2', style: TextStyle(fontSize: 25)),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
