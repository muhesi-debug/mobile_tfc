import 'package:apisaissai/authentification/controls/controlRegister.dart';
import 'package:apisaissai/colors/color.dart';
import 'package:apisaissai/widgets/fieldText.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  // Appel des instance de la classe champs 
  CustomFieldeText txtNom= CustomFieldeText(
    title: 'Nom',
    placeholder: 'Entrez votre Nom',
  );
  CustomFieldeText txtPostnom= CustomFieldeText(
    title: "Postnom",
    placeholder: "Entrez votre Postnom"
  );
  CustomFieldeText txtEmail = CustomFieldeText(
    title: 'Email',
    placeholder: 'Entrez votre adresse mail'
  );
  CustomFieldeText txtAdresse = CustomFieldeText(
    title: 'Adresse',
    placeholder: 'Entrez votre Adresse'
  );
  CustomFieldeText txtPhone = CustomFieldeText(
    title: "Téléphone",
    placeholder: 'Entrez votre numéro de téléphone'
  );

  // La clé du formulaire
  final _key=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    // Affichages des érreurs 
    txtNom.erros="Entrez votre Nom svp";
    txtPostnom.erros="Entrez votre Postnom svp";
    txtAdresse.erros="Entrez votre Adresse svp";
    txtPhone.erros="Entrez votre Numéro de télephone svp";
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(30),

              // Le formulaire d'enregistrement
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Créer compte Membre",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10,),
                txtNom.textFormField(),
                const SizedBox(height: 10,),
                txtPostnom.textFormField(),
                const SizedBox(height: 10,),
                txtAdresse.textFormField(),
                const SizedBox(height: 10,),
                txtPhone.textFormField(),
                const SizedBox(height: 10,),
                // Button 
                 ElevatedButton(
                      child: const Text("Enregistrer",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: redColorTextTitre,
                        minimumSize: const Size.fromHeight(45)
                        
                      ),
                       onPressed: (){
                        if (_key.currentState!.validate()) {
                          register(txtNom.value,
                          txtPostnom.value, 
                          txtEmail.value, 
                          txtAdresse.value,
                          txtPhone.value);
                        }
                        
                       }, ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
