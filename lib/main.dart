import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:viram_test_app/widgets/day_widget.dart';
import 'package:viram_test_app/widgets/step_one_widget.dart';
import 'package:viram_test_app/widgets/step_three_widget.dart';
import 'package:viram_test_app/widgets/step_two_widget.dart';

// Test values
const Curve baseCurve = Curves.easeInOut;
const Duration baseDuration = Duration(milliseconds: 500);
const Size triangleSize = Size(34, 19.5);

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final List<GlobalKey> _stepsKeys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  final List<GlobalKey> _daysKeys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  final List<Size> _stepSizes = [];
  final List<Size> _daysSizes = [];
  final List<Offset> _daysPositions = [];

  int _currentStepIndex = 0;
  final int _currentDayIndex = 0;
  bool isShow = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 100));
      setState(() {
        for (var key in _stepsKeys) {
          _stepSizes.add(_getSize(key.currentContext!));
        }

        for (var key in _daysKeys) {
          _daysPositions.add(_getOffset(key.currentContext!));
          _daysSizes.add(_getSize(key.currentContext!));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);

    List<Widget> steps = [
      StepOneWidget(
        onForwardTap: _onForwardTap,
        key: _stepsKeys[0],
      ),
      StepTwoWidget(
        onBackTap: _onBackTap,
        onForwardTap: _onForwardTap,
        key: _stepsKeys[1],
      ),
      StepThreeWidget(
        onBackTap: _onBackTap,
        key: _stepsKeys[2],
      ),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'MaisonNeue',
      ),
      home: Scaffold(
        body: Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                foregroundColor: Colors.white,
                forceMaterialTransparency: true,
                elevation: 0,
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 7),
                      child: Image.asset(
                        'assets/images/viram_logo.png',
                        height: 26.49,
                        width: 97.2,
                      ),
                    ),
                    const SizedBox(width: 14.8),
                    const Text(
                      'Week',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Color(0xFF2C2C2C),
                      ),
                    ),
                  ],
                ),
              ),
              body: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/bg.png',
                  ),
                  SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          _wprowadzenieWidget(),
                          for (var i = 0; i < _daysKeys.length; i++)
                            DayWidget(
                              dayNumber: i + 1,
                              isCurrent: i == _currentDayIndex,
                              key: _daysKeys[i],
                              space: _stepSizes.isEmpty
                                  ? 0
                                  : _stepSizes[_currentStepIndex].height + 16,
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AnimatedPositioned(
              top: _daysPositions.isEmpty || _daysSizes.isEmpty
                  ? 0
                  : _daysPositions[_currentDayIndex].dy +
                      _daysSizes[_currentDayIndex].height +
                      8,
              onEnd: () {
                setState(() {
                  isShow = true;
                });
              },
              right: screenSize.width * (_currentStepIndex - 2),
              curve: baseCurve,
              duration: baseDuration,
              child: AnimatedOpacity(
                duration: baseDuration,
                curve: baseCurve,
                opacity: isShow ? 1 : 0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: steps,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _wprowadzenieWidget() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0, 16.0),
      margin: const EdgeInsets.only(bottom: 8.0),
      width: 184.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Wprowadzenie',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Color(0xFF2C2C2C),
            ),
          ),
          const SizedBox(height: 2),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SvgPicture.asset('assets/icons/check.svg'),
              const SizedBox(width: 6.0),
              const Text(
                '100%',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  height: 16 / 12,
                  color: Color(0xFF959595),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Size _getSize(BuildContext context) {
    final box = context.findRenderObject() as RenderBox;
    return box.size;
  }

  Offset _getOffset(BuildContext context) {
    RenderBox box = context.findRenderObject() as RenderBox;
    return box.localToGlobal(Offset.zero);
  }

  void _onForwardTap() {
    setState(() {
      _currentStepIndex++;
    });
  }

  void _onBackTap() {
    setState(() {
      _currentStepIndex--;
    });
  }
}
