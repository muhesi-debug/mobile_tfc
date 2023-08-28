import 'package:apisaissai/authentification/register.dart';
import 'package:apisaissai/colors/color.dart';
import 'package:apisaissai/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Drawbles dra= Drawbles();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: redColorTextTitre,
        title: const Text("Moto TV"),
        centerTitle: true,
      ),

      // Drawble
      drawer: dra.drawer(context),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("bienvenue Chez nous",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),)

            ],
          ),
        ),
      ),
      );
  }
}
