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

  const Stand(
      {required this.id,
      required this.nom,
      required this.description,
      required this.localisation,
      required this.nom_Entreprise,
      required this.categorie,
      required this.email,
      required this.telephone});

  factory Stand.fromJson(Map<String, dynamic> json) {
    return Stand(
        id: json['id'] as int,
        nom: json['Nom'] as String,
        description: json['Description'] as String,
        localisation: json['Localisation'] as String,
        nom_Entreprise: json['Nom_Entreprise'] as String,
        categorie: json['Catégorie'] as String,
        email: json['Email'] as String,
        telephone: json['Telephone'] as String);
  }
}

Future<List<Stand>> fetchStand(http.Client client, value) async {
  final response = await client
      //Changer le numero du port en 5000 si besoin
      .get(Uri.parse('http://10.0.2.2:5000/stand/categorie/$value'));

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
      ),
      body: FutureBuilder<List<Stand>>(
        future: fetchStand(http.Client(), data.value),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return StandList(stand: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class StandList extends StatelessWidget {
  const StandList({super.key, required this.stand});

  final List<Stand> stand;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: stand.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListView(children: [
            Text(stand[index].nom,
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(stand[index].description),
            Text(stand[index].email),
            Text(stand[index].telephone),
            Text(stand[index].categorie)
          ]),
        );
      },
    );
  }
}
