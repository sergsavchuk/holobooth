import 'package:flutter/material.dart';
import 'package:photobooth_ui/photobooth_ui.dart';

/// {@template gradient_outlined_button}
/// A widget that uses a [Stack] to construct an [OutlinedButton.icon]
/// with a gradient border.
/// {@endtemplate}
class GradientOutlinedButton extends StatelessWidget {
  /// {@macro gradient_outlined_button}
  const GradientOutlinedButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
  });

  /// Called when the button is pressed.
  final VoidCallback onPressed;

  /// The icon for the button.
  final Icon icon;

  /// The label for the button.
  final Widget label;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OutlinedButton.icon(
          onPressed: onPressed,
          icon: ShaderMask(
            shaderCallback: (bounds) {
              return const LinearGradient(
                colors: [
                  Color(0xFFEFBDCF),
                  Color(0xFF9E81EF),
                ],
              ).createShader(Offset.zero & bounds.size);
            },
            child: icon,
          ),
          label: label,
          style: OutlinedButton.styleFrom(side: BorderSide.none),
        ),
        Positioned.fill(
          child: IgnorePointer(
            child: ShaderMask(
              shaderCallback: (bounds) {
                return const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    HoloBoothColors.pink,
                    HoloBoothColors.purple,
                  ],
                ).createShader(Offset.zero & bounds.size);
              },
              child: const Material(
                color: Colors.transparent,
                shape: StadiumBorder(
                  side: BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}