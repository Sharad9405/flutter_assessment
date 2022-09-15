import 'package:domain/constants/enum/sender_receiver_type.dart';

class BankCard{
  final int? index;
  final String? url;
  final String? firstName;
  final String? lastName;
  final String? cardType;
  final String? lastFourDigit;
  final String? amount;
  final SenderReceiverType? type;
  bool isSelected;

  BankCard({this.index, this.url, this.firstName, this.lastName, this.cardType, this.lastFourDigit, this.amount, this.type, this.isSelected = false});


}