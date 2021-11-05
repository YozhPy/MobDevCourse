// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() => runApp(HeroApp());

class HeroApp extends StatefulWidget {
  const HeroApp({Key? key}) : super(key: key);

  @override
  _HeroAppState createState() => _HeroAppState();
}

class _HeroAppState extends State<HeroApp> with SingleTickerProviderStateMixin {
  late TabController tabController;
  int cIndex = 0;

  // ignore: prefer_final_fields
  static List<Widget> _tabs = <Widget>[
    Builder(builder: (context) {
      return Center(
        child: GestureDetector(
          child: Container(
              child: Hero(
                  tag: 'istochnik_hero',
                  child: Image.network(
                      'https://api.rodzvuk.ru/wp-content/uploads/2018/10/watersource.jpg',
                      width: 450,
                      height: 200))),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HeroExample(
                    imageSrc:
                        'https://api.rodzvuk.ru/wp-content/uploads/2018/10/watersource.jpg',
                    tag: 'istochink_hero',
                    text1: 'Группа "Источник"',
                    text2:
                        "Первоначально группа работала в стилистике инди-панка с интонациями эмо-рока, опираясь на наследие групп «Пасош» и «Буерак». После EP «Весенняя пора» в марте, 4 октября 2017 года вышел дебютный альбом «Может, правда все закончится вот так». 10 ноября группа дала первый сольный концерт в клубе «Диссидент». В феврале 2018-го появился сингл «Когда?», а в марте коллектив отправился в «ЭМО :( тур», побывав в 10 городах России.")));
          },
        ),
      );
    }),
    Builder(builder: (context) {
      return Center(
        child: GestureDetector(
          child: Container(
              child: Hero(
                  tag: 'pasosh_hero',
                  child: Image.network(
                      'https://salvemusic.com.ua/wp-content/uploads/2020/12/pasosh4-768x432.jpg',
                      width: 250,
                      height: 100))),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HeroExample(
                    imageSrc:
                        'https://salvemusic.com.ua/wp-content/uploads/2020/12/pasosh4-768x432.jpg',
                    tag: 'pasosh_hero',
                    text1: 'Группа "Пасош"',
                    text2:
                        "Рок-группу «Пасош» считали проповедником вечной молодости и нигилизма, русскими последователями пост-панка и рупором новой волны. Сами музыканты находили забавным механизм, по которому раздаются официальные ярлыки признания. Артисты полагали, что лучший промоушен – прийти и показать то, чем занимаешься, а не ждать, пока о тебе узнают.")));
          },
        ),
      );
    }),
    Builder(builder: (context) {
      return Center(
        child: GestureDetector(
          child: Container(
              child: Hero(
                  tag: 'uvula_hero',
                  child: Image.network(
                      'https://salvemusic.com.ua/wp-content/uploads/2021/02/uvula.jpg',
                      width: 100,
                      height: 50))),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HeroExample(
                    imageSrc:
                        'https://salvemusic.com.ua/wp-content/uploads/2021/02/uvula.jpg',
                    tag: 'uvula_hero',
                    text1: 'Группа "Увула"',
                    text2:
                        "Группа “Увула” начала музыкальный путь в 2015 году. Несмотря на то, что непонятному названию сопутствует чуть уловимый флёр древности и народности, означает оно анатомическую часть нёба — язычок. Да и к фолку музыка коллектива не имеет никакого отношения. Исполнители сами затрудняются с определением жанра, играя негромкие песни с динамичными ритм-секциями и вдохновляясь различными течениями от пост-панка до русского “клубняка”.")));
          },
        ),
      );
    }),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
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

  void _onItemTapped(int index) {
    setState(() {
      cIndex = index;
      tabController.animateTo(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: const Text('Russian New Wave',
            style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.tealAccent,
      ),
      drawer: Builder(
        builder: (context) => Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.tealAccent,
                ),
                child: Center(
                  child: (Text(
                    'My drawer Example',
                    style: TextStyle(fontSize: 25, color: Colors.red),
                  )),
                ),
              ),
              ListTile(
                title: const Text('Источник'),
                onTap: () {
                  cIndex = 0;
                  tabController.animateTo(cIndex);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('Пасош'),
                onTap: () {
                  cIndex = 1;
                  tabController.animateTo(cIndex);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('Увула'),
                onTap: () {
                  cIndex = 2;
                  tabController.animateTo(cIndex);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('Источник'),
                onTap: () {
                  cIndex = 0;
                  tabController.animateTo(cIndex);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('Пасош'),
                onTap: () {
                  cIndex = 1;
                  tabController.animateTo(cIndex);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('Увула'),
                onTap: () {
                  cIndex = 2;
                  tabController.animateTo(cIndex);
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ),
      ),
      body: TabBarView(
        children: _tabs,
        controller: tabController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: 'Pikachu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
        ],
        onTap: _onItemTapped,
        currentIndex: cIndex,
      ),
      floatingActionButton: Builder(
        builder: (context) {
          return FloatingActionButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            child: const Icon(Icons.navigation),
            backgroundColor: Colors.blue,
          );
        },
      ),
    ));
  }
}

class HeroExample extends StatelessWidget {
  final String tag, imageSrc, text1, text2;
  const HeroExample(
      {Key? key,
      required this.tag,
      required this.imageSrc,
      required this.text1,
      required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text1,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Hero(
                tag: tag,
                child: Image.network(
                  imageSrc,
                  width: 400,
                  height: 300,
                )),
            Text(
              text2,
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
