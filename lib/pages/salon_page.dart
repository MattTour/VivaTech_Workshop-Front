import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Stand>> fetchStand(http.Client client) async {
  final response = await client
      .get(Uri.parse('http://vivatech.pari0039.mds-paris.yt/stand/'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsePhotos, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Stand> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Stand>((json) => Stand.fromJson(json)).toList();
}

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

class SalonPage extends StatelessWidget {
  const SalonPage({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Liste des stands';

    return const MaterialApp(
      title: appTitle,
      home: PlacePage(title: appTitle),
    );
  }
}

class PlacePage extends StatelessWidget {
  const PlacePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des stands'),
        flexibleSpace: Image(
          image: AssetImage('assets/gradient_vivatech.png'),
          fit: BoxFit.cover,
        ),
      ),
      body: FutureBuilder<List<Stand>>(
        future: fetchStand(http.Client()),
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
        childAspectRatio: 1.4,
        mainAxisExtent: 200,
      ),
      itemCount: stand.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(color: Color.fromARGB(255, 0, 0, 0)),
            color: Color.fromARGB(255, 205, 198, 198),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stand[index].nom.length <= 20
                      ? stand[index].nom
                      : '${stand[index].nom.substring(0, 20)}...',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                Divider(),
                Text(
                  'Description',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                Text(
                  stand[index].description.length <= 20
                      ? stand[index].description
                      : '${stand[index].description.substring(0, 20)}...',
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
                SizedBox(height: 4.0),
                Text(
                  'Catégorie',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                Text(
                  stand[index].categorie.length <= 20
                      ? stand[index].categorie
                      : '${stand[index].categorie.substring(0, 20)}...',
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
                SizedBox(height: 4.0),
                Divider(),
                Text(
                  'Contact',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stand[index].email.length <= 12
                          ? 'Email: ${stand[index].email}'
                          : 'Email: ${stand[index].email.substring(0, 12)}...',
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      stand[index].telephone.length <= 10
                          ? 'Téléphone: ${stand[index].telephone}'
                          : 'Téléphone: ${stand[index].telephone.substring(0, 10)}',
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
