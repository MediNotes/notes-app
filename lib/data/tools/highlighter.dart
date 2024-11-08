import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes/data/prefs.dart';
import 'package:notes/data/tools/_tool.dart';
import 'package:notes/data/tools/pen.dart';
import 'package:notes/i18n/strings.g.dart';

class Highlighter extends Pen {
  Highlighter()
      : super(
          name: t.editor.pens.highlighter,
          sizeMin: 10,
          sizeMax: 100,
          sizeStep: 10,
          icon: highlighterIcon,
          options: Prefs.lastHighlighterOptions.value,
          pressureEnabled: false,
          color: Colors.yellow.withAlpha(Highlighter.alpha),
          toolId: ToolId.highlighter,
        );

  static const int alpha = 100;

  static Pen currentHighlighter = Highlighter();

  static const IconData highlighterIcon = FontAwesomeIcons.highlighter;
}
