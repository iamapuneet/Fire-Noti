import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';


class ButtonModel {
  final String key;
  final String label;
  final Color? color;
  final String? icon;
  final ActionType actionType;
  final bool autoDismissible;
  final bool enabled;
  final bool requireInputText;
  final bool showInCompactView;
  final bool isDangerousOption;

  ButtonModel({
    required this.key,
    required this.label,
    this.color,
    this.icon,
      this.actionType= ActionType.Default,
    this.autoDismissible = true,
    this.enabled = true,
    this.requireInputText = false,
    this.showInCompactView = true,
    this.isDangerousOption = false,
  });


}

enum ButtonType {
  simpleText,
  message,
  custom,
}