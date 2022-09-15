import 'package:domain/constants/enum/text_variant.dart';
import 'package:domain/model/bank_card.dart';
import 'package:flutter/material.dart';
import 'package:synergy/ui/molecules/app_text.dart';
import 'package:synergy/ui/textfield/app_textfield.dart';
import 'package:synergy/ui/widget/sender_card_item.dart';
import 'package:synergy/ui/widget/transaction_details.dart';
import 'package:synergy/utils/theme/color_scheme.dart';
import 'package:synergy/utils/theme/system_theme.dart';

class SenderPage extends StatelessWidget {

  const SenderPage({Key? key, required this.bankCard, this.onCardClick, this.onAddReceiptClick})
      : super(key: key);

  final List<BankCard> bankCard;
  final Function()? onAddReceiptClick;
  final Function(BankCard bankCard)? onCardClick;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Container(
        margin: EdgeInsets.only(top: SystemTheme.scale(20)),
        padding: EdgeInsets.only(bottom: SystemTheme.scale(100)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  AppText(
                    title: "Select credit or debit card",
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

              SizedBox(
                height: SystemTheme.scale(130),
                child: ListView.builder(
                    itemCount: bankCard.length,
                    padding: EdgeInsets.symmetric(vertical: SystemTheme.scale(5)),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                      return  SenderCardItem(bankCard: bankCard[index],onCardClick: (bankCard) => onCardClick?.call(bankCard),
                          onAddReceiptClick: () => onAddReceiptClick?.call());
                    }),
              ),

              const TransactionDetails(),

              SizedBox(height: SystemTheme.scale(20)),

              AppTextField(
                hintText: 'Description (optional)',
                fontSize: 16,
                letterSpacing: 0.2,
                textColor: AppColor.black,
                hintColor: AppColor.unSelectedTab,
                contentPadding:  EdgeInsets.symmetric(
                  horizontal:  SystemTheme.scale(20),
                  vertical: SystemTheme.scale(35),
                ),
              ),

            ],
          ),
      ),
    );
  }
}

