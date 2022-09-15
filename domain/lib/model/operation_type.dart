import 'package:domain/constants/enum/operation_type.dart';

class OperationType{
  final String icon;
  final String title;
  final OptType optType;
  bool isSelected;

  OperationType({required this.icon, required this.title, required this.optType, this.isSelected = false});


}