import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

class DetailLogic extends GetxController {
  List detailList = [
    {
      'symbol': '2330',
      'comp_nm': 'TSMC',
      'shares': '1000',
      'total_chg': 43554,
      'total_pct': '19%',
      'win': true
    },
    {
      'symbol': '2317',
      'comp_nm': 'FOXCONN',
      'shares': '1000',
      'total_chg': 300000,
      'total_pct': '12%',
      'win': false
    },
    {
      'symbol': '2330',
      'comp_nm': 'TSMC',
      'shares': '1000',
      'total_chg': 43554,
      'total_pct': '19%',
      'win': true
    },
    {
      'symbol': '2317',
      'comp_nm': 'FOXCONN',
      'shares': '1000',
      'total_chg': 300000,
      'total_pct': '12%',
      'win': false
    },
  ];

  @override
  void onInit() async {
    super.onInit();
  }
}
