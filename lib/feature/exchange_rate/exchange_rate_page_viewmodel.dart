import 'dart:async';

import 'package:rxdart/subjects.dart';
import 'package:synergy/base/base_page_view_model.dart';
import 'package:synergy/utils/extension/stream_extention.dart';

class ExchangeRatePageViewModel extends BasePageViewModel {

  final PublishSubject<List<dynamic>> _exchangeRateList = PublishSubject();
  Stream<List<dynamic>> get exchangeRateStream => _exchangeRateList.stream;

  ExchangeRatePageViewModel(){
    _generateExchangeList();
  }

  void _generateExchangeList() {
    Future.delayed(const Duration(milliseconds: 50), () {
      List<dynamic> list = [];
      for(int i=0;i<4;i++){
        list.add(i);
      }
      _exchangeRateList.safeAdd(list);
    });
  }

  @override
  void dispose() {
    _exchangeRateList.close();
    super.dispose();
  }

}
