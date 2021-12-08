import 'package:flutter/material.dart';
import '../components.dart';
import 'package:flutter/painting.dart';

class DocumentPage extends StatelessWidget {
  final String colorName, documentName, documentText;

  const DocumentPage({
    Key? key,
    required this.colorName,
    required this.documentName,
    required this.documentText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: diyaWindowsColors[colorName]),
        child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
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
                    child: Document(
                      documentName: documentName,
                      imageSrc: "assets/4head_2.jpg",
                      documentText: documentText,
                      colorName: colorName,
                      borders: colorName,
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text(
                        "Дані оновлено 01 листопада 2021 о 03:00",
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'eUkraine'),
                      ))
                ])));
  }
}
