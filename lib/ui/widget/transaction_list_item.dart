import 'package:domain/constants/enum/text_variant.dart';
import 'package:domain/model/transaction/transaction.dart';
import 'package:flutter/material.dart';
import 'package:synergy/ui/molecules/app_text.dart';
import 'package:synergy/utils/theme/color_scheme.dart';
import 'package:synergy/utils/theme/system_theme.dart';

class TransactionListItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionListItem({Key? key, required this.transaction,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: SystemTheme.scale(15),),
      margin: EdgeInsets.symmetric(vertical: SystemTheme.scale(8), horizontal: SystemTheme.scale(5)),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              offset: Offset(2, 8),
              blurRadius: 48,
              spreadRadius: -16,
              color: Color.fromARGB(25, 0, 13, 26)),
        ],
        borderRadius: BorderRadius.circular(SystemTheme.scale(18)),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: AppColor.thinLightGrey,
            child: AppText(
              title: transaction.name![0].toUpperCase(),
              fontSize: 17,
              font: FontEnum.Manrope.toString(),
              fontWeight: FontWeight.w700,
            ),
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: SystemTheme.scale(10), vertical: 10),
              child: Container(
                height: SystemTheme.scale(60),
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: AppText(
                        title: '${transaction.name}',
                        fontSize: 16,
                        font: FontEnum.GMedium.toString(),
                        textColor: AppColor.listAnchorColor,
                      ),
                    ),

                    Expanded(
                      child: AppText(
                        title: '${transaction.time}',
                        fontSize: 12,
                        font: FontEnum.GRegular.toString(),
                        textColor: AppColor.listAnchorColor.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          AppText(
            title: '${transaction.amount}',
            fontSize: 13,
            font: FontEnum.GMedium.toString(),
            textColor: AppColor.lightGreen,
          ),
        ],
      ),
    );
  }
}
