import 'package:flutter/material.dart';
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
      _initialSearch = prefs.getString('ff_initialSearch') ?? _initialSearch;
    });
    _safeInit(() {
      _history = prefs.getStringList('ff_history') ?? _history;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<dynamic> _searchResults = [];
  List<dynamic> get searchResults => _searchResults;
  set searchResults(List<dynamic> _value) {
    _searchResults = _value;
  }

  void addToSearchResults(dynamic _value) {
    _searchResults.add(_value);
  }

  void removeFromSearchResults(dynamic _value) {
    _searchResults.remove(_value);
  }

  void removeAtIndexFromSearchResults(int _index) {
    _searchResults.removeAt(_index);
  }

  void updateSearchResultsAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _searchResults[_index] = updateFn(_searchResults[_index]);
  }

  String _initialSearch = 'flutterflow';
  String get initialSearch => _initialSearch;
  set initialSearch(String _value) {
    _initialSearch = _value;
    prefs.setString('ff_initialSearch', _value);
  }

  List<dynamic> _searchRefinements = [];
  List<dynamic> get searchRefinements => _searchRefinements;
  set searchRefinements(List<dynamic> _value) {
    _searchRefinements = _value;
  }

  void addToSearchRefinements(dynamic _value) {
    _searchRefinements.add(_value);
  }

  void removeFromSearchRefinements(dynamic _value) {
    _searchRefinements.remove(_value);
  }

  void removeAtIndexFromSearchRefinements(int _index) {
    _searchRefinements.removeAt(_index);
  }

  void updateSearchRefinementsAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _searchRefinements[_index] = updateFn(_searchRefinements[_index]);
  }

  List<String> _history = ['flutterflow', 'flutter', 'dart'];
  List<String> get history => _history;
  set history(List<String> _value) {
    _history = _value;
    prefs.setStringList('ff_history', _value);
  }

  void addToHistory(String _value) {
    _history.add(_value);
    prefs.setStringList('ff_history', _history);
  }

  void removeFromHistory(String _value) {
    _history.remove(_value);
    prefs.setStringList('ff_history', _history);
  }

  void removeAtIndexFromHistory(int _index) {
    _history.removeAt(_index);
    prefs.setStringList('ff_history', _history);
  }

  void updateHistoryAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _history[_index] = updateFn(_history[_index]);
    prefs.setStringList('ff_history', _history);
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
