import 'package:synergy/base/base_page.dart';
import 'package:synergy/feature/exchange_rate/exchange_rate_page_viewmodel.dart';
import 'package:synergy/ui/molecules/custome_circle.dart';
import 'package:synergy/ui/textfield/app_textfield.dart';
import 'package:synergy/ui/widget/exchange_rate_item.dart';
import 'package:synergy/utils/img_util.dart';
import 'package:synergy/ui/stream_builder/app_stream_builder.dart';
import 'package:synergy/ui/ui_utils.dart';
import 'package:synergy/utils/asset_utils.dart';
import 'package:synergy/utils/theme/system_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synergy/utils/theme/color_scheme.dart';

/// Exchange rate page ui
class ExchangeRatePageView extends BasePageViewWidget<ExchangeRatePageViewModel> {
  const ExchangeRatePageView(ProviderBase model, {Key? key}) : super(model, key: key);

  @override
  Widget build(BuildContext context, model) {

    return Container(
      width: UIUtils.width(context),
      height: UIUtils.height(context),
      padding: EdgeInsets.symmetric(horizontal: SystemTheme.scale(12)),
      margin:  EdgeInsets.only(top: SystemTheme.scale(10),),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: SystemTheme.scale(10), vertical: SystemTheme.scale(10)),
        child: Stack(
          children: [
            Positioned.fill(child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  margin: const EdgeInsets.symmetric(vertical: 7.5),
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(offset: Offset(0, 15), blurRadius: 35, spreadRadius: 0, color: Color.fromARGB(13, 0, 13, 26)),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: AppTextField(
                    hintText: 'Enter a date',
                    fontSize: 12,
                    hintColor: AppColor.color243656.withOpacity(0.5),
                    borderColor: AppColor.transparent,
                    showOutLineInputBorder: false,
                    prefixIcon: () => Padding(padding: EdgeInsets.only(right: SystemTheme.scale(10)),
                      child: ImageUtil.assetSvg(assetName: AssetUtils.iconSearch, width: SystemTheme.scale(16),
                        height: SystemTheme.scale(16),fit: BoxFit.cover,),
                    ),
                  ),
                ),

                SizedBox(height: SystemTheme.scale(25),),

                Expanded(
                  child: AppStreamBuilder<List<dynamic>>(
                    initialData: const [],
                    stream: model.exchangeRateStream,
                    dataBuilder: (context, data) =>
                    (data != null && data.isNotEmpty)
                        ? ListView.builder(
                          padding: EdgeInsets.only(bottom: SystemTheme.scale(60)),
                          itemCount: data.length,
                          itemBuilder: (context, index) => const ExchangeRateItem())
                        : const SizedBox.shrink(),
                  ),
                ),
              ],
            ),),
            Positioned(bottom: 0,right: 0,
                child: CustomCircle(width: 56,height: 56,
                  child: Center(
                    child: ImageUtil.assetSvg(assetName: AssetUtils.iconAdd),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}






