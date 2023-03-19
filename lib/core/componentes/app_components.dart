import 'package:flutter/material.dart';

class AppComponents {
  static Widget rowColumnBuilder({
    required bool condition,
    required List<Widget> children,
  }) {
    switch (condition) {
      case true:
        {
          return SingleChildScrollView(
            child: Column(
              children: children,
            ),
          );
        }
      default:
        {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          );
        }
    }
  }

  static Widget expandedBuilder({
    required bool condition,
    required Widget child,
  }) {
    switch (condition) {
      case false:
        {
          return child;
        }
      default:
        {
          return Expanded(child: child);
        }
    }
  }
}
