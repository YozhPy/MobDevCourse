import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CertificateRequest {
  final DateTime creationTime;
  final bool isReady;
  final String certColor;

  CertificateRequest(this.creationTime, this.certColor, [this.isReady = false]);

  String get time => DateFormat('kk:mm - dd/MM/yyyy')
      .format(creationTime.add(const Duration(hours: 2)));
}

class RequestsList extends ChangeNotifier {
  final List<CertificateRequest> _items = [];

  List<CertificateRequest> get items => _items;

  int get currentLength => _items.length;

  CertificateRequest getByIndex(int id) => _items[id];

  void addReq(CertificateRequest item) {
    if (currentLength > 10) {
      removeAll();
    }
    _items.add(item);
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }
}
