import 'package:flutter/material.dart';
import 'package:tally_mobile/generated/l10n.dart';

enum TaskUrgency {
  low,
  medium,
  high;

  String label(BuildContext context) {
    switch (this) {
      case TaskUrgency.low:
        return S.of(context).low;
      case TaskUrgency.medium:
        return S.of(context).medim;
      case TaskUrgency.high:
        return S.of(context).high;
    }
  }
}
