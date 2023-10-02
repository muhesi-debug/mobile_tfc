import 'dart:convert';

import 'package:apisaissai/admin/actions/adminHome.dart';
import 'package:apisaissai/authentification/controls/loading.dart';
import 'package:apisaissai/authentification/models/membreModels.dart';
import 'package:apisaissai/colors/color.dart';
import 'package:apisaissai/home/homePage.dart';
import 'package:apisaissai/main.dart';
import 'package:apisaissai/widgets/fieldText.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import '../message_push/view/generateNot.dart';
import 'controls/encrypt.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

 // Les variables 
  String erreurs="";
  bool _loading=false;

  // Les instance de la classe Custom
  CustomFieldeText txtEmail = CustomFieldeText(
    title: "Email",
    placeholder: "Entrez votre adresse mail",
  );
  CustomFieldeText txtPass= CustomFieldeText(
    title: 'Mot de passe',
    placeholder: '*************',
    isPass: true
  );

  // La clé du formulaire 
  final _key=GlobalKey<FormState>();


    // La connexion 
  void login(String email,String password) async{
    // Initialisation de la variable 
    setState(() {
          erreurs="";
          _loading=true;
        });
    final Uri url=Uri.parse("http://g3ig-kmuhesi.uaclab.net/php/connexion.php");
    final response=await http.post(url,body: {
      "email":encrypt(email),
      "pass":encrypt(password)
    });
    if (response.statusCode==200) {
      var data=jsonDecode(decrypt(response.body));
      // print(data);
      var result=data['resultat'];
      int success=result[1];
      if (success==1) {
        //print(result[3]);
        // On passe à la partie concernée 
        setState(() {
          erreurs=result[0];
          MembreModels.savedUser(MembreModels.fromJson(result[2]));
          _loading=false;
          //Récupération des éléménts 
          //UserModels.savedUser(UserModels.fromJson(result[2]));
          //widget.login.call();
          var route=MaterialPageRoute(builder: ((context) => HomePage()));
                  Navigator.push(context, route);
          print(result[2]);
        });
      }else{
        setState(() {
          erreurs=result[0];
          _loading=false;
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return _loading?Loading():Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  const Text(
                    "S'authentifier",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: redColorTextTitre),
                  ),
                  const SizedBox(height: 20,),
                  txtEmail.textFormField(),
                  const SizedBox(height: 10,),
                  txtPass.textFormField(),
                  const SizedBox(height: 10,),
                  ElevatedButton(
                        child: const Text("Enregistrer",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: redColorTextTitre,
                          minimumSize: const Size.fromHeight(45)
                          
                        ),
                         onPressed: (){
                         
                         if (_key.currentState!.validate()) {
                          if (txtEmail.value=="admin@gmail.com" && txtPass.value=="admin") {
                            // Appel de la partie de l'admin de l'apk
                            var route=MaterialPageRoute(builder: ((context) => const HomeAdminPage()));
                              Navigator.push(context, route);
                            
                          }else{
                            login(txtEmail.value, txtPass.value);
                          }
                        }
                          
                         }, ),
                         Text(erreurs,textAlign: TextAlign.center,style: const TextStyle(color: redColorTextTitre,fontSize: 15,fontWeight: FontWeight.bold),)
            
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
