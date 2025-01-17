import 'package:flutter/material.dart';

import '../models/answer_model.dart';

class AnswerTile extends StatelessWidget {
  const AnswerTile({
    super.key,
    required this.selectedAnswer,
    required this.option,
    required this.onTap,
  });

  final String? selectedAnswer;
  final AnswerModel option;
  final void Function()? onTap;
  final selectedColor = const Color(0xff8B88EF);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: const Color(0xff232A2E),
          borderRadius: BorderRadius.circular(16),
          border: selectedAnswer == option.option
              ? Border.all(
                  color: selectedColor,
                  width: 2,
                )
              : null,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 25,
              height: 25,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selectedAnswer == option.option
                    ? selectedColor
                    : Colors.transparent,
                border: selectedAnswer == option.option
                    ? null
                    : Border.all(
                        color: const Color(0xffC4C4C4),
                        width: 1,
                      ),
              ),
              child: Text(
                option.option,
                style: TextStyle(
                  color: selectedAnswer == option.option
                      ? const Color(0xFFF5F5F5)
                      : const Color(0xffC4C4C4),
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                option.answer,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xffC4C4C4),
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}