library homeview;

import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:ar_test_project/routes/main_index.dart';
import 'package:stacked/stacked.dart';

part 'package:ar_test_project/screens/home/body/home_body.dart';

class HomeView extends StatelessWidget {
  static const routeName = "home_view";
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, _) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
          title: const Text('Anchors & Objects on Planes'),
        ),
          body: const _HomeViewBody(),
        ),
      ),
      onModelReady: (model) => model.onInit(context),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
