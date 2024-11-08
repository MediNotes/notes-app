import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes/components/toolbar/size_picker.dart';
import 'package:notes/data/tools/_tool.dart';
import 'package:notes/data/tools/highlighter.dart';
import 'package:notes/data/tools/pen.dart';
import 'package:notes/data/tools/pencil.dart';
import 'package:notes/data/tools/shape_pen.dart';
import 'package:notes/i18n/strings.g.dart';

class PenModal extends StatefulWidget {
  const PenModal({
    super.key,
    required this.getTool,
    required this.setTool,
  });

  final Tool Function() getTool;
  final void Function(Pen) setTool;

  @override
  State<PenModal> createState() => _PenModalState();
}

class _PenModalState extends State<PenModal> {
  @override
  Widget build(BuildContext context) {
    final Tool currentTool = widget.getTool();
    final Pen currentPen;
    if (currentTool is Pen) {
      currentPen = currentTool;
    } else {
      return const SizedBox();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizePicker(
          pen: currentPen,
        ),
        if (currentPen is! Highlighter && currentPen is! Pencil) ...[
          const SizedBox(width: 8),
          IconButton(
            onPressed: () => setState(() {
              widget.setTool(Pen.fountainPen());
            }),
            style: TextButton.styleFrom(
              foregroundColor: Pen.currentPen.icon == Pen.fountainPenIcon
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.onSurface,
              backgroundColor: Pen.currentPen.icon == Pen.fountainPenIcon
                  ? Theme.of(context).colorScheme.secondary.withOpacity(0.1)
                  : Colors.transparent,
              shape: const CircleBorder(),
            ),
            tooltip: t.editor.pens.fountainPen,
            icon: SvgPicture.asset(
              'assets/images/scribble_fountain.svg',
              width: 32,
              height: 32 / 508 * 374,
              theme: SvgTheme(
                currentColor: Pen.currentPen.icon == Pen.fountainPenIcon
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          IconButton(
            onPressed: () => setState(() {
              widget.setTool(Pen.ballpointPen());
            }),
            style: TextButton.styleFrom(
              foregroundColor: Pen.currentPen.icon == Pen.ballpointPenIcon
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.onSurface,
              backgroundColor: Pen.currentPen.icon == Pen.ballpointPenIcon
                  ? Theme.of(context).colorScheme.secondary.withOpacity(0.1)
                  : Colors.transparent,
              shape: const CircleBorder(),
            ),
            tooltip: t.editor.pens.ballpointPen,
            icon: SvgPicture.asset(
              'assets/images/scribble_ballpoint.svg',
              width: 32,
              height: 32 / 508 * 374,
              theme: SvgTheme(
                currentColor: Pen.currentPen.icon == Pen.ballpointPenIcon
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          IconButton(
            onPressed: () => setState(() {
              widget.setTool(ShapePen());
            }),
            style: TextButton.styleFrom(
              foregroundColor: Pen.currentPen.icon == ShapePen.shapePenIcon
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.onSurface,
              backgroundColor: Pen.currentPen.icon == ShapePen.shapePenIcon
                  ? Theme.of(context).colorScheme.secondary.withOpacity(0.1)
                  : Colors.transparent,
              shape: const CircleBorder(),
            ),
            tooltip: t.editor.pens.shapePen,
            icon: const FaIcon(ShapePen.shapePenIcon),
          ),
        ],
      ],
    );
  }
}
