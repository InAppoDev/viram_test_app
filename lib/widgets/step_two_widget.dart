import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:viram_test_app/main.dart';
import 'package:viram_test_app/widgets/rounded_triangle_painter.dart';

class StepTwoWidget extends StatelessWidget {

  // Temporary variables
  final VoidCallback onBackTap;
  final VoidCallback onForwardTap;

  const StepTwoWidget({super.key, required this.onBackTap, required this.onForwardTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width - 32.0,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: const Color(0xFFE84646),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'O której chcesz rozpocząć dzień?',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        height: 16 / 12,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '2/3',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        height: 14.56 / 12,
                        color: Colors.white.withOpacity(.7),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 34),
                SizedBox(
                  height: 48.0,
                  child: Row(
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.white.withOpacity(.1),
                          padding: const EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onPressed: onBackTap,
                        child: SvgPicture.asset('assets/icons/back.svg'),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              vertical: 17.5, horizontal: 30.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onPressed: onForwardTap,
                        child: const Text(
                          '6:00',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            height: 13 / 12,
                            color: Color(0xFF2C2C2C),
                          ),
                        ),
                      ),
                      const SizedBox(width: 1),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              vertical: 17.5, horizontal: 30.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onPressed: onForwardTap,
                        child: const Text(
                          '7:00',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            height: 13 / 12,
                            color: Color(0xFF2C2C2C),
                          ),
                        ),
                      ),
                      const SizedBox(width: 1),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              vertical: 17.5, horizontal: 30.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onPressed: onForwardTap,
                        child: const Text(
                          '8:00',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            height: 13 / 12,
                            color: Color(0xFF2C2C2C),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: 65,
            top: -17,
            child: CustomPaint(
              size: triangleSize, // Define the size of the canvas
              foregroundPainter: RoundedTrianglePainter(),
            ),
          ),
        ],
      ),
    );
  }
}