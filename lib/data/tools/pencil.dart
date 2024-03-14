import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes/data/prefs.dart';
import 'package:notes/data/tools/_tool.dart';
import 'package:notes/data/tools/pen.dart';
import 'package:notes/i18n/strings.g.dart';

class Pencil extends Pen {
  Pencil()
      : super(
          name: t.editor.pens.pencil,
          sizeMin: 1,
          sizeMax: 15,
          sizeStep: 1,
          icon: pencilIcon,
          options: Prefs.lastPencilOptions.value,
          pressureEnabled: true,
          color: Color(Prefs.lastPencilColor.value),
          toolId: ToolId.pencil,
        );

  static Pencil currentPencil = Pencil();

  static const IconData pencilIcon = FontAwesomeIcons.pencil;
}
