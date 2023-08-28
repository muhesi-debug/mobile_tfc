import 'package:apisaissai/colors/color.dart';
import 'package:apisaissai/widgets/fieldText.dart';
import 'package:flutter/material.dart';

class OffreDon extends StatefulWidget {
  const OffreDon({super.key});

  @override
  State<OffreDon> createState() => _OffreDonState();
}

class _OffreDonState extends State<OffreDon> {
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
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        print(txtDesignation.value);
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