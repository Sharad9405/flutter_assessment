import 'package:domain/constants/enum/text_variant.dart';
import 'package:domain/model/bank_card.dart';
import 'package:synergy/base/base_page.dart';
import 'package:synergy/feature/payment/payment_page_viewmodel.dart';
import 'package:synergy/feature/payment/receiver/receiver.dart';
import 'package:synergy/feature/payment/sender/sender.dart';
import 'package:synergy/ui/widget/custom_divider.dart';
import 'package:synergy/ui/molecules/button/app_button.dart';
import 'package:synergy/ui/molecules/app_text.dart';
import 'package:synergy/ui/stream_builder/app_stream_builder.dart';
import 'package:synergy/ui/ui_utils.dart';
import 'package:synergy/utils/theme/system_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synergy/utils/theme/color_scheme.dart';

class PaymentPageView extends BasePageViewWidget<PaymentPageViewModel> {

  const PaymentPageView(ProviderBase model, {Key? key,}) : super(model, key: key);

  @override
  Widget build(BuildContext context, model) {
    return Container(
      width: SystemTheme.width,
      height: SystemTheme.height,
      padding: EdgeInsets.symmetric(horizontal: SystemTheme.scale(20), vertical: SystemTheme.scale(10)),
      margin:  EdgeInsets.only(top: SystemTheme.scale(10),),
      child: Stack(
        children: [
          Positioned.fill(
            top: 0,left: 0,right: 0,
            child: Column(
              children: [
                Expanded(
                    child: Column(
                      children: <Widget>[
                        TabBar(
                            labelPadding: EdgeInsets.symmetric(horizontal: SystemTheme.scale(8)),
                            controller: model.tabController,
                            labelColor: AppColor.selectedTab,
                            unselectedLabelColor: AppColor.unSelectedTab,
                            indicatorColor: AppColor.enabledColor,
                            isScrollable: true,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorPadding: EdgeInsets.symmetric(horizontal: SystemTheme.scale(20)),
                            tabs: [
                              SizedBox(
                                width: SystemTheme.width / 2.5,
                                child: Tab(
                                  child: AppText(
                                    title: 'Sender',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    setColorNull: true,
                                    font: FontEnum.Gilroy.toString(),
                                    letterSpacing: 0.1,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: SystemTheme.width / 2.5,
                                child: Tab(
                                  child: AppText(
                                    title: 'Receiver',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    font: FontEnum.Gilroy.toString(),
                                    letterSpacing: 0.1,
                                    setColorNull: true,
                                  ),
                                ),
                              ),


                            ]),

                        CustomDivider(width: SystemTheme.width, height: SystemTheme.scale(1),color: AppColor.dividerColor2,),

                        Expanded(
                          child: SizedBox(
                            width: SystemTheme.width,
                            height: SystemTheme.height,
                            child: TabBarView(
                              controller: model.tabController,
                              children: [

                                AppStreamBuilder<List<BankCard>>(
                                    initialData: const [],
                                    stream: model.senderListStream,
                                    dataBuilder: (context, data) {
                                      return  SenderPage(bankCard: data!, onCardClick: (bankCard){
                                        model.updateSenderCardSelection(bankCard);
                                      },onAddReceiptClick: (){
                                      },);
                                    }
                                ),

                                AppStreamBuilder<List<BankCard>>(
                                    initialData: const [],
                                    stream: model.receiverListStream,
                                    dataBuilder: (context, data) {
                                      if(data != null && data.isNotEmpty) {
                                        return  ReceiverPage(recipientList: data, onRecipientCardClick: (bankCard){
                                        model.updateReceiverCardSelection(bankCard);
                                      },onAddRecipientClick: (){
                                      },);
                                      }
                                      return const SizedBox.shrink();
                                    }
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),

          Positioned(
            bottom: 0,left: 0,right: 0,
            child: Container(
              margin: EdgeInsets.only(top: SystemTheme.scale(20)),
              child: AppButton(
                text: "Next",
                height: 50,
                width: UIUtils.width(context),
                textColor: AppColor.white,
                fontSize: 15, letterSpacing: 2,
                onButtonTap: () => model.handleNextEvent(context),
              ),
            ),
          ),
        ]
      ),
    );
  }


}
