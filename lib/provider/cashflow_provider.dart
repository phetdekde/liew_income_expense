import 'package:flutter/material.dart';
import 'package:flutter_test_2/model/category.dart';

class CashFlow extends ChangeNotifier {
  double _incToday = 0;
  double get incToday => _incToday;

  double _expToday = 0;
  double get expToday => _expToday;

  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  //1
  List<Category> _incWorkingList = [];
  List<Category> get incWorkingList => _incWorkingList;
  double _incWorking = 0;
  double get incWorking => _incWorking;
  //2
  List<Category> _incAssetList = [];
  List<Category> get incAssetList => _incAssetList;
  double _incAsset = 0;
  double get incAsset => _incAsset;
  //3
  List<Category> _incOtherList = [];
  List<Category> get incOtherList => _incOtherList;
  double _incOther = 0;
  double get incOther => _incOther;
  //4
  List<Category> _expInconsistencyList = [];
  List<Category> get expInconsistencyList => _expInconsistencyList;
  double _expInconsistency = 0;
  double get expInconsistency => _expInconsistency;
  //5
  List<Category> _expConsistencyList = [];
  List<Category> get expConsistencyList => _expConsistencyList;
  double _expConsistency = 0;
  double get expConsistency => _expConsistency;
  //6
  List<Category> _expSavInvList = [];
  List<Category> get expSavInvList => _expSavInvList;
  double _expSavInv = 0;
  double get expSavInv => _expSavInv;

  List<Category> _catList = [];
  List<Category> get catList => _catList;

  void setIncToday(double value) {
    _incToday = value;
    notifyListeners();
  }

  void setExpToday(double value) {
    _expToday = value;
    notifyListeners();
  }

  void setPageIndex() {
    if (_pageIndex == 0) {
      _pageIndex = 1;
    } else {
      _pageIndex = 0;
    }
    notifyListeners();
  }

  void setIncWorking(double value) {
    _incWorking = value;
    notifyListeners();
  }

  void setIncAsset(double value) {
    _incAsset = value;
    notifyListeners();
  }

  void setIncOther(double value) {
    _incOther = value;
    notifyListeners();
  }

  void setExpInconsistency(double value) {
    _expInconsistency = value;
    notifyListeners();
  }

  void setExpConsistency(double value) {
    _expConsistency = value;
    notifyListeners();
  }

  void setExpSavInv(double value) {
    _expSavInv = value;
    notifyListeners();
  }

  void setCatList(List<Category> value) {
    _catList = value;
    notifyListeners();
  }

  void setCatType() {
    for (var item in _catList) {
      if (item.ftype == '1') {
        _incWorkingList.add(item);
      } else if (item.ftype == '2') {
        _incAssetList.add(item);
      } else if (item.ftype == '3') {
        _incOtherList.add(item);
      } else if (item.ftype == '4') {
        _expInconsistencyList.add(item);
      } else if (item.ftype == '5') {
        _expConsistencyList.add(item);
      } else if (item.ftype == '6') {
        _expSavInvList.add(item);
      }
    }
    notifyListeners();
  }
}
