library sliderview;

import 'package:flutter/material.dart';
import 'package:ar_test_project/routes/main_index.dart';
import 'package:stacked/stacked.dart';

part 'package:ar_test_project/screens/slider-test/body/slider_body.dart';

class SliderView extends StatelessWidget {
  static const routeName = "slider_view";
  const SliderView({Key? key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SliderViewModel>.reactive(
      builder: (context, model, _) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Slider View'),
          ),
          body: const _SliderViewBody(),
        ),
      ),
      onModelReady: (model) => model.onInit(context),
      viewModelBuilder: () => SliderViewModel(),
    );
  }
}
