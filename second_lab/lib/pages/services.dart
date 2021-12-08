// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, must_be_immutable

import 'package:flutter/material.dart';
import '../components.dart';
import 'package:flutter/painting.dart';
//import 'package:intl/intl.dart';
//import 'package:flutter_emoji/flutter_emoji.dart';

class ServicesPage extends StatelessWidget {
  late int _cnt = 0;
  ServicesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: diyaWindowsColors['pages']),
        child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
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
                            const Icon(Icons.qr_code_scanner, size: 30)
                          ])),
                  SizedBox(height: 40),
                  Flexible(
                    child: Container(
                        decoration:
                            BoxDecoration(color: diyaDocumentsColors['pages']),
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Категорії",
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'eUkraine')),
                                  const SizedBox(height: 40),
                                  Divider(
                                    color: diyaWindowsColors['pages'],
                                    thickness: 3,
                                  ),
                                  const SizedBox(height: 10),
                                  for (int i = 0; i < 6; i++)
                                    GestureDetector(
                                      onTap: () {
                                        showAlertDialog(context);
                                        _cnt = _cnt + 1;
                                      },
                                      child: Column(children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: const [
                                            Text("😷",
                                                style: TextStyle(
                                                    fontFamily: 'NotoEmoji',
                                                    fontSize: 28)),
                                            Text(
                                                "Заявка на отримання\nCOVID-сертифікату",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'eUkraine')),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        if (i != 5)
                                          Divider(
                                            color: diyaWindowsColors['pages'],
                                            thickness: 3,
                                          ),
                                      ]),
                                    )
                                ]))),
                  )
                ])));
  }
}
