import 'package:domain/constants/enum/text_variant.dart';
import 'package:synergy/base/base_page.dart';
import 'package:synergy/di/home/home_module.dart';
import 'package:synergy/feature/home/home_page_view.dart';
import 'package:synergy/feature/home/home_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synergy/ui/molecules/custom_floating_action_button.dart';
import 'package:synergy/ui/molecules/footer.dart';
import 'package:synergy/ui/molecules/header.dart';
import 'package:synergy/utils/asset_utils.dart';
import 'package:synergy/utils/theme/color_scheme.dart';


class HomePage extends BasePage<HomePageViewModel> {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends BaseStatefulPage<HomePageViewModel, HomePage> {

  @override
  Color? get backgroundColor => AppColor.lightGreyEFEFEF;

  @override
  Color? get statusBarColor => AppColor.lightGreyEFEFEF;

  @override
  ProviderBase provideBase() {
    return homeViewModelProvider;
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return Header(title: 'Home', font: FontEnum.GBold.toString(), fontSize: 20,
      leadingIcon: AssetUtils.iconMenu ,onLeadingClick: (){},);
  }

  @override
  Widget? buildBottomNavigationBar() => Footer(onPressed: (index) {},);


  @override
  Widget? floatingActionButton() => CustomFloatingActionButton(onPressed: (){},);


  @override
  Widget buildView(BuildContext context, HomePageViewModel model) {
    return HomePageView(provideBase());
  }
}
