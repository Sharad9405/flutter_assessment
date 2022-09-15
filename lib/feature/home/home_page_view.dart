import 'package:domain/constants/enum/operation_type.dart';
import 'package:domain/model/operation_type.dart';
import 'package:domain/model/transaction/transaction.dart';
import 'package:synergy/base/base_page.dart';
import 'package:synergy/feature/home/home_page_viewmodel.dart';
import 'package:synergy/ui/molecules/balance_card.dart';
import 'package:synergy/ui/molecules/send_exchange_setup_item.dart';
import 'package:synergy/ui/widget/show_more_widget.dart';
import 'package:synergy/ui/widget/transaction_list.dart';
import 'package:synergy/ui/stream_builder/app_stream_builder.dart';
import 'package:synergy/ui/ui_utils.dart';
import 'package:synergy/utils/theme/system_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePageView extends BasePageViewWidget<HomePageViewModel> {
  const HomePageView(ProviderBase model, {Key? key}) : super(model, key: key);


  @override
  Widget build(BuildContext context, model) {
    return Container(
      width: SystemTheme.width,
      height: SystemTheme.height,
      padding: EdgeInsets.symmetric(horizontal: SystemTheme.scale(12)),
      margin:  EdgeInsets.only(top: SystemTheme.scale(10),),
      child: SingleChildScrollView(
        primary: true,
        physics: const ClampingScrollPhysics(),
        child: SizedBox(
          width: UIUtils.width(context),
          height: UIUtils.height(context),
          child: Stack(
            children: [
              Positioned.fill(
                left: 0,top: 0,right: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BalanceCard(),

                    AppStreamBuilder<List<OperationType>>(
                        initialData: const [],
                        stream: model.operationTypeStream,
                        dataBuilder: (context, data) {
                          return SendMoneyExchangeSetupPaymentView(
                            operationType: data, onCardClick: (OptType operationType) {
                            model.updateOperationType(context, operationType);
                          },);
                        }
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: SystemTheme.scale(20)),
                      child: const ShowMoreWidget(),
                    ),

                    Expanded(
                      child: AppStreamBuilder<List<Transaction>>(
                          initialData: const [],
                          stream: model.transactionList,
                          dataBuilder: (context, data) {
                            return  TransactionListView(transactionList: data,);
                          }
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                left: 0,bottom: 0,right: 0, child: Container() ,
              ),
            ],
          ),
        ),
      ),
    );
  }
}





