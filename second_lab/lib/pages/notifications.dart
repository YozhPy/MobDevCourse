// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:second_lab/models/change_theme.dart';
import '../components.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class NotificationPage extends StatelessWidget {
  late ThemeProvider thm;
  late List<Widget> Function(BuildContext context, ThemeProvider thm)
      getListItems;

  NotificationPage(
      {Key? key,
      ThemeProvider? thm,
      List<Widget> Function(BuildContext context, ThemeProvider thm)?
          getListItems})
      : super(key: key) {
    this.getListItems = getListItems!;
    this.thm = thm!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:
            BoxDecoration(color: DiyaAppColors(thm.darkTheme).windowColor),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(30, 60, 30, 0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Image(
                              image: AssetImage("assets/main_logo.png"),
                              width: 50.0,
                              height: 50.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text("Послуги",
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'eUkraine')),
                            )
                          ],
                        ),
                        const Icon(CupertinoIcons.book_solid, size: 40)
                      ])),
              SizedBox(height: 50),
              Column(
                children: getListItems(context, thm),
              )
            ]));
  }
}
