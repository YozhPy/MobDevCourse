import 'package:flutter/material.dart';
import 'package:second_lab/models/change_theme.dart';
import '../components.dart';
import 'package:flutter/painting.dart';

// ignore: must_be_immutable
class DocumentPage extends StatefulWidget {
  late ThemeProvider thm;
  late void Function(bool?) changeThemeTap;

  final String documentName, documentText;

  DocumentPage({
    Key? key,
    required this.documentName,
    required this.documentText,
    ThemeProvider? thm,
  }) : super(key: key) {
    this.thm = thm!;
  }

  @override
  State<DocumentPage> createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
  void _changeThemeOnTap(bool? value) {
    value ??= false;
    setState(() {
      widget.thm.darkTheme = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: DiyaAppColors(widget.thm.darkTheme).windowColor),
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
                          children: [
                            const Image(
                              image: AssetImage("assets/main_logo.png"),
                              width: 50.0,
                              height: 50.0,
                            ),
                            Switch(
                              value: widget.thm.darkTheme,
                              onChanged: _changeThemeOnTap,
                              activeColor: Colors.black,
                            ),
                          ])),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
                    child: Document(
                      isCustomTheme: widget.thm.darkTheme,
                      documentName: widget.documentName,
                      imageSrc: "assets/4head_2.jpg",
                      documentText: widget.documentText,
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
