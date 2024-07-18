import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:viram_test_app/main.dart';
import 'package:viram_test_app/widgets/rounded_triangle_painter.dart';

class StepThreeWidget extends StatelessWidget {
  // Temporary variables
  final VoidCallback onBackTap;

  const StepThreeWidget({super.key, required this.onBackTap});

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
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      '3/3',
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size.fromWidth(double.maxFinite),
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                vertical: 17.5, horizontal: 30.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Kontynuuj z Facebookiem',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              height: 13 / 12,
                              color: Color(0xFF2C2C2C),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 4.0,
                          bottom: 4.0,
                          left: 4.0,
                          width: 40.0,
                          child: SvgPicture.asset('assets/icons/facebook.svg'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 1),
                    Stack(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            fixedSize: const Size.fromWidth(double.maxFinite),
                            padding: const EdgeInsets.symmetric(
                                vertical: 17.5, horizontal: 30.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Kontynuuj z Google',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              height: 13 / 12,
                              color: Color(0xFF2C2C2C),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 4.0,
                          bottom: 4.0,
                          left: 4.0,
                          width: 40.0,
                          child: SvgPicture.asset('assets/icons/google.svg'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 1),
                    Stack(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            fixedSize: const Size.fromWidth(double.maxFinite),
                            padding: const EdgeInsets.symmetric(
                                vertical: 17.5, horizontal: 30.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Kontynuuj z Apple',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              height: 13 / 12,
                              color: Color(0xFF2C2C2C),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 4.0,
                          bottom: 4.0,
                          left: 4.0,
                          width: 40.0,
                          child: SvgPicture.asset('assets/icons/apple.svg'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 1),
                  ],
                ),
                const SizedBox(height: 17.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding:
                        const EdgeInsets.symmetric(vertical: 17.5, horizontal: 30.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Zarejestruj się przez Email',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      height: 13 / 12,
                      color: Color(0xFF2C2C2C),
                    ),
                  ),
                ),
                const SizedBox(height: 17.0),
                SizedBox(
                  height: 48.0,
                  child: Row(
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(.1),
                          elevation: 0,
                          padding: const EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onPressed: onBackTap,
                        child: SvgPicture.asset('assets/icons/back.svg'),
                      ),
                      const SizedBox(width: 17.0),
                      Expanded(
                        child: Text.rich(
                          const TextSpan(
                              text: 'Tworząc konto, zgadzam się z ',
                              children: [
                                TextSpan(
                                  text: 'Regulaminem',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    height: 16 / 12,
                                    color: Colors.white,
                                  ),
                                ),
                                TextSpan(
                                  text: ' oraz ',
                                ),
                                TextSpan(
                                  text: 'Polityką Prywatności.',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    height: 16 / 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ]),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            height: 16 / 12,
                            color: Colors.white.withOpacity(.5),
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
