import 'package:domain/constants/error_types.dart';
import 'package:domain/model/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synergy/base/base_page.dart';
import 'package:synergy/feature/splash/splash_page_viewmodel.dart';
import 'package:synergy/main/navigation/route_paths.dart';
import 'package:synergy/utils/img_util.dart';
import 'package:synergy/ui/stream_builder/app_stream_builder.dart';
import 'package:synergy/ui/ui_utils.dart';
import 'package:synergy/utils/asset_utils.dart';
import 'package:synergy/utils/resource.dart';
import 'package:synergy/utils/status.dart';

/// This is Scaffold body of the SplashPage.
class SplashPageView extends BasePageViewWidget<SplashPageViewModel> {
  const SplashPageView(ProviderBase model, {Key? key}) : super(model, key: key);


  @override
  Widget build(BuildContext context, model) {
    return AppStreamBuilder<Resource<User>>(
      initialData: Resource.none(),
      stream: model.currentUser,
      onData: (data) async {
        if (data.status == Status.SUCCESS) {
          if (data.data?.isLoggedIn == true) {
            Navigator.pushReplacementNamed(context, RoutePaths.home);
          } else {
            Navigator.pushReplacementNamed(context, RoutePaths.home);
          }
        } else if (data.status == Status.ERROR) {
          switch (data.appError?.type) {
            case ErrorType.DB_USER_NOT_FOUND:
                Navigator.pushReplacementNamed(context, RoutePaths.home);
              break;
            default:
              break;
          }
        }
      },
      dataBuilder: (context, data) {
        return SizedBox(
          width: UIUtils.width(context),
          height: UIUtils.height(context),
          child: Center(
              child: Hero(tag: 'logo',
              child: ImageUtil.assetPng(name: AssetUtils.iconUserDefaultPng,)),
          ),
        );
      },
    );
  }
}
