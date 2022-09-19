import 'package:domain/constants/enum/text_variant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:synergy/ui/molecules/app_text.dart';
import 'package:synergy/ui/widget/add_bank_card_view.dart';
import 'package:synergy/ui/widget/dotted_container.dart';
import 'package:synergy/utils/img_util.dart';
import 'package:synergy/utils/theme/color_scheme.dart';
import 'package:synergy/utils/theme/system_theme.dart';
import 'package:domain/model/bank_card.dart';

class ReceiverCardItem extends StatelessWidget {

  final BankCard bankCard;
  final Function()? onAddRecipientClick;
  final Function(BankCard bankCard)? onCardClick;
  const ReceiverCardItem({Key? key, required this.bankCard,this.onCardClick, this.onAddRecipientClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SystemTheme.scale(150),
      margin: EdgeInsets.only(right: SystemTheme.scale(10)),
      child: (bankCard.firstName != null)
          ? CupertinoButton(
              onPressed: () => onCardClick?.call(bankCard),
              padding: EdgeInsets.zero,
              child: Card(
                color: bankCard.isSelected ? AppColor.enabledColor : AppColor.cardBg,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(SystemTheme.scale(6)),
                ),
                child: Container(
                    width: SystemTheme.scale(150),
                  padding: EdgeInsets.symmetric(horizontal: SystemTheme.scale(12), vertical: SystemTheme.scale(5)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      (bankCard.url != null && bankCard.url!.isNotEmpty)
                          ?  ImageUtil.assetPng(name: '${bankCard.url}', width: SystemTheme.scale(50),
                              height: SystemTheme.scale(50), fit: BoxFit.cover)
                          : Container(
                              width: SystemTheme.scale(50),
                              height: SystemTheme.scale(50),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: AppColor.white,),
                           child: Center(
                             child: AppText(
                                title: _getText(bankCard).toUpperCase(),
                                fontSize: 20,
                                textAlign: TextAlign.center,
                                font: FontEnum.GMedium.toString(),
                                letterSpacing: 0.2,
                                textColor: bankCard.isSelected ? AppColor.enabledColor : AppColor.lightLabel,
                              ),
                           ),
                      ),

                      AppText(
                        title: '${bankCard.firstName}\n${bankCard.lastName}',
                        fontSize: 14,
                        textAlign: TextAlign.center,
                        font: FontEnum.GMedium.toString(),
                        textColor: bankCard.isSelected ? AppColor.white : AppColor.lightLabel,
                      ),
                    ],
                  )
                ),
              ),
          ) : DottedContainer(child: CupertinoButton(
              onPressed: () => onAddRecipientClick?.call(),
              padding: EdgeInsets.zero,
              child: const AddBankCardView(label: 'Add Recipient')),),
    );
  }

 String _getText(BankCard bankCard) {
    String name = '';
    if(bankCard.firstName != null && bankCard.firstName!.isNotEmpty){
      name = bankCard.firstName![0];
    }if(bankCard.lastName != null && bankCard.lastName!.isNotEmpty){
      name = '$name${bankCard.lastName![0]}';
    }
    return name;
  }
}
