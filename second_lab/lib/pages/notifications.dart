// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_lab/models/request.dart';
import '../components.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/cupertino.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> curNotifications = [];
    int index = 0;
    Provider.of<RequestsList>(context, listen: false).items.forEach((element) {
      curNotifications.add(Notif(id: index, req: element).build(context));
      index += 1;
    });
    return Container(
        decoration: BoxDecoration(color: diyaWindowsColors['pages']),
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
                children: curNotifications,
              )
            ]));
  }
}
