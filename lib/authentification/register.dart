import 'dart:convert';

import 'package:apisaissai/authentification/login.dart';
import 'package:apisaissai/colors/color.dart';
import 'package:apisaissai/widgets/fieldText.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'controls/encrypt.dart';

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
   CustomFieldeText txtpass = CustomFieldeText(
    title: "Mot de passe",
    placeholder: 'Entrez votre mot de passe'
  );

  // Variables 

  String erreurs="";
  bool _loading=false;
  bool visible=false;

  // La clé du formulaire
  final _key=GlobalKey<FormState>();


   // Enregistrement de l'utilisateur dans la base de données mysql
  void register(String nom,String postnom,String email,String adresse,String telephon,String pass)async{

    // Initialisation de variable
    setState(() {
      erreurs="";
      _loading=true;
    });
    final Uri uri = Uri.parse("http://g3ig-kmuhesi.uaclab.net/php/addMembre.php");
    final response= await http.post(uri,body:{
      "nom":encrypt(nom),
      "postnom":encrypt(postnom),
      "email":encrypt(email),
      "adresse":encrypt(adresse),
      "telephone":encrypt(telephon),
      "pass":encrypt(pass)
    });
    var data =jsonDecode(decrypt(response.body));
    // print(data);
    var result=data['data'];
      int success=result[1];
      if (success==1) {
        // On passe à la partie concernée 
        setState(() {
          erreurs="";
          _loading=false;
          var route=MaterialPageRoute(builder: ((context) => Login()));
          Navigator.push(context, route);

        });
        // var route=MaterialPageRoute(builder: ((context) => Login()));
        //   Navigator.push(context, route);
      }else{
        setState(() {
          erreurs=result[0];
          _loading=false;
        });
      }
  }
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
                txtEmail.textFormField(),
                const SizedBox(height: 10,),
                txtPhone.textFormField(),
                const SizedBox(height: 10,),
                txtpass.textFormField(),
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
                          txtPhone.value,txtpass.value);
                        }
                        
                       }, ),
                       const SizedBox(height: 10,),
                       Text(erreurs,textAlign: TextAlign.center,style: const TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 15),)
              ],
            ),
          ),
        )),
      ),
    );
  }
}
