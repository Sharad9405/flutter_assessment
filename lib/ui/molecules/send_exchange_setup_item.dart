import 'package:domain/constants/enum/text_variant.dart';
import 'package:domain/model/operation_type.dart';
import 'package:flutter/material.dart';
import 'package:synergy/ui/molecules/app_text.dart';
import 'package:synergy/utils/img_util.dart';
import 'package:synergy/utils/theme/color_scheme.dart';
import 'package:synergy/utils/theme/system_theme.dart';
import 'package:domain/constants/enum/operation_type.dart';

class SendMoneyExchangeSetupPaymentView extends StatefulWidget {
  final List<OperationType>? operationType;
  final Function(OptType operationType)? onCardClick;
  const SendMoneyExchangeSetupPaymentView({Key? key, required this.operationType, required this.onCardClick}) : super(key: key);

  @override
  State<SendMoneyExchangeSetupPaymentView> createState() => _SendMoneyExchangeSetupPaymentViewState();
}

class _SendMoneyExchangeSetupPaymentViewState extends State<SendMoneyExchangeSetupPaymentView> {
  @override
  Widget build(BuildContext context) {

    return Center(
      child: SizedBox(
        height: SystemTheme.scale(120),
        child: ListView.builder(
            itemCount: widget.operationType?.length,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
              return InkWell(
                onTap: () => widget.onCardClick?.call(widget.operationType![index].optType),
                child: Container(
                  height: SystemTheme.scale(120),
                  width: SystemTheme.scale(107),
                  margin: EdgeInsets.all(SystemTheme.scale(5)),
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(2, 8),
                          blurRadius: 48,
                          spreadRadius: -16,
                          color: Color.fromARGB(25, 0, 13, 26)),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    color: widget.operationType![index].isSelected ? AppColor.enabledColor : AppColor.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: SystemTheme.scale(10)),
                        child: ImageUtil.assetSvg(assetName: widget.operationType![index].icon, width: SystemTheme.scale(26),
                            height: SystemTheme.scale(24), fit: BoxFit.cover,
                            color: widget.operationType![index].isSelected ? AppColor.white : AppColor.enabledColor),
                      ),
                      AppText(
                        title: widget.operationType![index].title,
                        fontSize: 12,
                        mLeft: SystemTheme.scale(16),
                        font: FontEnum.GMedium.toString(),
                        textColor: widget.operationType![index].isSelected ? AppColor.white : AppColor.enabledColor,
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}