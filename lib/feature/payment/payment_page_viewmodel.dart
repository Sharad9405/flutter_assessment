import 'dart:async';

import 'package:domain/constants/enum/sender_receiver_type.dart';
import 'package:domain/model/bank_card.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:synergy/base/base_page_view_model.dart';
import 'package:synergy/main/navigation/route_paths.dart';
import 'package:synergy/utils/asset_utils.dart';
import 'package:synergy/utils/extension/stream_extention.dart';

class PaymentPageViewModel extends BasePageViewModel {
  final PublishSubject<String> _appVersionResponse = PublishSubject();

  Stream<String> get appVersionStream => _appVersionResponse.stream;
  final BehaviorSubject<bool> _isUserLoggedIn = BehaviorSubject.seeded(false);
  Stream<bool> get isUserLoggedIn => _isUserLoggedIn.stream;

  final BehaviorSubject<List<BankCard>> _senderList = BehaviorSubject.seeded([]);
  Stream<List<BankCard>> get senderListStream => _senderList.stream;

  final BehaviorSubject<List<BankCard>> _receiverList = BehaviorSubject.seeded([]);
  Stream<List<BankCard>> get receiverListStream => _receiverList.stream;

  TabController? tabController;

  PaymentPageViewModel(){

    _generateSenderData();
    _generateReceiverData();
  }
  void _generateSenderData() {
    Future.delayed(const Duration(milliseconds: 50), () {
      List<BankCard> list = [];
      list.add(BankCard(
          cardType: 'MASTER',
          lastFourDigit: '3589',
          amount: '\$ 1,345.56',
          type: SenderReceiverType.SENDER,
          isSelected: false,
      ));
      list.add(BankCard(
        cardType: 'VISA',
        lastFourDigit: '2786',
        amount: '\$ 1,345.56',
        type: SenderReceiverType.SENDER,
        isSelected: false,
      ));
      list.add(BankCard(
        type: SenderReceiverType.SENDER,
        isSelected: false,
      ));
      _senderList.safeAdd(list);
    });
  }

  void _generateReceiverData() {
    Future.delayed(const Duration(milliseconds: 50), () {
      List<BankCard> list = [];

      list.add(BankCard(
        index: 0,
        url: AssetUtils.imgUser,
        firstName: 'Rob',
        lastName: 'Franz',
        type: SenderReceiverType.RECEIVER,
        isSelected: false,
      ));
      list.add(BankCard(
        index: 1,
        firstName: 'Franz',
        lastName: 'Ferdinand',
        type: SenderReceiverType.RECEIVER,
        isSelected: false,
      ));
      list.add(BankCard(
        index: 1,
        type: SenderReceiverType.RECEIVER,
        isSelected: false,
      ));
      _receiverList.safeAdd(list);
    });
  }

  void updateSenderCardSelection(BankCard bankCard) {
    List<BankCard> list = _senderList.value;
    List<BankCard> newList = list;
    newList.forEach((element) {
      if(element.lastFourDigit == bankCard.lastFourDigit){
        element.isSelected = true;
      }else{
        element.isSelected = false;
      }
    });
    _senderList.safeAdd(newList);
  }

  void updateReceiverCardSelection(BankCard bankCard) {
    print('Clicked=> ${bankCard.index}');
    List<BankCard> list = _receiverList.value;
    List<BankCard> newList = list;
    newList.forEach((element) {
      if(element.index == bankCard.index){
        element.isSelected = true;
      }else{
        element.isSelected = false;
      }
    });
    _receiverList.safeAdd(newList);
  }

  handleNextEvent(BuildContext context) {
      if(tabController == null) return;
      if(tabController?.index == 0){
        tabController?.animateTo(1,duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
      }else if(tabController?.index == 1){
        Navigator.pushNamed(context, RoutePaths.schedule);
      }
  }

  @override
  void dispose() {
    _appVersionResponse.close();
    super.dispose();
  }

}
