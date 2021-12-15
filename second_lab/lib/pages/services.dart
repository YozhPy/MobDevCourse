// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components.dart';
import 'package:flutter/painting.dart';
import 'package:second_lab/models/request.dart';

class ServicesPage extends StatelessWidget {
  final ValueChanged<CertificateRequest> addRequest;
  ServicesPage({
    required this.addRequest,
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
                              children: [
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
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 120),
                                  child: IconButton(
                                    icon: Icon(
                                      CupertinoIcons.delete_solid,
                                      size: 40,
                                    ),
                                    onPressed: () {
                                      showKillDialog(context);
                                    },
                                  ),
                                )
                              ],
                            ),
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

  showAlertDialog(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: diyaWindowsColors['pages'],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      titleTextStyle: TextStyle(
          fontSize: 22,
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontFamily: 'eUkraine'),
      titlePadding: EdgeInsets.fromLTRB(24, 24, 12, 24),
      title: Text("Підтвердження заявки"),
      contentTextStyle: TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontFamily: 'eUkraine'),
      content: Text("Заявку на який сертифікат ви хочете отримати?"),
      actions: [
        ElevatedButton(
            child: Text(
              "Зелений",
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              addRequest(CertificateRequest(DateTime.now(), "Зелений"));
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
                primary: diyaDocumentsColors['pages'],
                textStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'eUkraine'))),
        ElevatedButton(
            child: const Text("Жовтий(1 доза)",
                style: TextStyle(color: Colors.black)),
            onPressed: () {
              addRequest(CertificateRequest(DateTime.now(), "Жовтий"));
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
                primary: diyaDocumentsColors['pages'],
                textStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'eUkraine'))),
        ElevatedButton(
            child: const Text("Назад", style: TextStyle(color: Colors.black)),
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
                primary: diyaDocumentsColors['pages'],
                textStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'eUkraine'))),
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showKillDialog(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: diyaWindowsColors['pages'],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      titleTextStyle: TextStyle(
          fontSize: 22,
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontFamily: 'eUkraine'),
      titlePadding: EdgeInsets.fromLTRB(24, 24, 12, 24),
      title: Text("Видалення всіх заявок"),
      contentTextStyle: TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontFamily: 'eUkraine'),
      content: Text("Ви справді хочете видалити всі заявки?"),
      actions: [
        ElevatedButton(
            child: Text(
              "Так",
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              requestsList.clear();
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
                primary: diyaDocumentsColors['pages'],
                textStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'eUkraine'))),
        ElevatedButton(
            child: const Text("Ні", style: TextStyle(color: Colors.black)),
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
                primary: diyaDocumentsColors['pages'],
                textStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'eUkraine'))),
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
