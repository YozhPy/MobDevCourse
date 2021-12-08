// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../components.dart';
import 'package:flutter/painting.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: diyaDocumentsColors['pages']),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              decoration: BoxDecoration(color: diyaWindowsColors['pages']),
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Image(
                    image: AssetImage("assets/main_logo.png"),
                    width: 50.0,
                    height: 50.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text("Повідомлення",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'eUkraine')),
                  ),
                  Icon(Icons.tapas, size: 30)
                ],
              ),
            ),
          ]),

          SizedBox(height: 40),
          Container(
              width: 400.0,
              height: 80.0,
              decoration: BoxDecoration(
                color: diyaDocumentsColors['pages'],
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  Text("Повідомлення",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'eUkraine')),
                  SizedBox(
                    width: 20,
                  ),
                  Text("Повідомлення",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'eUkraine')),
                  SizedBox(
                    width: 20,
                  ),
                  Text("Повідомлення",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'eUkraine'))
                ],
              )) //)
        ]));
  }
}
