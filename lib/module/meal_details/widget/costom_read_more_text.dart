import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomReadMoreText extends StatefulWidget {
  const CustomReadMoreText({
    super.key,
    required this.text,
    this.maxLines = 2,
    this.style,
    this.linkStyle,
  });

  final String text;
  final int maxLines;
  final TextStyle? style;
  final TextStyle? linkStyle;

  @override
  State<CustomReadMoreText> createState() => _CostomReadMoreTextState();
}

class _CostomReadMoreTextState extends State<CustomReadMoreText> {
  bool _expanded = false;
  String _displayText = '';
  bool _isOverflowing = false;

  @override
  Widget build(BuildContext context) {
    final defaultStyle =
        widget.style ?? Theme.of(context).textTheme.bodyMedium!;
    final linkStyle =
        widget.linkStyle ??
        defaultStyle.copyWith(color: Colors.blue, fontWeight: FontWeight.bold);

    return LayoutBuilder(
      builder: (context, constraints) {
        final linkText = _expanded ? ' Show less' : ' Show more';

        final fullTextPainter = TextPainter(
          text: TextSpan(text: widget.text, style: defaultStyle),
          maxLines: widget.maxLines,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth);

        _isOverflowing = fullTextPainter.didExceedMaxLines;

        if (!_expanded && _isOverflowing) {
          _displayText = _trimTextToFit(
            text: widget.text,
            style: defaultStyle,
            maxLines: widget.maxLines,
            maxWidth: constraints.maxWidth,
            trailing: linkText,
          );
        } else {
          _displayText = widget.text;
        }

        return RichText(
          text: TextSpan(
            style: defaultStyle,
            children: [
              TextSpan(text: _displayText),
              if (_isOverflowing)
                TextSpan(
                  text: linkText,
                  style: linkStyle,
                  recognizer:
                      TapGestureRecognizer()
                        ..onTap =
                            () => setState(() {
                              _expanded = !_expanded;
                            }),
                ),
            ],
          ),
        );
      },
    );
  }

  String _trimTextToFit({
    required String text,
    required TextStyle style,
    required int maxLines,
    required double maxWidth,
    required String trailing,
  }) {
    int low = 0;
    int high = text.length;
    String result = text;

    while (low < high) {
      final mid = (low + high) ~/ 2;
      final candidate = text.substring(0, mid).trim() + trailing;

      final tp = TextPainter(
        text: TextSpan(text: candidate, style: style),
        maxLines: maxLines,
        textDirection: TextDirection.ltr,
      )..layout(maxWidth: maxWidth);

      if (tp.didExceedMaxLines) {
        high = mid;
      } else {
        result = text.substring(0, mid).trim();
        low = mid + 1;
      }
    }

    return result;
  }
}
