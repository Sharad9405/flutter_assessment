import 'package:domain/constants/enum/text_variant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:synergy/base/base_page.dart';
import 'package:synergy/feature/verify_opt/verify_otp_page_viewmodel.dart';
import 'package:synergy/main/navigation/route_paths.dart';
import 'package:synergy/ui/molecules/app_text.dart';
import 'package:synergy/utils/theme/color_scheme.dart';
import 'package:synergy/utils/theme/system_theme.dart';

class VerifyOtpPageView extends BasePageViewWidget<VerifyOtpPageViewModel> {
  const VerifyOtpPageView(ProviderBase model, {Key? key}) : super(model, key: key);


  @override
  Widget build(BuildContext context, model) {
    return Container(
      color: AppColor.transparent,
      width: SystemTheme.width,
      margin: EdgeInsets.only(top: SystemTheme.scale(30)),
      height: SystemTheme.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppText(title: 'Enter 4-digit PIN',
            fontSize: 22, font: FontEnum.Gilroy.toString(),
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
            textColor: AppColor.header,
          ),

          SizedBox(height: SystemTheme.scale(100),),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: SystemTheme.scale(30)),
            child: PinCodeTextField(
              appContext: context,
              onCompleted: (value){
                Navigator.pushNamed(context, RoutePaths.paymentSetupSuccess);
              },
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                cursorColor: AppColor.colorDADADA,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(SystemTheme.scale(10)),
                  fieldHeight: SystemTheme.scale(50),
                  fieldWidth: SystemTheme.scale(50),
                  activeFillColor: AppColor.white,
                  borderWidth: 1,
                  activeColor: AppColor.green,
                  errorBorderColor: AppColor.colorDADADA,
                  inactiveColor: AppColor.colorDADADA,
                  selectedColor: AppColor.colorDADADA,
                ),
                autoDismissKeyboard: true,
                boxShadows: const [
                  BoxShadow(
                    color: AppColor.white,
                    spreadRadius: 0,
                    blurRadius: 3,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
                length: 4,
                onChanged: (value){}),
          ),
        ],
      ),
    );
  }
}
