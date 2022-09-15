import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:synergy/base/base_page_view_model.dart';

class SchedulePageViewModel extends BasePageViewModel {
  final PublishSubject<String> _appVersionResponse = PublishSubject();

  Stream<String> get appVersionStream => _appVersionResponse.stream;
  final BehaviorSubject<bool> _isUserLoggedIn = BehaviorSubject.seeded(false);
  Stream<bool> get isUserLoggedIn => _isUserLoggedIn.stream;
  final GlobalKey<SlideActionState> sliderKey = GlobalKey();


  @override
  void dispose() {
    _appVersionResponse.close();
    super.dispose();
  }
}
