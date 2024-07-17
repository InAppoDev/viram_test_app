import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final GlobalKey _globalKey = GlobalKey();
  final GlobalKey _currentStep = GlobalKey();

  late final Size _stepSize;
  late final Size _daySize;
  late final Offset _dayPosition;

  int _currentStepIndex = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _stepSize = getSize(_currentStep.currentContext!);
        _daySize = getSize(_globalKey.currentContext!);
        _dayPosition = getOffset(_globalKey.currentContext!);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'MaisonNeue',
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset('viram_logo.png'),
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
          children: [
            Positioned.fill(child: Image.asset('bg.png')),
            AnimatedPositioned(
              top: _dayPosition.dy + _daySize.height + 8,
              right: 16 + _currentStepIndex == 0
                  ? 0
                  : screenSize.width - 16 - _stepSize.width,
              curve: Curves.decelerate,
              duration: const Duration(seconds: 1),
              child: _stepOne(),
            ),
            AnimatedPositioned(
              top: _dayPosition.dy + _daySize.height + 8,
              right: 16 + _currentStepIndex == 1
                  ? 0
                  : screenSize.width - 16 - _stepSize.width,
              curve: Curves.decelerate,
              duration: const Duration(seconds: 1),
              child: _stepOne(),
            ),
            AnimatedPositioned(
              top: _dayPosition.dy + _daySize.height + 8,
              right: 16 + _currentStepIndex == 2
                  ? 0
                  : screenSize.width - 16 - _stepSize.width,
              curve: Curves.decelerate,
              duration: const Duration(seconds: 1),
              child: _stepOne(),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  _day0(),
                  _day1(),
                  _day2(),
                  _day2(),
                  _day2(),
                  _day2(),
                  _day2(),
                  _day2(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _day1() {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      margin: EdgeInsets.only(bottom: _stepSize.height + 8),
      key: _globalKey,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Dzień 1',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Text(
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
          const SizedBox(width: 58),
          GridView.builder(
            itemCount: 30,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) => Container(
              height: 5,
              width: 5,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF1F1E7),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _day0() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Wprowadzenie',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Color(0xFF2C2C2C),
            ),
          ),
          Text(
            '100%',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              height: 16 / 12,
              color: Color(0xFF959595),
            ),
          )
        ],
      ),
    );
  }

  Widget _day2() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0x2C2C2C1A),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Dzień 2',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Color(0xFF2C2C2C),
            ),
          ),
          Text(
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
    );
  }

  Widget _stepOne() {
    return Container(
      key: _currentStep,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
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
                'Ustaw dzień rozpoczęcia',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  height: 16 / 12,
                  color: Colors.white,
                ),
              ),
              Text(
                '1/3',
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
          Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 20.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _currentStepIndex = 1;
                  });
                },
                child: const Text(
                  'Jutro',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    height: 13 / 12,
                    color: Color(0xFF2C2C2C),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 20.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _currentStepIndex = 1;
                  });
                },
                child: const Text(
                  'Pojutrze',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    height: 13 / 12,
                    color: Color(0xFF2C2C2C),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 24.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _currentStepIndex = 1;
                  });
                },
                child: const Text(
                  'Najbliższy poniedziałek',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    height: 13 / 12,
                    color: Color(0xFF2C2C2C),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _stepTwo() {
    return Container(
      key: _currentStep,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
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
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(.1),
                    padding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _currentStepIndex = 0;
                    });
                  },
                  child: Icon(Icons.keyboard_backspace, color: Colors.white,size: 16,),
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
                  onPressed: () {
                    setState(() {
                      _currentStepIndex = 2;
                    });
                  },
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
                  onPressed: () {
                    setState(() {
                      _currentStepIndex = 1;
                    });
                  },
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
                  onPressed: () {
                    setState(() {
                      _currentStepIndex = 1;
                    });
                  },
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
    );
  }



  Size getSize(BuildContext context) {
    final box = context.findRenderObject() as RenderBox;
    return box.size;
  }

  Offset getOffset(BuildContext context) {
    RenderBox box = context.findRenderObject() as RenderBox;
    return box.localToGlobal(Offset.zero);
  }
}
