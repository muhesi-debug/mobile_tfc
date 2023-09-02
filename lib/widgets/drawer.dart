import 'package:apisaissai/authentification/don.dart';
import 'package:apisaissai/authentification/login.dart';
import 'package:apisaissai/authentification/register.dart';
import 'package:apisaissai/colors/color.dart';
import 'package:apisaissai/home/homePage.dart';
import 'package:apisaissai/screens/youtube.dart';
import 'package:flutter/material.dart';

import '../authentification/models/membreModels.dart';





    // Vérification de la session de l'utilisateur 
  // isconnected()async{
  //    UserModels.getUser();
  //   if (UserModels.sessionUser==null) {
  //     setState(() {
  //       login=false;
  //     });
  //   }else{
  //     setState(() {
  //       login=true;
  //     });
  //   }
  // }



class Drawbles {
  Drawer drawer(BuildContext context){
    return Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("Muhesi Muyisa"),
              accountEmail: const Text("muhesimuyisa@gmail.com"),
              currentAccountPicture: GestureDetector(
                child: const CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person_pin,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: const BoxDecoration(color: redColorTextTitre),
            ),

            // Body
            InkWell(
              onTap: () {
                var route=MaterialPageRoute(builder: ((context) => HomePage()));
                  Navigator.push(context, route);
              },
              child: const ListTile(
                title: Text("Accueil"),
                leading: Icon(
                  Icons.home,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                var route=MaterialPageRoute(builder: ((context) => LancerMultimedia()));
                  Navigator.push(context, route);
              },
              child: const ListTile(
                title: Text("News"),
                leading: Icon(
                  Icons.tv,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text("Programme"),
                leading: Icon(
                  Icons.report,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                var route=MaterialPageRoute(builder: ((context) => OffreDon()));
                  Navigator.push(context, route);
              },
              child: const ListTile(
                title: Text("Souscription"),
                leading: Icon(
                  Icons.source_sharp,
                  color: Colors.red,
                ),
              ),
            ),

            const Divider(),
            InkWell(
              onTap: () {
                 var route=MaterialPageRoute(builder: ((context) => Register()));
                  Navigator.push(context, route);
              },
              child: const ListTile(
                title: Text("créer compte membre"),
                leading: Icon(
                  Icons.create,
                  color: Colors.black,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                 var route=MaterialPageRoute(builder: ((context) => Login()));
                  Navigator.push(context, route);
              },
              child: const ListTile(
                title: Text("Se connecter"),
                leading: Icon(
                  Icons.create,
                  color: Colors.black,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text("localisation"),
                leading: Icon(
                  Icons.local_taxi_sharp,
                  color: Colors.black,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text("Paramètre"),
                leading: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      );
  }
}