import 'dart:math';

import 'package:flutter/material.dart';
import 'package:instagram_app/app_bar.dart';
import 'package:instagram_app/drawer_widget.dart';
import 'package:instagram_app/models/count_model.dart';
import 'package:instagram_app/custom_bottom_navy_bar.dart';
import 'package:instagram_app/models/color_model.dart';
import 'package:instagram_app/some_page.dart';
import 'package:provider/provider.dart';

import 'future_widget.dart';
import 'models/theme_model.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => StateColor(Color.fromRGBO(100, 120, 150, 0.5)),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ThemeNotifier(),
        child: Consumer<ThemeNotifier>(
            builder: (context, ThemeNotifier notifier, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: notifier.darkMode ? darkMode : lightMode,
            initialRoute: '/',
            routes: {
              '/': (context) => MyHomePage(),
              '/sec': (context) => SecondScreen(),
            },
          );
        }));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int currentIndex = 0;

  Random random = new Random();
  late AnimationController controller;

  late List<Animation> listSize = [];
  late List<Animation> listColors = [];

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    for (int i = 0; i < 6; i++) {
      listSize.add(Tween<double>(
              begin: i * random.nextInt(30).toDouble(),
              end: i * random.nextInt(150).toDouble())
          .animate(controller));
      listColors.add(ColorTween(
              begin: Color.fromRGBO(random.nextInt(150), random.nextInt(150),
                  random.nextInt(150), 1),
              end: Color.fromRGBO(random.nextInt(150), random.nextInt(150),
                  random.nextInt(150), 1))
          .animate(controller)
            ..addStatusListener((status) {}));
    }

    controller
      ..addListener(() {
        setState(() {});
      });

    controller.forward();

    controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void changeFloatingButton() {
    setState(() {
      currentIndex += 1;
      if (currentIndex == 5) {
        currentIndex = 0;
      }
    });
  }

  Widget getFloatingButton() {
    List<Widget> buttons = [
      FloatingActionButton(
        child: Icon(Icons.navigation),
        backgroundColor: Colors.red,
        onPressed: () {},
      ),
      FloatingActionButton(
        child: Icon(Icons.navigation),
        backgroundColor: Colors.blue,
        onPressed: () {},
      ),
      FloatingActionButton(
        child: Icon(Icons.navigation),
        backgroundColor: Colors.indigo,
        onPressed: () {},
      ),
      FloatingActionButton(
        child: Icon(Icons.navigation),
        backgroundColor: Colors.amber,
        onPressed: () {},
      ),
      FloatingActionButton(
        child: Icon(Icons.navigation),
        backgroundColor: Colors.green,
        onPressed: () {},
      ),
    ];

    return IndexedStack(
      index: currentIndex,
      children: buttons,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(changeFloatingButton),
        floatingActionButton: getFloatingButton(),
        drawer: DrawerWidget(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      8,
                      (index) => Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              )
                            ]),
                            padding: EdgeInsets.all(13),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 32,
                                  backgroundImage:
                                      AssetImage("images/story.jfif"),
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        AssetImage("images/illia.png"),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Consumer<StateColor>(
                                    builder: (context, stateColor, child) =>
                                        Text(
                                          '${"Illia Duliebov"}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: stateColor.color),
                                        )),
                              ],
                            ),
                          )),
                ),
              ),
              Divider(),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15, bottom: 30),
                child: Consumer<ThemeNotifier>(
                  builder: (context, notifier, child) => SwitchListTile(
                    title: Text("Dark Mode"),
                    onChanged: (val) {
                      notifier.toggleChangeTheme();
                    },
                    value: notifier.darkMode,
                  ),
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      6,
                      (index) => Container(
                            width: 50,
                            height: listSize[index].value,
                            color: listColors[index].value,
                          ))),
              Column(
                children: List.generate(
                    8,
                    (index) => Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(12),
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        AssetImage("images/illia.png"),
                                  ),
                                ),
                                Expanded(
                                    child: Container(
                                  child: Text("Illia Duliebov",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                )),
                                IconButton(
                                  icon: Icon(Icons.more_horiz),
                                  onPressed: () {},
                                  alignment: Alignment.centerRight,
                                ),
                              ],
                            ),
                            Container(
                                alignment: Alignment.bottomCenter,
                                child: GestureDetector(
                                    onTap: () async {
                                      var res = await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                FutureWidgetPost(15)),
                                      );
                                      print(res);
                                    },
                                    child: Container(
                                      child: Image.asset("images/illia.png"),
                                    ))),
                            //Image.asset('images/illia.png'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.favorite_border),
                                  onPressed: () {
                                    Provider.of<StateColor>(context,
                                            listen: false)
                                        .changeRandomColor();
                                  },
                                  alignment: Alignment.centerRight,
                                ),
                                IconButton(
                                  icon: Icon(Icons.chat_bubble),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/sec',
                                        arguments: 25);
                                  },
                                  alignment: Alignment.centerRight,
                                ),
                                IconButton(
                                  icon: Icon(Icons.send),
                                  onPressed: () {},
                                  alignment: Alignment.centerRight,
                                ),
                                Spacer(),
                                IconButton(
                                  icon: Icon(Icons.flag_outlined),
                                  onPressed: () {},
                                  alignment: Alignment.centerRight,
                                ),
                              ],
                            ),
                            Padding(padding: EdgeInsets.all(5))
                          ],
                        )),
              ),
            ],
          ),
        ),
        bottomNavigationBar: ChangeNotifierProvider(
            create: (_) => CountModel(0), child: NavyBar()));
  }
}
