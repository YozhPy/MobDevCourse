// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'components.dart';
import 'models/request.dart';

void main() => runApp(DiyaApp());

class DiyaApp extends StatefulWidget {
  const DiyaApp({Key? key}) : super(key: key);

  @override
  DiyaAppState createState() => DiyaAppState();
}

class DiyaAppState extends State<DiyaApp> with SingleTickerProviderStateMixin {
  late TabController controller;
  int cIndex = 0;
  int cRequests = 0;

  // CREATE OUR WINDOWS
  void _addRequestTap(CertificateRequest req) {
    setState(() {
      cRequests < 10 ? cRequests += 1 : cRequests = 1;
      requestsList[cRequests] = req;
    });
  }

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
    List<Widget> _tabs = <Widget>[
      Diya(
        colorName: 'green',
        documentName: "Внутрішній\nCOVID19-сертифікат",
        documentText: '''Дата народження: 26.12.2000
                       Дійсний до: 09.10.2022
                       Номер\nсертифікату: URN:ASDJANSFOJNASFJIASFNasjdifn''',
        addRequest: _addRequestTap,
      ),
      Diya(
        colorName: 'purple',
        documentName: "Закордонний\nПаспорт <тризуб>",
        documentText: '''Дата народження: 26.12.2000
                       Дійсний до: 09.10.2022
                       Номер: F534516549''',
        addRequest: _addRequestTap,
      ),
      Diya(
        colorName: 'blue',
        documentName: "Паспорт громадянина\nУкраїни <тризуб>",
        documentText: '''Дата народження: 26.12.2000
                       Дійсний до: 01.01.2050
                       Номер:\n ZxC322ZxC''',
        addRequest: _addRequestTap,
      ),
      Diya(
        colorName: 'purple',
        documentName: "Студентський\nквиток",
        documentText: '''КВ 12225356
                       Форма навчання: Денна
                       Дійсний до: 30.06.2022
                       \nНТУУ "КПІ" ім. Ігоря Сікорського ''',
        addRequest: _addRequestTap,
      ),
    ];
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
