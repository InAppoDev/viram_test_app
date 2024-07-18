import 'package:flutter/material.dart';
import 'package:viram_test_app/main.dart';

class DayWidget extends StatelessWidget {
  final double space;
  final bool isCurrent;
  final int dayNumber;

  const DayWidget({
    super.key,
    this.space = 0,
    required this.isCurrent,
    required this.dayNumber,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 184.0,
      duration: baseDuration,
      curve: baseCurve,
      margin: isCurrent
          ? EdgeInsets.only(bottom: space)
          : const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: isCurrent ? const Color(0xFF2C2C2C) : const Color(0x2C2C2C1A),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dzień $dayNumber',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: isCurrent ? Colors.white : const Color(0xFF2C2C2C),
                  ),
                ),
                const Text(
                  '0%',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    height: 16 / 12,
                    color: Color(0xFF959595),
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
          if (isCurrent)
            SizedBox(
              width: 35,
              child: Wrap(
                spacing: 1,
                runSpacing: 1,
                children: List.generate(
                  60,
                  (index) {
                    return Container(
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFFF1F1E7).withOpacity(.1),
                      ),
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
