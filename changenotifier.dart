import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  var alllist = <WordPair>[];
  var Icons = <IconData>[];
  final GlobalKey<AnimatedListState> key = GlobalKey();

  void getNext() {
    current = WordPair.random();
    key.currentState
        ?.insertItem(0, duration: const Duration(milliseconds: 700));
    notifyListeners();
  }

  var favorites = <WordPair>[];
  var favicon = <IconData>[];
  void togglefavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}
