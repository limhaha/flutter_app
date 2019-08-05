import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class StartPageModel with ChangeNotifier {

  Color mainColor = Color.fromRGBO(231, 21, 97, 1);
  String _subjectNumber = '';

  final myController = TextEditingController();
  FocusNode focus = new FocusNode();

  @override
  void dispose() {
    myController.dispose();
    focus.dispose();
    super.dispose();
  }

  getText() => _subjectNumber;

  isFocused() {
    // ignore: unrelated_type_equality_checks
    if (focus.hasFocus) return mainColor;
    // ignore: unrelated_type_equality_checks
    if (!focus.hasFocus) return Color.fromRGBO(213, 213, 213, 1);
  }
}
