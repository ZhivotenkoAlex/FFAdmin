import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

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
      _bills = prefs.getStringList('ff_bills')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _bills;
    });
    _safeInit(() {
      _filteredCompanies =
          prefs.getStringList('ff_filteredCompanies')?.map((x) {
                try {
                  return jsonDecode(x);
                } catch (e) {
                  print("Can't decode persisted json. Error: $e.");
                  return {};
                }
              }).toList() ??
              _filteredCompanies;
    });
    _safeInit(() {
      _startRangeDate = prefs.containsKey('ff_startRangeDate')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_startRangeDate')!)
          : _startRangeDate;
    });
    _safeInit(() {
      _endRangeDate = prefs.containsKey('ff_endRangeDate')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_endRangeDate')!)
          : _endRangeDate;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _appToken = '';
  String get appToken => _appToken;
  set appToken(String value) {
    _appToken = value;
  }

  List<dynamic> _bills = [];
  List<dynamic> get bills => _bills;
  set bills(List<dynamic> value) {
    _bills = value;
    prefs.setStringList('ff_bills', value.map((x) => jsonEncode(x)).toList());
  }

  void addToBills(dynamic value) {
    _bills.add(value);
    prefs.setStringList('ff_bills', _bills.map((x) => jsonEncode(x)).toList());
  }

  void removeFromBills(dynamic value) {
    _bills.remove(value);
    prefs.setStringList('ff_bills', _bills.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromBills(int index) {
    _bills.removeAt(index);
    prefs.setStringList('ff_bills', _bills.map((x) => jsonEncode(x)).toList());
  }

  void updateBillsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    _bills[index] = updateFn(_bills[index]);
    prefs.setStringList('ff_bills', _bills.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInBills(int index, dynamic value) {
    _bills.insert(index, value);
    prefs.setStringList('ff_bills', _bills.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _filteredCompanies = [];
  List<dynamic> get filteredCompanies => _filteredCompanies;
  set filteredCompanies(List<dynamic> value) {
    _filteredCompanies = value;
    prefs.setStringList(
        'ff_filteredCompanies', value.map((x) => jsonEncode(x)).toList());
  }

  void addToFilteredCompanies(dynamic value) {
    _filteredCompanies.add(value);
    prefs.setStringList('ff_filteredCompanies',
        _filteredCompanies.map((x) => jsonEncode(x)).toList());
  }

  void removeFromFilteredCompanies(dynamic value) {
    _filteredCompanies.remove(value);
    prefs.setStringList('ff_filteredCompanies',
        _filteredCompanies.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromFilteredCompanies(int index) {
    _filteredCompanies.removeAt(index);
    prefs.setStringList('ff_filteredCompanies',
        _filteredCompanies.map((x) => jsonEncode(x)).toList());
  }

  void updateFilteredCompaniesAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    _filteredCompanies[index] = updateFn(_filteredCompanies[index]);
    prefs.setStringList('ff_filteredCompanies',
        _filteredCompanies.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInFilteredCompanies(int index, dynamic value) {
    _filteredCompanies.insert(index, value);
    prefs.setStringList('ff_filteredCompanies',
        _filteredCompanies.map((x) => jsonEncode(x)).toList());
  }

  String _activeCompanyID = '';
  String get activeCompanyID => _activeCompanyID;
  set activeCompanyID(String value) {
    _activeCompanyID = value;
  }

  DateTime? _startRangeDate;
  DateTime? get startRangeDate => _startRangeDate;
  set startRangeDate(DateTime? value) {
    _startRangeDate = value;
    value != null
        ? prefs.setInt('ff_startRangeDate', value.millisecondsSinceEpoch)
        : prefs.remove('ff_startRangeDate');
  }

  DateTime? _endRangeDate;
  DateTime? get endRangeDate => _endRangeDate;
  set endRangeDate(DateTime? value) {
    _endRangeDate = value;
    value != null
        ? prefs.setInt('ff_endRangeDate', value.millisecondsSinceEpoch)
        : prefs.remove('ff_endRangeDate');
  }

  String _lastBillId = '';
  String get lastBillId => _lastBillId;
  set lastBillId(String value) {
    _lastBillId = value;
  }

  String _firstBillId = '';
  String get firstBillId => _firstBillId;
  set firstBillId(String value) {
    _firstBillId = value;
  }

  bool _isMarkedCheckboxActive = false;
  bool get isMarkedCheckboxActive => _isMarkedCheckboxActive;
  set isMarkedCheckboxActive(bool value) {
    _isMarkedCheckboxActive = value;
  }

  int _pageNumber = 1;
  int get pageNumber => _pageNumber;
  set pageNumber(int value) {
    _pageNumber = value;
  }

  String _lastCompanyId = '';
  String get lastCompanyId => _lastCompanyId;
  set lastCompanyId(String value) {
    _lastCompanyId = value;
  }

  String _firstCompanyId = '';
  String get firstCompanyId => _firstCompanyId;
  set firstCompanyId(String value) {
    _firstCompanyId = value;
  }

  List<dynamic> _companyNameList = [];
  List<dynamic> get companyNameList => _companyNameList;
  set companyNameList(List<dynamic> value) {
    _companyNameList = value;
  }

  void addToCompanyNameList(dynamic value) {
    _companyNameList.add(value);
  }

  void removeFromCompanyNameList(dynamic value) {
    _companyNameList.remove(value);
  }

  void removeAtIndexFromCompanyNameList(int index) {
    _companyNameList.removeAt(index);
  }

  void updateCompanyNameListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    _companyNameList[index] = updateFn(_companyNameList[index]);
  }

  void insertAtIndexInCompanyNameList(int index, dynamic value) {
    _companyNameList.insert(index, value);
  }

  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  set startDate(DateTime? value) {
    _startDate = value;
  }

  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  set endDate(DateTime? value) {
    _endDate = value;
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
