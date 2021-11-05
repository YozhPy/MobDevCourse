// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

const diyaWindowsColors = <String, Color>{
  'blue': Color(0xffb3c9e8),
  'purple': Color(0xffa8a9ea),
  'green': Color(0xffC0EBB5),
  'flesh': Color(0xffF8D6CD),
};

const diyaDocumentsColors = <String, Color>{
  'blue': Color(0xffB9D8EC),
  'purple': Color(0xffD6E2F2),
  'green': Color(0xffE7F4E3),
  'flesh': Color(0xffF8D6CD),
};

const diyaDocumentsBorders = <String, Color>{
  'blue': Color(0xff7FAECC),
  'purple': Color(0xffB8C8E2),
  'green': Color(0xffC0EBB5),
  'flesh': Color(0xffF8D6CD),
};

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
      documentName: "Паспорт громадянина\nУкраїни <тризуб>",
      documentText: '''Дата народження: 26.12.2000
                       Дійсний до: 09.10.2022
                       Номер: 00655464644564''',
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
        home: Scaffold(
      body: TabBarView(
        children: _tabs,
        controller: controller,
      ),
    ));
  }
}

class Diya extends StatelessWidget {
  final String colorName, documentName, documentText;

  const Diya({
    Key? key,
    required this.colorName,
    required this.documentName,
    required this.documentText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(color: diyaWindowsColors[colorName]),
          child: Padding(
              padding: EdgeInsets.only(top: 60),
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Image(
                                image: AssetImage("assets/main_logo.png"),
                                width: 50.0,
                                height: 50.0,
                              ),
                              Icon(Icons.qr_code_scanner, size: 30)
                            ])),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Document(
                              documentName: documentName,
                              imageSrc: "assets/4head_2.jpg",
                              documentText: documentText,
                              colorName: colorName,
                              borders: colorName,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: Text(
                          "Дані оновлено 01 листопада 2021 о 03:00",
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'eUkraine'),
                        ))
                  ]))),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedFontSize: 12,
          selectedFontSize: 12,
          elevation: 0.0,
          iconSize: 30,
          backgroundColor: diyaWindowsColors[colorName],
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.feed_sharp),
              label: 'Документи',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.textsms_outlined),
              label: 'Послуги',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.doorbell_outlined),
              label: 'Повідомлення',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Меню',
            ),
          ],
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
        ),
      ),
    );
  }
}

class Document extends StatelessWidget {
  final String documentName, imageSrc, documentText, colorName, borders;

  const Document(
      {Key? key,
      required this.documentName,
      required this.imageSrc,
      required this.documentText,
      required this.colorName,
      required this.borders})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 330.0,
        height: 460.0,
        decoration: BoxDecoration(
          color: diyaDocumentsColors[colorName],
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0),
              spreadRadius: 5,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 20, 20, 0),
          child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(documentName,
                    style: TextStyle(
                        fontSize: 23,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'eUkraine')),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 159.5,
                        height: 210,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2.0,
                                color: (diyaDocumentsBorders[borders])!),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(imageSrc),
                            )),
                      ),
                      SizedBox(
                        width: 125,
                        height: 210,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(documentText,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'eUkraine')),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Divider(
                    color: (diyaDocumentsBorders[borders])!,
                    thickness: 3,
                  ),
                ),
                Text("Нікішенко\nЄгор\nОлексійович",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'eUkraine'))
              ]),
        ));
  }
}
