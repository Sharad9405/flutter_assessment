import 'package:synergy/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synergy/di/schedule/schedule_modules.dart';
import 'package:synergy/feature/schedule/schedule_page_view.dart';
import 'package:synergy/feature/schedule/schedule_page_viewmodel.dart';
import 'package:synergy/ui/molecules/header.dart';
import 'package:synergy/utils/theme/color_scheme.dart';

class SchedulePage extends BasePage<SchedulePageViewModel> {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  SchedulePageState createState() => SchedulePageState();
}

class SchedulePageState extends BaseStatefulPage<SchedulePageViewModel, SchedulePage> {

  @override
  Color? get backgroundColor => AppColor.colorF9FAFB;
  @override
  Color? get statusBarColor => AppColor.colorF9FAFB;


  @override
  ProviderBase provideBase() => scheduleViewModelProvider;


  @override
  PreferredSizeWidget? buildAppbar() {
    return Header(title: 'Regular Payment', backgroundColor: AppColor.colorF9FAFB, fontSize: 18, onLeadingClick: () => Navigator.pop(context));
  }

  @override
  Widget buildView(BuildContext context, SchedulePageViewModel model) {
    return SchedulePageView(provideBase());
  }
}
