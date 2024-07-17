import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
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
            
            SingleChildScrollView(
              child: Column(
                children: [
                  _day0(),
                  _day1(),
                  _day2(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _day1() {
    return Container(
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
}

Container _day2() {
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
    padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
    decoration: BoxDecoration(
      color: const Color(0xFFE84646),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Ustawianie dnia na jutro',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            height: 16 / 12,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          'Ustawianie godziny na 6:00',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            height: 16 / 12,
            color: Colors.white.withOpacity(.5),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          'Tworzenie konta',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            height: 16 / 12,
            color: Colors.white.withOpacity(.5),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          'Gotowe',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            height: 16 / 12,
            color: Colors.white.withOpacity(.5),
          ),
        ),
      ],
    ),
  );
}
