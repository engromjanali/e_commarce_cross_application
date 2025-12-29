import 'package:e_commarce_site/core/functions/f_printer.dart';
import 'package:flutter/material.dart';

extension ExBoxConstants on BoxConstraints {
  void printConstants({String? name}) {
    printer("""

                "MIN HEIGHT $minHeight",
                "MAX-HEIGHT $maxHeight",
                "MIN-WIDTH $minWidth",
                "MAX-WIDTH $maxWidth",
""");
  }
}
