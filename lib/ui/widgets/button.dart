import 'package:bytebank_app/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';
import '../styles/button_styles.dart';

class Button extends StatelessWidget {
  final ButtonStyle style;
  final TextStyle labelStyle;
  final String label;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;
  final bool outline;

  // ignore: prefer_const_constructors_in_immutables
  Button(
      {super.key,
      required this.style,
      required this.labelStyle,
      required this.label,
      this.width,
      this.height,
      this.onPressed,
      this.outline = false});

  Button.primary({
    super.key,
    required this.label,
    this.width,
    this.height,
    this.onPressed,
  })  : style = ButtonStyles.i.primaryButton,
        labelStyle = TextStyles.i.textSecondaryFontExtraBold,
        outline = false;

  @override
  Widget build(BuildContext context) {
    final labelText = Text(
      label,
      style: labelStyle,
      overflow: TextOverflow.ellipsis,
    );
    return SizedBox(
      width: width,
      height: height,
      child: outline
          ? OutlinedButton(onPressed: onPressed, style: style, child: labelText)
          : ElevatedButton(
              onPressed: onPressed, style: style, child: labelText),
    );
  }
}
