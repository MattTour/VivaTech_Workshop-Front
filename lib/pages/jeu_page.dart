import 'package:flutter/material.dart';
import 'package:vivatech_workshop/pages/stand_by_categorie_page.dart';

class Data {
  final String value;

  Data({required this.value});
}

class JeuPage extends StatelessWidget {

final data = Data(
  value: ''
);

  @override
  Widget build(BuildContext context) {
    return Padding(  
            padding: EdgeInsets.all(10),  
            child: Column( 
              children: [
                ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage(
                          data: Data(value: 'Robotique'),
                  )),
                );
                },
                child: const Text('Robotique'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage(
                          data: Data(value: 'Embarquer'),
                  )),
                );
                },
                child: const Text('Embarquer'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage(
                          data: Data(value: 'IA'),
                  )),
                );
                },
                child: const Text('Intelligence Artificielle'),
              )
            ]
            )
    );
    
  }
} 