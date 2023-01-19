import 'package:date_format/date_format.dart' as DF;

class PaymentResult {
  int? id;
  late String _date;
  bool? isSuccess;

  PaymentResult({this.id});

  String get date {
    try {
      if (_date.isEmpty) throw Error();
      final date = DateTime.parse(_date).toLocal();

      final day = DF.formatDate(date, [DF.dd]);
      final month = DF.formatDate(date, [DF.mm]);

      final year = DF.formatDate(date, [DF.yyyy]);

      return "$day/$month/$year"; // 06/12/2021
    } catch (err) {
      return "";
    }
  }

  PaymentResult.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    _date = json['createdAt'] ?? '';
    isSuccess = json['success'] ?? false;
  }
}
