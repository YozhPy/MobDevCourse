// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'components.dart';

void main() => runApp(DiyaApp());

class DiyaApp extends StatefulWidget {
  const DiyaApp({Key? key}) : super(key: key);

  @override
  DiyaAppState createState() => DiyaAppState();
}

class DiyaAppState extends State<DiyaApp> with SingleTickerProviderStateMixin {
  late TabController controller;
  int cIndex = 0;

  // CREATE OUR WINDOWS

  static final List<Widget> _tabs = <Widget>[
    Diya(
      colorName: 'green',
      documentName: "Внутрішній\nCOVID19-сертифікат",
      documentText: '''Дата народження: 26.12.2000
                       Дійсний до: 09.10.2022
                       Номер\nсертифікату: URN:ASDJANSFOJNASFJIASFNasjdifn''',
    ),
    Diya(
      colorName: 'purple',
      documentName: "Закордонний\nПаспорт <тризуб>",
      documentText: '''Дата народження: 26.12.2000
                       Дійсний до: 09.10.2022
                       Номер: F534516549''',
    ),
    Diya(
      colorName: 'blue',
      documentName: "Паспорт High Skill\nгромадянина України <тризуб>",
      documentText: '''Дата народження: 26.12.2000
                       Дійсний до: 01.01.2050
                       Номер: ZxC322ZxC''',
    ),
    Diya(
      colorName: 'purple',
      documentName: "Студентський\nквиток",
      documentText: '''КВ 12225356
                       Форма навчання: Денна
                       Дійсний до: 30.06.2022
                       \nНТУУ "КПІ" ім. Ігоря Сікорського ''',
    ),
  ];

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
    controller.addListener(() {
      setState(() {
        cIndex = controller.index;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  TabBarView makeTabBarView(tabs) {
    return TabBarView(children: tabs, controller: controller);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: TabBarView(
            children: _tabs,
            controller: controller,
          ),
        ));
  }
}
