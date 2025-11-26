import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _PizzaIndex = prefs.getInt('ff_PizzaIndex') ?? _PizzaIndex;
    });
    _safeInit(() {
      _selectedPizzaName =
          prefs.getString('ff_selectedPizzaName') ?? _selectedPizzaName;
    });
    _safeInit(() {
      _selectedPizzaPrice =
          prefs.getDouble('ff_selectedPizzaPrice') ?? _selectedPizzaPrice;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _PizzaIndex = 0;
  int get PizzaIndex => _PizzaIndex;
  set PizzaIndex(int value) {
    _PizzaIndex = value;
    prefs.setInt('ff_PizzaIndex', value);
  }

  bool _Optionsedit = false;
  bool get Optionsedit => _Optionsedit;
  set Optionsedit(bool value) {
    _Optionsedit = value;
  }

  bool _AddedtoCart = false;
  bool get AddedtoCart => _AddedtoCart;
  set AddedtoCart(bool value) {
    _AddedtoCart = value;
  }

  bool _AddedtoFavorite = false;
  bool get AddedtoFavorite => _AddedtoFavorite;
  set AddedtoFavorite(bool value) {
    _AddedtoFavorite = value;
  }

  LatLng? _userLocation;
  LatLng? get userLocation => _userLocation;
  set userLocation(LatLng? value) {
    _userLocation = value;
  }

  String _alertMessage = '';
  String get alertMessage => _alertMessage;
  set alertMessage(String value) {
    _alertMessage = value;
  }

  String _selectedPizzaName = '';
  String get selectedPizzaName => _selectedPizzaName;
  set selectedPizzaName(String value) {
    _selectedPizzaName = value;
    prefs.setString('ff_selectedPizzaName', value);
  }

  double _selectedPizzaPrice = 0.0;
  double get selectedPizzaPrice => _selectedPizzaPrice;
  set selectedPizzaPrice(double value) {
    _selectedPizzaPrice = value;
    prefs.setDouble('ff_selectedPizzaPrice', value);
  }

  double _deliveryFee = 5.0;
  double get deliveryFee => _deliveryFee;
  set deliveryFee(double value) {
    _deliveryFee = value;
  }

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;
  set totalPrice(double value) {
    _totalPrice = value;
  }

  String _decisaoSOS = '';
  String get decisaoSOS => _decisaoSOS;
  set decisaoSOS(String value) {
    _decisaoSOS = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
