// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'components.dart';
import 'models/request.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
    create: (context) => RequestsList(), child: DiyaApp()));

class DiyaApp extends StatefulWidget {
  const DiyaApp({Key? key}) : super(key: key);

  @override
  State<DiyaApp> createState() => DiyaAppState();
}

class DiyaAppState extends State<DiyaApp> with SingleTickerProviderStateMixin {
  int _cIndex = 0;

  void _handlePageTap(int index) {
    setState(() {
      _cIndex = index;
    });
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
        documentName: "Паспорт громадянина\nУкраїни <тризуб>",
        documentText: '''Дата народження: 26.12.2000
                       Дійсний до: 01.01.2050
                       Номер:\n ZxC322ZxC''',
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: _tabs.elementAt(_cIndex)),
    );
  }
}
