import 'package:flutter/material.dart';
import 'package:notes/components/canvas/save_indicator.dart';
import 'package:notes/data/prefs.dart';
import 'package:notes/i18n/strings.g.dart';
import 'package:notes/pages/editor/editor.dart';

class Whiteboard extends StatelessWidget {
  const Whiteboard({super.key});

  static const String filePath = '/_whiteboard';

  static bool needsToAutoClearWhiteboard =
      Prefs.autoClearWhiteboardOnExit.value;

  static final _whiteboardKey =
      GlobalKey<EditorState>(debugLabel: 'whiteboard');

  static SavingState? get savingState =>
      _whiteboardKey.currentState?.savingState.value;
  static void triggerSave() {
    final editorState = _whiteboardKey.currentState;
    if (editorState == null) return;
    assert(editorState.savingState.value == SavingState.waitingToSave);
    editorState.saveToFile();
    editorState.snackBarNeedsToSaveBeforeExiting();
  }

  @override
  Widget build(BuildContext context) {
    return Editor(
      key: _whiteboardKey,
      path: filePath,
      customTitle: t.home.titles.whiteboard,
    );
  }
}
