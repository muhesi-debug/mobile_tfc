import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class MembreModels {
  String idMembre;
  String nom;
  String postnom;
  String email;
  String adresse;
  String telephone;
  

  // le constructeur
  MembreModels({this.idMembre="",this.nom="",this.postnom="",this.email="",this.adresse="",this.telephone=""});
  static   MembreModels? sessionUser=null;
  // Le constructeur qui retourne l'objet de la classe
  factory MembreModels.fromJson(Map<String,dynamic>i)=>MembreModels(
    idMembre: i['idMembre'],
    nom: i['nom'],
    postnom: i['postnom'],
    email: i['email'],
    adresse: i['adresse'],
    telephone: i['telephone']
  );

  // La fonction toMap qui va nous retourner les valeurs 
  Map<String,dynamic>toMap()=>{
    "idMembre":idMembre,
    "nom":nom,
    "postnom":postnom,
    "email":email,
    "adresse":adresse,
    "telephone":telephone
  };

  // l
  static Future savedUser(MembreModels user) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    var data=json.encode(user.toMap());
    pref.setString("user", data);
    pref.commit();
  }

  static Future getUser()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    try {
      var data=pref.getString("user");
    if (data!=null) {
      var decode=json.decode(data);
      var user=await MembreModels.fromJson(decode);
      sessionUser=user;
    }else{
      sessionUser=null;
    }
    // print(sessionUser!.email);

    }on SocketException{
      print("Vérifier votre connexion");
    }on FormatException{
      print("Format suppérieur");
    }
     catch (e) {
      print("erreur");
      
    }

  }

  // Deconnxion
  static Future isDeconnected()async{
    String nulls="";
    SharedPreferences p = await SharedPreferences.getInstance();
    p.setString("user", nulls);
    sessionUser=null;
    p.commit();
  }
}