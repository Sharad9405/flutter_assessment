import 'package:domain/constants/enum/text_variant.dart';
import 'package:flutter/cupertino.dart';
import 'package:synergy/base/base_page.dart';
import 'package:synergy/feature/schedule/schedule_page_viewmodel.dart';
import 'package:synergy/main/navigation/route_paths.dart';
import 'package:synergy/ui/widget/custom_checkbox.dart';
import 'package:synergy/ui/widget/custom_divider.dart';
import 'package:synergy/ui/widget/date_picker.dart';
import 'package:synergy/utils/img_util.dart';
import 'package:synergy/ui/molecules/button/swipe_button.dart';
import 'package:synergy/ui/molecules/app_text.dart';
import 'package:synergy/ui/ui_utils.dart';
import 'package:synergy/utils/asset_utils.dart';
import 'package:synergy/utils/theme/system_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synergy/utils/theme/color_scheme.dart';

class SchedulePageView extends BasePageViewWidget<SchedulePageViewModel> {
  const SchedulePageView(ProviderBase model, {Key? key}) : super(model, key: key);

  @override
  Widget build(BuildContext context, model) {
    return Container(
      width: SystemTheme.width,
      height: SystemTheme.height,
      padding: EdgeInsets.symmetric(horizontal: SystemTheme.scale(20),),
      margin:  EdgeInsets.only(top: SystemTheme.scale(15), bottom:  SystemTheme.scale(10)),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    title: 'Schedule',
                    fontSize: 14,
                    font: FontEnum.Gilroy.toString(),
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),

                  Container(
                   padding:  EdgeInsets.symmetric(horizontal: SystemTheme.scale(10), vertical: SystemTheme.scale(10)),
                   margin: EdgeInsets.only(bottom: SystemTheme.scale(75)),
                    child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisSize: MainAxisSize.min,
                     children: [
                       AppText(
                         title: 'Payment Reference',
                         fontSize: 14,
                         mTop: SystemTheme.scale(12),
                         font: FontEnum.GMedium.toString(),
                         textColor: AppColor.lightGrey2,
                       ),
                       AppText(title: 'Mum monthly allowance',
                         fontSize: 16,
                         font: FontEnum.GMedium.toString(),
                         pTop: SystemTheme.scale(7), mBottom: SystemTheme.scale(7),
                         textColor: AppColor.subHeader,
                       ),

                       CustomDivider(pTop: 10,width: SystemTheme.width, height: SystemTheme.scale(0.5),color: AppColor.colorE8E9F3),

                       AppText(
                         title: 'First Payment Date',
                         fontSize: 14,
                         mTop: SystemTheme.scale(25),
                         font: FontEnum.GMedium.toString(),
                         textColor: AppColor.lightGrey2,
                       ),
                       CupertinoButton(
                         onPressed: () {
                           _openDatePicker(context);
                         },
                         padding: const EdgeInsets.all(0),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             AppText(title: '4 August 2021',
                               fontSize: 16,
                               font: FontEnum.GMedium.toString(),
                               pTop: SystemTheme.scale(7), mBottom: SystemTheme.scale(10),
                               textColor: AppColor.subHeader,
                             ),
                             ImageUtil.assetSvg(assetName: AssetUtils.iconCalendar, width: SystemTheme.scale(15),
                                 height: SystemTheme.scale(15.35), fit: BoxFit.cover)
                           ],
                         ),
                       ),

                       CustomDivider(pTop: 5,width: SystemTheme.width, height: SystemTheme.scale(0.5),color: AppColor.colorE8E9F3),
                       AppText(title: 'Payment Frequency',
                         fontSize: 14,
                         font: FontEnum.GMedium.toString(),
                         mTop: SystemTheme.scale(20),
                         textColor: AppColor.lightGrey2,
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Expanded(
                             child: Padding(
                               padding:  EdgeInsets.only(left: SystemTheme.scale(15), top: SystemTheme.scale(15)),
                               child: Column(
                                 children: [
                                   AppText(title: '2',
                                     font: FontEnum.GMedium.toString(),
                                     fontSize: 16,
                                     pTop: SystemTheme.scale(7), mBottom: SystemTheme.scale(10),
                                     textColor: AppColor.subHeader,
                                   ),
                                   CustomDivider(width: SystemTheme.width, height: SystemTheme.scale(0.5),color: AppColor.colorE8E9F3),
                                 ],
                               ),
                             ),
                           ),
                           Expanded(
                             child: Padding(
                               padding:  EdgeInsets.only(left: SystemTheme.scale(15), top: SystemTheme.scale(15)),
                               child: Column(
                                 children: [
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       AppText(title: 'Day(s)',
                                         font: FontEnum.GMedium.toString(),
                                         fontSize: 16,
                                         pTop: SystemTheme.scale(7), mBottom: SystemTheme.scale(10),
                                         textColor: AppColor.subHeader,
                                       ),

                                       ImageUtil.assetSvg(assetName: AssetUtils.iconArrowDown, width: SystemTheme.scale(17),
                                           height: SystemTheme.scale(17), fit: BoxFit.cover)

                                     ],
                                   ),
                                   CustomDivider(width: SystemTheme.width, height: SystemTheme.scale(0.5),color: AppColor.colorE8E9F3),

                                 ],
                               ),
                             ),
                           )
                         ],
                       ),
                       Padding(
                         padding: EdgeInsets.only(top: SystemTheme.scale(45)),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           mainAxisSize: MainAxisSize.min,
                           children: [
                             const CustomCheckbox(enabled : true),
                             AppText(title: 'Will future notice',
                               fontSize: 11,
                               font: FontEnum.GMedium.toString(),
                               mLeft: SystemTheme.scale(15),
                               textColor: AppColor.lightGrey2,
                             ),
                           ],
                         ),
                       ),
                       Container(
                         margin: EdgeInsets.only(top: SystemTheme.scale(27),),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Expanded(child: CustomDivider( height: SystemTheme.scale(0.5),color: AppColor.colorE8E9F3)),
                             AppText(title: 'Or',
                               fontSize: 16,
                               font: FontEnum.GMedium.toString(),
                               mLeft: SystemTheme.scale(5),
                               mRight: SystemTheme.scale(5),
                               textColor: AppColor.subHeader,
                             ),
                             Expanded(child: CustomDivider( height: SystemTheme.scale(0.5),color: AppColor.colorE8E9F3)),
                           ],
                         ),
                       ),
                       Container(
                         margin: EdgeInsets.only(top: SystemTheme.scale(22)),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Expanded(
                               child: Row(
                                 children: [
                                   const CustomCheckbox(enabled : false),
                                   AppText(title: 'Number of payments',
                                     fontSize: 11,
                                     font: FontEnum.GMedium.toString(),
                                     mLeft: SystemTheme.scale(15),
                                     textColor: AppColor.label,
                                   ),
                                 ],
                               ),
                             ),
                             Expanded(
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   AppText(title: '10',
                                     fontSize: 16,
                                     font: FontEnum.GMedium.toString(),
                                     mLeft: SystemTheme.scale(15),
                                     textColor: AppColor.subHeader,
                                   ),
                                   CustomDivider(width: SystemTheme.width, height: SystemTheme.scale(0.5),color: AppColor.colorE8E9F3),
                                 ],
                               ),
                             ),

                           ],
                         ),
                       ),
                       Container(
                         margin: EdgeInsets.only(top: SystemTheme.scale(27),),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Expanded(child: CustomDivider(width: SystemTheme.width, height: SystemTheme.scale(0.5),color: AppColor.colorE8E9F3)),

                             AppText(title: 'Or',
                               fontSize: 16,
                               font: FontEnum.GMedium.toString(),
                               mLeft: SystemTheme.scale(5),
                               mRight: SystemTheme.scale(5),
                               textColor: AppColor.subHeader,
                             ),
                             Expanded(child: CustomDivider(width: SystemTheme.width, height: SystemTheme.scale(0.5),color: AppColor.colorE8E9F3)),
                           ],
                         ),
                       ),
                       Padding(
                         padding: EdgeInsets.only(top: SystemTheme.scale(25)),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           mainAxisSize: MainAxisSize.min,
                           children: [
                             const CustomCheckbox(enabled : false),
                             AppText(title: 'Last payment date',
                               fontSize: 11,
                               font: 'Medium',
                               mLeft: SystemTheme.scale(15),
                               textColor: AppColor.lightGrey2,
                             ),
                           ],
                         ),
                       ),
                       CupertinoButton(
                         onPressed: () {
                           _openDatePicker(context);
                         },
                         padding: const EdgeInsets.all(0),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             AppText(title: '4 August 2021',
                               fontSize: 16,
                               font: FontEnum.GMedium.toString(),
                               pTop: SystemTheme.scale(16), mBottom: SystemTheme.scale(10),
                               textColor: AppColor.subHeader,
                             ),
                             ImageUtil.assetSvg(assetName: AssetUtils.iconCalendar, width: SystemTheme.scale(15),
                                 height: SystemTheme.scale(15.35), fit: BoxFit.cover)
                           ],
                         ),
                       ),
                       CustomDivider(pTop: 5,width: SystemTheme.width, height: SystemTheme.scale(0.5),color: AppColor.colorE8E9F3),
                       AppText(title: 'Description',
                         fontSize: 14,
                         font: FontEnum.GMedium.toString(),
                         mTop: SystemTheme.scale (22),
                         textColor: AppColor.lightGrey2,
                       ),
                       AppText(title: 'Creating this month\'s payment plan for mum',
                         fontSize: 16,
                         font: FontEnum.GMedium.toString(),
                         pTop: SystemTheme.scale(20),
                         textColor: AppColor.subHeader,
                       ),
                       CustomDivider(pTop: 15,width: SystemTheme.width, height: SystemTheme.scale(0.5),color: AppColor.colorE8E9F3),
                     ],
                   ),
                  ),
                ],
              ),
            ),
          ),

          SwipeButton(
            key: model.sliderKey,
            text: "Swipe To Schedule",
            height: 50,
            width: UIUtils.width(context),
            textColor: AppColor.white,
            fontSize: 15, letterSpacing: 2,
            onSubmit: () {
              model.sliderKey.currentState?.reset();
              Navigator.pushNamed(context, RoutePaths.verifyOtp);
            },
          ),
        ],
      ),
    );

  }

  _openDatePicker(context){
    showSynergyDatePicker(
      context: context,
      confirmText: 'Save',
      cancelText: 'Cancel',
      initialDate: DateTime.now(),
      lastDate: DateTime.now(),
      firstDate: DateTime(1900),
    );
  }
}
