import 'package:domain/constants/enum/text_variant.dart';
import 'package:domain/model/bank_card.dart';
import 'package:flutter/material.dart';
import 'package:synergy/ui/molecules/app_bottom_sheet.dart';
import 'package:synergy/ui/molecules/app_text.dart';
import 'package:synergy/ui/widget/add_bank_details.dart';
import 'package:synergy/ui/widget/bank_account_number_view.dart';
import 'package:synergy/ui/widget/receiver_card_item.dart';
import 'package:synergy/ui/widget/receiver_payment_details.dart';
import 'package:synergy/utils/asset_utils.dart';
import 'package:synergy/utils/theme/color_scheme.dart';
import 'package:synergy/utils/theme/system_theme.dart';


class ReceiverPage extends StatelessWidget {
  const ReceiverPage({Key? key, required this.recipientList, this.onAddRecipientClick,
    this.onRecipientCardClick}) : super(key: key);

  final List<BankCard> recipientList;
  final Function()? onAddRecipientClick;
  final Function(BankCard bankCard)? onRecipientCardClick;

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Container(
          margin: EdgeInsets.only(top: SystemTheme.scale(20)),
          padding: EdgeInsets.only(bottom: SystemTheme.scale(100)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  AppText(
                    title: "Recipient",
                    fontSize: 12,
                    font: FontEnum.GRegular.toString(),
                    letterSpacing: 0.2,
                    textColor: AppColor.lightLabel,
                  ),
                  const Spacer(),
                  AppText(
                    title: "Show all",
                    fontSize: 12,
                    font: FontEnum.GMedium.toString(),
                    letterSpacing: 0.2,
                    textColor: AppColor.enabledColor,
                  ),
                ],
              ),

              if(recipientList.isNotEmpty)
              SizedBox(
                height: SystemTheme.scale(130),
                child: ListView.builder(
                    itemCount: recipientList.length,
                    padding: EdgeInsets.symmetric(vertical: SystemTheme.scale(5)),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                      return  ReceiverCardItem(bankCard: recipientList[index],
                          onCardClick: (bankCard) => onRecipientCardClick?.call(bankCard),
                          onAddRecipientClick: () => onAddRecipientClick?.call());
                    }),
              ),

              const ReceiverPaymentDetails(),

              BankAccountNumberView(mTop: 20, label: 'Bank Name', title: 'FirstBank Nigeria - ****456',
                leadingIcon: AssetUtils.iconBankNumber,
                onClick: (value){
                  AppBottomSheet.show(context, builder: (context) => AddBankDetails(onAddAccountClick: (String value) {

                  },));
                },),
              BankAccountNumberView(mTop: 0, label: 'Account Number', title: '1234567890123456',
                leadingIcon: AssetUtils.iconAccountNumber, showAddAccount: true, onClick: (value){
                  AppBottomSheet.show(context, builder: (context) => AddBankDetails(onAddAccountClick: (String value) {

                  },));
                },),

            ],
          )),
    );
  }
}



