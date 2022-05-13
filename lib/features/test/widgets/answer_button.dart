import 'package:flutter/material.dart';
import 'package:personality/config/core_styles.dart';

class ToggleButton extends StatelessWidget {
  const ToggleButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.isSelected,
      required this.number})
      : super(key: key);

  final void Function() onPressed;
  final String text;
  final String number;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: Border.all(width: 0.4, color: Colors.white)),
        child: Row(
          children: [
            Text(
              number,
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  color: isSelected ? CoreStyles.black : Colors.white),
            ),
            const SizedBox(width: 12),
            Flexible(
              child: Text(
                text,
                style: Theme.of(context).textTheme.button?.copyWith(
                    color: isSelected ? CoreStyles.black : Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
