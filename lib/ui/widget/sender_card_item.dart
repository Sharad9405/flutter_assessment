import 'package:domain/constants/enum/text_variant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:synergy/ui/molecules/app_text.dart';
import 'package:synergy/ui/widget/add_bank_card_view.dart';
import 'package:synergy/ui/widget/dotted_container.dart';
import 'package:synergy/utils/theme/color_scheme.dart';
import 'package:synergy/utils/theme/system_theme.dart';
import 'package:domain/model/bank_card.dart';

class SenderCardItem extends StatelessWidget {

  final BankCard bankCard;
  final Function()? onAddReceiptClick;
  final Function(BankCard bankCard)? onCardClick;
  const SenderCardItem({Key? key, required this.bankCard,this.onCardClick, this.onAddReceiptClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SystemTheme.scale(150),
      margin: EdgeInsets.only(right: SystemTheme.scale(10)),
      child: (bankCard.lastFourDigit != null && bankCard.lastFourDigit!.isNotEmpty)
          ? InkWell(
              onTap: () => onCardClick?.call(bankCard),
              child: Card(
                color: bankCard.isSelected ? AppColor.enabledColor : AppColor.cardBg,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(SystemTheme.scale(6)),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: SystemTheme.scale(12), vertical: SystemTheme.scale(5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      AppText(
                        title: '${bankCard.cardType}',
                        fontSize: 18,
                        font: FontEnum.GExtraBold.toString(),
                        textColor: bankCard.isSelected ? AppColor.white : AppColor.lightLabel,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          AppText(
                              title: '****',
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 5,
                              textColor: bankCard.isSelected ? AppColor.white : AppColor.lightLabel,
                              font: FontEnum.Manrope.toString()),
                          AppText(
                              title: '${bankCard.lastFourDigit}',
                              fontSize: 18,
                              letterSpacing: 2,
                              textColor: bankCard.isSelected ? AppColor.white : AppColor.lightLabel,
                              font: FontEnum.GRegular.toString()),
                        ],
                      ),
                      AppText(
                          title: '${bankCard.amount}',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.2,
                          textColor: bankCard.isSelected ? AppColor.white : AppColor.lightLabel,
                          font: FontEnum.Gilroy.toString()),
                    ],
                  )
                ),
              ),
          ) : DottedContainer(child: CupertinoButton(
              onPressed: () => onAddReceiptClick?.call(),
              padding: EdgeInsets.zero,
              child: const AddBankCardView(label: 'New credit or\ndebit card',)),),
    );
  }
}
