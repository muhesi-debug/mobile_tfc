import 'package:apisaissai/authentification/register.dart';
import 'package:apisaissai/colors/color.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: redColorTextTitre,
        title: const Text("Moto TV"),
        centerTitle: true,
      ),

      // Drawble
      drawer: Drawer(
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
              onTap: () {},
              child: const ListTile(
                title: Text("Accueil"),
                leading: Icon(
                  Icons.home,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
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
              onTap: () {},
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
      ),
    );
  }
}
