import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:vivatech_workshop/pages/jeu_page.dart';

class Stand {
  final int id;
  final String nom;
  final String description;
  final String localisation;
  final String nom_Entreprise;
  final String categorie;
  final String email;
  final String telephone;
  bool status;

  Stand(
      {required this.id,
      required this.nom,
      required this.description,
      required this.localisation,
      required this.nom_Entreprise,
      required this.categorie,
      required this.email,
      required this.telephone,
      this.status = false});

  factory Stand.fromJson(Map<String, dynamic> json) {
    return Stand(
        id: json['id'] as int,
        nom: json['Nom'] as String,
        description: json['Description'] as String,
        localisation: json['Localisation'] as String,
        nom_Entreprise: json['Nom_Entreprise'] as String,
        categorie: json['Catégorie'] as String,
        email: json['Email'] as String,
        telephone: json['Telephone'] as String,
        status: false);
  }
}

Future<List<Stand>> fetchStand(http.Client client, value) async {
  final response = await client
      .get(Uri.parse('http://vivatech.pari0039.mds-paris.yt/stand/categorie/$value'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseStand, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Stand> parseStand(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Stand>((json) => Stand.fromJson(json)).toList();
}

class SecondPage extends StatelessWidget {
  final Data data;
  SecondPage({required this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.value),
        flexibleSpace: Image(
          image: AssetImage('assets/gradient_vivatech.png'),
          fit: BoxFit.cover,
        ),
      ),
      body: FutureBuilder<List<Stand>>(
        future: fetchStand(http.Client(), data.value),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return StandListCat(stand: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color.fromARGB(255, 255, 255, 255),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.face, color: Color.fromARGB(255, 0, 0, 0)),
                label: 'Profile'),
            BottomNavigationBarItem(
                icon: Icon(Icons.compass_calibration_outlined,
                    color: Color.fromARGB(255, 0, 0, 0)),
                label: 'Salon'),
            BottomNavigationBarItem(
                icon: Icon(Icons.gamepad_outlined,
                    color: Color.fromARGB(255, 0, 0, 0)),
                label: 'Jeu'),
          ],
          currentIndex: 3,
          onTap: (value) {},
        ),
      ),
    );
  }
}

class StandListCat extends StatefulWidget {
  const StandListCat({super.key, required this.stand});

  final List<Stand> stand;

  @override
  State<StandListCat> createState() => _StandListCatState();
}

class _StandListCatState extends State<StandListCat> {
  int visitCount = 0;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 0,
        mainAxisExtent: 140,
      ),
      itemCount: widget.stand.length,
      itemBuilder: (context, index) {
        return Card(
          child: Column(children: [
            Text(widget.stand[index].nom,
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(widget.stand[index].description),
            Text('Stand :'),
            Text(widget.stand[index].localisation,
                style: TextStyle(fontWeight: FontWeight.bold)),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (widget.stand[index].status != true) {
                    visitCount += 1;
                    widget.stand[index].status = true;
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: widget.stand.length == visitCount
                      ? Color(0xFF74FF3D)
                      : widget.stand[index].status
                          ? Color(0xFF1AD1FF)
                          : Color(0xFFFF1A1A),
                  foregroundColor: Color(0xffffffff)),
              child: Text(
                widget.stand.length == visitCount
                    ? 'Bravo !'
                    : widget.stand[index].status
                        ? 'Visité !'
                        : 'Visiter',
              ),
            ),
          ]),
        );
      },
    );
  }
}
