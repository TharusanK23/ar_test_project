import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SliderViewModel extends BaseViewModel {
  late FixedExtentScrollController _scrollController = FixedExtentScrollController();
  late int _selected = 0;

  FixedExtentScrollController get scrollController => _scrollController;
  int get selected => _selected;

  void onInit(BuildContext context) {
    _scrollController = FixedExtentScrollController(initialItem: 3);
    _selected = 3;
    notifyListeners();
  }

  void onItemChanged(int i) {
    _selected = i;
    notifyListeners();
  }
}
