library homeview;

import 'package:flutter/material.dart';
import 'package:ar_test_project/routes/main_index.dart';

class Routes {
  Routes._();

  static final routes = <String, WidgetBuilder>{
    HomeView.routeName: (context) => const HomeView(),
    SliderView.routeName: (context) => const SliderView()
  };
}