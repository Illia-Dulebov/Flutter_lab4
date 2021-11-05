import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:instagram_app/models/count_model.dart';
import 'package:provider/provider.dart';

class NavyBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CountModel>(
        builder: (context, count, child) => BottomNavyBar(
              selectedIndex: count.currentIndex,
              onItemSelected: (index) {
                Provider.of<CountModel>(context, listen: false)
                    .changeNum(index);
              },
              items: <BottomNavyBarItem>[
                BottomNavyBarItem(
                    icon: Icon(
                      Icons.home,
                      color: Colors.black,
                    ),
                    title: Text(
                      "Home",
                      style: TextStyle(color: Colors.black),
                    )),
                BottomNavyBarItem(
                    icon: Icon(Icons.search, color: Colors.black),
                    title: Text(
                      "Search",
                      style: TextStyle(color: Colors.black),
                    )),
                BottomNavyBarItem(
                    icon: Icon(Icons.add_outlined, color: Colors.black),
                    title: Text(
                      "Add",
                      style: TextStyle(color: Colors.black),
                    )),
                BottomNavyBarItem(
                    icon: Icon(Icons.favorite_border, color: Colors.black),
                    title: Text(
                      "Likes",
                      style: TextStyle(color: Colors.black),
                    )),
                BottomNavyBarItem(
                    icon: Icon(Icons.person, color: Colors.black),
                    title: Text(
                      "Profile",
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            ));
  }
}
