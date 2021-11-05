import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late TabController tabController;
  int cIndex = 0;
  static const TextStyle optionStyle = TextStyle(color: Colors.red);

  static List<Widget> _tabs = <Widget>[
    Scaffold(
      appBar: AppBar(title: const Text("FIRST PAGE")),
      body: Text("First page", style: TextStyle(color: Colors.red)),
    ),
    Scaffold(
      appBar: AppBar(title: const Text("Second PAGE")),
      body: Text("Second page", style: TextStyle(color: Colors.red)),
    ),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {
        cIndex = tabController.index;
      });
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  TabBarView makeTabBarView(tabs) {
    return TabBarView(children: tabs, controller: tabController);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: TabBarView(
        children: _tabs,
        controller: tabController,
      ),
    ));
  }
}
