import 'dart:async';
import 'package:domain/constants/enum/operation_type.dart';
import 'package:domain/model/transaction/transaction.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:synergy/base/base_page_view_model.dart';
import 'package:synergy/main/navigation/route_paths.dart';
import 'package:synergy/utils/asset_utils.dart';
import 'package:synergy/utils/extension/stream_extention.dart';
import 'package:domain/model/operation_type.dart';

class HomePageViewModel extends BasePageViewModel {
  final PublishSubject<String> _appVersionResponse = PublishSubject();

  Stream<String> get appVersionStream => _appVersionResponse.stream;
  final BehaviorSubject<bool> _isUserLoggedIn = BehaviorSubject.seeded(false);
  Stream<bool> get isUserLoggedIn => _isUserLoggedIn.stream;

  final BehaviorSubject<List<OperationType>> _operationType = BehaviorSubject.seeded([]);
  Stream<List<OperationType>> get operationTypeStream => _operationType.stream;

  final PublishSubject<List<Transaction>> _transactionList = PublishSubject();
  Stream<List<Transaction>> get transactionList => _transactionList.stream;

  HomePageViewModel(){

    _generateOperationTypes();
    _generateTransactions();
  }



  void _generateOperationTypes() {
    Future.delayed(const Duration(milliseconds: 50), () {
        List<OperationType> list = [];
        list.add(OperationType(
          icon: AssetUtils.iconSendMoney,
          title: 'Send\nMoney',
          optType: OptType.SEND_MONEY,
          isSelected: false,
        ));
        list.add(OperationType(
          icon: AssetUtils.iconExchangeRate,
          title: 'Exchange\nRate',
          optType: OptType.EXCHANGE_RATE,
          isSelected: false,
        ));
        list.add(OperationType(
          icon: AssetUtils.iconSetupPayment,
          title: 'Setup\nRegular\nPayment',
          optType: OptType.SETUP_PAYMENT,
          isSelected: false,
        ));
        list.add(OperationType(
          icon: AssetUtils.iconSendMoney,
          title: 'Live Chat',
          optType: OptType.LIVE_CHAT,
          isSelected: false,
        ));
        _operationType.safeAdd(list);

    });
  }

  void _generateTransactions() {
    Future.delayed(const Duration(milliseconds: 500), () {
      List<Transaction> list = [];
      list.add(Transaction(
        name: 'Mike Rine',
        time: '2 hours ago',
        amount: '+\$250',
      ));
      list.add(Transaction(
        name: 'Casey Smith',
        time: '1 week ago',
        amount: '+\$450',
      ));
      list.add(Transaction(
        name: 'Sharad',
        time: '2 week ago',
        amount: '+\$500',
      ));
      _transactionList.safeAdd(list);
    });
  }

  void updateOperationType(context, OptType? operationType) {
    if(operationType == null) return;
    List<OperationType> oldList = _operationType.value;
    List<OperationType> newList = oldList;
    for (var element in newList) {
      if(operationType.name == element.optType.name){
        element.isSelected = true;
      }else{
        element.isSelected = false;
      }
    }
    _operationType.safeAdd(newList);

    switch(operationType){
      case OptType.SEND_MONEY:{
        Navigator.pushNamed(context, RoutePaths.payment);
      }break;
      case OptType.EXCHANGE_RATE:
        Navigator.pushNamed(context, RoutePaths.exchangeRate);
        break;
      case OptType.SETUP_PAYMENT:
        Navigator.pushNamed(context, RoutePaths.payment);
        break;
      case OptType.LIVE_CHAT:
        Navigator.pushNamed(context, RoutePaths.payment);
        break;
      case OptType.NONE:
      // TODO: Handle this case.
        break;
    }
  }

  @override
  void dispose() {
    _appVersionResponse.close();
    _operationType. close();
    _transactionList.close();
    super.dispose();
  }

}
