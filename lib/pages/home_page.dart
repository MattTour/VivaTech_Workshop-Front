import 'package:flutter/material.dart';

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
      child: SizedBox(
        width: 380,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/Logo_vivatech.png'),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Text(
                "Viva Technology is Europe's biggest startup and tech event. The seventh edition will take place June 14-17, 2023, in Paris, at Expo Porte de Versailles.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Image.asset('assets/lead-the-future.jpg'),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Text(
                "VivaTech accelerates innovation by connecting startups, tech leaders, major corporations and investors responding to our world’s biggest challenges.  This is where business meets innovation.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Image.asset('assets/startup-paradise.jpg'),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Text(
                "VivaTech organizes Europe’s biggest technology and startup event each year, over four exciting days in Paris.  We unite the most disruptive topics in tech, rule-breaking entrepreneurs, and the world’s largest technology breakthroughs, building an ecosystem where business gets done.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Text(
                "VivaTech is a global community including thousands of visionary startups, investors, organizations, corporations, researchers, media, and talent.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
