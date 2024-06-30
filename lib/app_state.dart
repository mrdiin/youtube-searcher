import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
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
  set searchResults(List<dynamic> value) {
    _searchResults = value;
  }

  void addToSearchResults(dynamic value) {
    searchResults.add(value);
  }

  void removeFromSearchResults(dynamic value) {
    searchResults.remove(value);
  }

  void removeAtIndexFromSearchResults(int index) {
    searchResults.removeAt(index);
  }

  void updateSearchResultsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    searchResults[index] = updateFn(_searchResults[index]);
  }

  void insertAtIndexInSearchResults(int index, dynamic value) {
    searchResults.insert(index, value);
  }

  String _initialSearch = 'flutterflow';
  String get initialSearch => _initialSearch;
  set initialSearch(String value) {
    _initialSearch = value;
    prefs.setString('ff_initialSearch', value);
  }

  List<dynamic> _searchRefinements = [];
  List<dynamic> get searchRefinements => _searchRefinements;
  set searchRefinements(List<dynamic> value) {
    _searchRefinements = value;
  }

  void addToSearchRefinements(dynamic value) {
    searchRefinements.add(value);
  }

  void removeFromSearchRefinements(dynamic value) {
    searchRefinements.remove(value);
  }

  void removeAtIndexFromSearchRefinements(int index) {
    searchRefinements.removeAt(index);
  }

  void updateSearchRefinementsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    searchRefinements[index] = updateFn(_searchRefinements[index]);
  }

  void insertAtIndexInSearchRefinements(int index, dynamic value) {
    searchRefinements.insert(index, value);
  }

  List<String> _history = ['flutterflow', 'that thing'];
  List<String> get history => _history;
  set history(List<String> value) {
    _history = value;
    prefs.setStringList('ff_history', value);
  }

  void addToHistory(String value) {
    history.add(value);
    prefs.setStringList('ff_history', _history);
  }

  void removeFromHistory(String value) {
    history.remove(value);
    prefs.setStringList('ff_history', _history);
  }

  void removeAtIndexFromHistory(int index) {
    history.removeAt(index);
    prefs.setStringList('ff_history', _history);
  }

  void updateHistoryAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    history[index] = updateFn(_history[index]);
    prefs.setStringList('ff_history', _history);
  }

  void insertAtIndexInHistory(int index, String value) {
    history.insert(index, value);
    prefs.setStringList('ff_history', _history);
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
