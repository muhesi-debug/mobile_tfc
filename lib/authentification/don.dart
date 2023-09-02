import 'package:apisaissai/apiFile/apiSouscription.dart';
import 'package:apisaissai/authentification/models/membreModels.dart';
import 'package:apisaissai/authentification/models/souscriptionModel.dart';
import 'package:apisaissai/colors/color.dart';
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
  @override
  Widget build(BuildContext context) {
    // Les messages d'erreurs
    txtDesignation.erros = "Completer la designation";
    txtValeur.erros = "compléter la valeur";
    return Scaffold(
      body: Center(
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
                            if (resultat!=null && resultat[0]==true) {
                              setState(() {
                                dons=false;
                              });
                              Navigator.of(context).pop();
                            }else if(resultat!=null && resultat[0]==false){
                              setState(() {
                                dons=false;
                              });
                            }else{
                              setState(() {
                                dons=false;
                              });
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
