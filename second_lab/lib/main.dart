// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:second_lab/pages/documents.dart';
import 'package:second_lab/pages/notifications.dart';
import 'package:second_lab/pages/services.dart';
import 'components.dart';
import 'models/request.dart';
import 'package:provider/provider.dart';
import 'models/change_theme.dart';
import 'package:second_lab/pages/menu.dart';

void main() => runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => RequestsList(),
          ),
          ChangeNotifierProvider(
            create: (context) => ThemeProvider(),
          ),
        ],
        child: MaterialApp(
          home: DiyaApp(),
        )));

class DiyaApp extends StatelessWidget {
  const DiyaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Diya(
            documentName: "Внутрішній\nCOVID19-сертифікат",
            documentText: '''Дата народження: 26.12.2000
                       Дійсний до: 09.10.2022
                       Номер\nсертифікату: URN:ASDJANSFOJNASFJIASFNasjdifn''',
          ),
        ));
  }
}

class Diya extends StatefulWidget {
  final String documentName, documentText;

  const Diya({
    Key? key,
    required this.documentName,
    required this.documentText,
  }) : super(key: key);

  @override
  State<Diya> createState() => _DiyaState();
}

//ADD PAGE VIEW
class _DiyaState extends State<Diya> {
  late ThemeProvider themeChangerProvider = Provider.of<ThemeProvider>(context);
  int _cIndex = 0;

  void _handlePages(int index) {
    setState(() {
      _cIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    int _cNotifId = 0;
    List<Widget> _widgetShow = <Widget>[
      DocumentPage(
        documentName: widget.documentName,
        documentText: widget.documentText,
        thm: themeChangerProvider,
      ),
      ServicesPage(),
      NotificationPage(
          thm: themeChangerProvider,
          getListItems: (BuildContext context, ThemeProvider thp) {
            List<Widget> curNotifications = [];
            Provider.of<RequestsList>(context, listen: false)
                .items
                .forEach((element) {
              curNotifications.add(Notiff(
                      id: _cNotifId, req: element, isDarkTheme: thp.darkTheme)
                  .build(context));
              _cNotifId += 1;
            });
            return curNotifications;
          }),
      HomePage(),
    ];

    return Scaffold(
      body: LayoutBuilder(builder: (context, constraint) {
        return SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: _widgetShow.elementAt(_cIndex)));
      }),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedFontSize: 12,
          selectedFontSize: 12,
          elevation: 0.0,
          iconSize: 30,
          backgroundColor: _cIndex == 0
              ? DiyaAppColors(themeChangerProvider.darkTheme).docColor
              : DiyaAppColors(themeChangerProvider.darkTheme).docPages,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.feed_outlined),
                label: 'Документи',
                activeIcon: Icon(Icons.feed_sharp)),
            BottomNavigationBarItem(
                icon: Icon(Icons.textsms_outlined),
                label: 'Послуги',
                activeIcon: Icon(Icons.textsms_sharp)),
            BottomNavigationBarItem(
                icon: Icon(Icons.doorbell_outlined),
                label: 'Повідомлення',
                activeIcon: Icon(Icons.doorbell_sharp)),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_outlined),
                label: 'Меню',
                activeIcon: Icon(Icons.menu_sharp)),
          ],
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          onTap: _handlePages,
          currentIndex: _cIndex,
        ),
      ),
    );
  }
}
