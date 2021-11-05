import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget with PreferredSizeWidget {
  final void Function() changeFloatingButton;
  AppBarWidget(this.changeFloatingButton);

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return getAppBarWidget();
  }

  Widget getAppBarWidget() {
    return AppBar(
        title: Text(
          'Instagram',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              widget.changeFloatingButton();
            },
            child: Container(
                child: Text(
              'Click!',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {},
          ),
        ]);
  }
}
