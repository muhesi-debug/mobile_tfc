import 'package:apisaissai/apiFile/apiSouscription.dart';
import 'package:apisaissai/authentification/controls/loading.dart';
import 'package:apisaissai/authentification/models/membreModels.dart';
import 'package:apisaissai/authentification/models/souscriptionModel.dart';
import 'package:apisaissai/colors/color.dart';
import 'package:apisaissai/home/homePage.dart';
import 'package:apisaissai/widgets/fieldText.dart';
import 'package:flutter/material.dart';

class OffreDon extends StatefulWidget {
  const OffreDon({super.key});

  @override
  State<OffreDon> createState() => _OffreDonState();
}

class _OffreDonState extends State<OffreDon> {


  // L'instance de la classe postModel

   SouscriptionModel monDons=SouscriptionModel();
    bool dons=false;
  // Les instance de la classe Custom
  CustomFieldeText txtDesignation = CustomFieldeText(
    title: "Designation",
    placeholder: "Entrez la designation",
  );
  CustomFieldeText txtValeur = CustomFieldeText(
      title: 'Valeur', placeholder: 'Ajouter la valeur du dont');

  // La clé du formulaire
  final _key = GlobalKey<FormState>();
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
    // Les messages d'erreurs
    txtDesignation.erros = "Completer la designation";
    txtValeur.erros = "compléter la valeur";
    return Scaffold(
      body: dons?Loading():Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  const Text(
                    "Souscription",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: redColorTextTitre),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  txtDesignation.textFormField(),
                  const SizedBox(
                    height: 10,
                  ),
                  txtValeur.textFormField(),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    child: const Text(
                      "Enregistrer",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: redColorTextTitre,
                        minimumSize: const Size.fromHeight(45)),
                    onPressed: () async {
                      setState(() {
                        dons=true;
                      });
                      if (_key.currentState!.validate()) {
                          // Add dans la bases de données 
                          monDons.designation=txtDesignation.value;
                          monDons.valeur=txtValeur.value;
                          monDons.membre=MembreModels.sessionUser!.idMembre;
                            var resultat=await Api.addSouscription(monDons.toMap());
                            if (resultat?[0]==true) {
                              setState(() {
                                dons=false;
                              });
                              
                            }else if(resultat!=null && resultat[0]==false){
                              setState(() {
                                dons=false;
                                print(MembreModels.sessionUser!.idMembre);
                              });
                            }else{
                              setState(() {
                                dons=false;
                              });
                              //print(MembreModels.sessionUser!.idMembre);
                              var route=MaterialPageRoute(builder: ((context) => HomePage()));
                              Navigator.push(context, route);
                            }
                          }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



// Avec notification 
class DialogAlert extends StatefulWidget {
  const DialogAlert({super.key});

  @override
  State<DialogAlert> createState() => _DialogAlertState();
}

// Reponse 
enum reposne{OUI,NON}

class _DialogAlertState extends State<DialogAlert> {

  

  @override

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          child: Text("Souscrre"),
          onTap: (){},
        ),
      ),
    );
  }
}

