import 'package:domain/constants/enum/text_variant.dart';
import 'package:flutter/material.dart';
import 'package:synergy/ui/molecules/app_text.dart';
import 'package:synergy/ui/widget/transaction_list_item.dart';
import 'package:synergy/utils/theme/color_scheme.dart';
import 'package:synergy/utils/theme/system_theme.dart';
import 'package:domain/model/transaction/transaction.dart';

class TransactionListView extends StatelessWidget {
  const TransactionListView({Key? key, this.transactionList}) : super(key: key);

  final List<Transaction>? transactionList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SystemTheme.width,
      height: SystemTheme.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: SystemTheme.scale(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  title: "Transactions",
                  fontSize: 16,
                  font: FontEnum.GMedium.toString(),
                  textColor: AppColor.listAnchorColor,
                ),
                AppText(
                  title: "View all",
                  fontSize: 12,
                  font: FontEnum.GMedium.toString(),
                  textColor: AppColor.listAnchorColor.withOpacity(0.5),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: transactionList?.length,
                itemBuilder: (context, index){
                  return TransactionListItem(transaction: transactionList![index],);
                }
            ),
          ),
        ],
      ),
    );
  }
}
