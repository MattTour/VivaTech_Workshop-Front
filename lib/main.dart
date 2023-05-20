import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vivatech_workshop/pages/home_page.dart';
import 'package:vivatech_workshop/pages/jeu_page.dart';
import 'package:vivatech_workshop/pages/profile_page.dart';
import 'package:vivatech_workshop/pages/salon_page.dart';

void main() {
  runApp(MyAppVivaTech());
}

class MyAppVivaTech extends StatelessWidget {
  const MyAppVivaTech({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'VivaTechApp',
        theme: ThemeData(
          fontFamily: 'MuseoSans',
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {

}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// Création classe privée _MyHomePageState()
class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = ProfilePage();
        break;
      case 2:
        page = SalonPage();
        break;
      case 3:
        page = JeuPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.face), 
              label: 'Profile'),
            BottomNavigationBarItem(
                icon: Icon(Icons.compass_calibration_outlined), 
                label: 'Salon'),
            BottomNavigationBarItem(
                icon: Icon(Icons.gamepad_outlined), 
                label: 'Jeu'),
          ],
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
        ),
      );
    });
  }
}
