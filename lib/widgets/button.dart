import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  final double borderRadius;
  final double? width;
  final double? height;
  final bool isOutlined;

  const CustomButton({
    super.key,
    this.text,
    this.icon,
    required this.onPressed,
    this.color,
    this.textColor,
    this.borderRadius = 12,
    this.width,
    this.height,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = color ?? Theme.of(context).colorScheme.primary;
    final txtColor = textColor ?? Colors.white;

    return SizedBox(
      width: width,
      height: height ?? 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isOutlined ? Colors.transparent : bgColor,
          foregroundColor: txtColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: isOutlined
                ? BorderSide(color: bgColor, width: 2)
                : BorderSide.none,
          ),
          elevation: isOutlined ? 0 : 3,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Padding(
                padding: EdgeInsets.only(right: text != null ? 8.0 : 0),
                child: FaIcon(
                  icon,
                  color: txtColor,
                  size: 20,
                ),
              ),
            if (text != null)
              Text(
                text!,
                style: TextStyle(
                  color: txtColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
