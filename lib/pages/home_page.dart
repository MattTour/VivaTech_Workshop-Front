import 'package:flutter/material.dart';

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/Logo_vivatech.png'),
            Text("Viva Technology is Europe's biggest startup and tech event. The seventh edition will take place June 14-17, 2023, in Paris, at Expo Porte de Versailles.",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            Image.asset('assets/lead-the-future.jpg'),
            Text("VivaTech accelerates innovation by connecting startups, tech leaders, major corporations and investors responding to our world’s biggest challenges.  This is where business meets innovation.",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Image.asset('assets/startup-paradise.jpg'),
            Text("VivaTech organizes Europe’s biggest technology and startup event each year, over four exciting days in Paris.  We unite the most disruptive topics in tech, rule-breaking entrepreneurs, and the world’s largest technology breakthroughs, building an ecosystem where business gets done.",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Text("VivaTech is a global community including thousands of visionary startups, investors, organizations, corporations, researchers, media, and talent.",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      )
    );
  }
}