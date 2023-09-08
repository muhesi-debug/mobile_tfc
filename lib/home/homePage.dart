import 'package:apisaissai/authentification/register.dart';
import 'package:apisaissai/colors/color.dart';
import 'package:apisaissai/widgets/drawer.dart';
import 'package:flutter/material.dart';

import '../authentification/models/membreModels.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Drawbles dra= Drawbles();



  bool connect=false;


   verificc() async{
    await MembreModels.getUser(); 
    if (MembreModels.sessionUser?.idMembre!=null) {
      setState(() {
        connect=true;
      });
    }
    else{
      setState(() {
        connect=false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    verificc();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: redColorTextTitre,
        title: const Text("Moto TV"),
        centerTitle: true,
      ),

      // Drawble
      drawer: connect?dra.connexion(context, MembreModels.sessionUser!.nom, MembreModels.sessionUser!.postnom, MembreModels.sessionUser!.email):dra.drawer(context),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('images/logo.jpg'),fit: BoxFit.contain)
            
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Text("bienvenue Chez nous",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),)

            ],
          ),
        ),
      ),
      );
  }
}
