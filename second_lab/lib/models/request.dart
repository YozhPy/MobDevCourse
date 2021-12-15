import 'package:intl/intl.dart';

class CertificateRequest {
  final DateTime creationTime;
  final bool isReady;
  final String certColor;

  CertificateRequest(this.creationTime, this.certColor, [this.isReady = false]);

  String get time => DateFormat('kk:mm - dd/MM/yyyy')
      .format(creationTime.add(const Duration(hours: 2)));
}
