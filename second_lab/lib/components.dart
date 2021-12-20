// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'models/request.dart';

const diyaWindowsColors = <String, Color>{
  'purple': Color(0xffa8a9ea),
  'green': Color(0xffC0EBB5),
  'pages': Color(0xffC6D9E8)
};

const diyaDocumentsColors = <String, Color>{
  'purple': Color(0xffD6E2F2),
  'green': Color(0xffE7F4E3),
  'pages': Color(0xffE1EBF4),
};

const diyaDocumentsBorders = <String, Color>{
  'purple': Color(0xffB8C8E2),
  'green': Color(0xffC0EBB5),
};

//Map<int, CertificateRequest> requestsList = {};

class DiyaAppColors {
  late Color windowColor;
  late Color docColor;
  late Color borderColor;
  late Color windowPages = Color(0xffC6D9E8);
  late Color docPages = Color(0xffE1EBF4);

  DiyaAppColors([bool isPur = false]) {
    windowColor =
        (isPur ? diyaWindowsColors['purple'] : diyaWindowsColors['green'])!;
    docColor =
        (isPur ? diyaDocumentsColors['purple'] : diyaDocumentsColors['green'])!;
    borderColor = Colors.black;
  }
}

class Document extends StatefulWidget {
  final String documentName, imageSrc, documentText;
  final bool isCustomTheme;

  const Document({
    Key? key,
    required this.documentName,
    required this.imageSrc,
    required this.documentText,
    required this.isCustomTheme,
  }) : super(key: key);

  @override
  State<Document> createState() {
    return _DocumentState();
  }
}

class _DocumentState extends State<Document> {
  late bool _showQr;

  @override
  void initState() {
    _showQr = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 330.0,
        height: 460.0,
        decoration: BoxDecoration(
          color: DiyaAppColors(widget.isCustomTheme).docColor,
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
        child: _showQr
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Image.asset("assets/qr_code.png",
                          width: 300, height: 340),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: IconButton(
                        icon: const Icon(
                          Icons.pending_outlined,
                          size: 40,
                        ),
                        onPressed: () {
                          setState(() {
                            _showQr = !_showQr;
                          });
                        },
                      ),
                    )
                  ])
            : Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 20, 0),
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.documentName,
                          style: const TextStyle(
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
                                      color:
                                          (DiyaAppColors(widget.isCustomTheme)
                                              .borderColor)),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(widget.imageSrc),
                                  )),
                            ),
                            SizedBox(
                              width: 125,
                              height: 210,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(widget.documentText,
                                      style: const TextStyle(
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
                          color:
                              (DiyaAppColors(widget.isCustomTheme).borderColor),
                          thickness: 3,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Нікішенко\nЄгор\nОлексійович",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'eUkraine')),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 40, 0, 0),
                            child: IconButton(
                              icon: const Icon(
                                Icons.pending_outlined,
                                size: 40,
                              ),
                              onPressed: () {
                                setState(() {
                                  _showQr = !_showQr;
                                });
                              },
                            ),
                          )
                        ],
                      )
                    ]),
              ));
  }
}

class Notiff extends StatelessWidget {
  final int id;
  final CertificateRequest req;
  final bool isDarkTheme;
  const Notiff({
    Key? key,
    required this.id,
    required this.req,
    required this.isDarkTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 380.0,
        height: 140.0,
        margin: EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.fromLTRB(15, 8, 15, 0),
        decoration: BoxDecoration(
          color: DiyaAppColors(!isDarkTheme).windowColor,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0),
              spreadRadius: 5,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
              child: Text(
                "Заявка на отримання COVID-сертифікату",
                style: TextStyle(
                    fontSize: 11,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'eUkraine'),
              ),
            ),
            Divider(
              color: DiyaAppColors(!isDarkTheme).borderColor,
              thickness: 3,
            ),
            SizedBox(
              height: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    flex: 3,
                    child: Text(
                      "Тип:",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'eUkraine'),
                    )),
                Expanded(
                    flex: 7,
                    child: Center(
                      child: Text(req.certColor,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'eUkraine')),
                    )),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    flex: 3,
                    child: Text(
                      "Час:",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'eUkraine'),
                    )),
                Expanded(
                    flex: 7,
                    child: Center(
                      child: Text(req.time,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'eUkraine')),
                    )),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    flex: 3,
                    child: Text(
                      "Статус:",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'eUkraine'),
                    )),
                Expanded(
                    flex: 7,
                    child: Center(
                      child: Text(req.isReady ? "Готова" : "Обробляється",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'eUkraine')),
                    )),
              ],
            ),
            SizedBox(
              height: 3,
            ),
            Divider(
              color: DiyaAppColors(isDarkTheme).borderColor,
              thickness: 3,
            ),
            Container(
              width: 390,
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Text(
                "ID заявки ${id + 1}",
                style: TextStyle(
                    fontSize: 12,
                    color: Color(0xffA0A0A0),
                    fontWeight: FontWeight.w300,
                    fontFamily: 'eUkraine'),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ));
  }
}

class ServiceBox extends StatelessWidget {
  const ServiceBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        Text("😷", style: TextStyle(fontFamily: 'NotoEmoji', fontSize: 28)),
        Text("Заявка на отримання\nCOVID-сертифікату",
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontFamily: 'eUkraine')),
      ],
    );
  }
}
