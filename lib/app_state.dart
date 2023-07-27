import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _LoggedOn = prefs.getBool('ff_LoggedOn') ?? _LoggedOn;
    });
    _safeInit(() {
      _PolicyID = prefs.getInt('ff_PolicyID') ?? _PolicyID;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _EmailLogin = false;
  bool get EmailLogin => _EmailLogin;
  set EmailLogin(bool _value) {
    _EmailLogin = _value;
  }

  bool _PassLogin = false;
  bool get PassLogin => _PassLogin;
  set PassLogin(bool _value) {
    _PassLogin = _value;
  }

  bool _LoggedOn = false;
  bool get LoggedOn => _LoggedOn;
  set LoggedOn(bool _value) {
    _LoggedOn = _value;
    prefs.setBool('ff_LoggedOn', _value);
  }

  int _PolicyID = 1;
  int get PolicyID => _PolicyID;
  set PolicyID(int _value) {
    _PolicyID = _value;
    prefs.setInt('ff_PolicyID', _value);
  }

  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? _value) {
    _date = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
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
