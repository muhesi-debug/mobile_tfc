  // Enregistrement de l'utilisateur dans la base de données mysql
  void register(String nom,String postnom,String email,String adresse,String telephon){

    // Initialisation de variable
    // setState(() {
    //   erreurs="";
    //   _loading=true;
    // });
    // final Uri uri = Uri.parse("https://satem-cannon.000webhostapp.com/article/register.php");
    // final response= await http.post(uri,body:{
    //   "nom":encrypt(nom),
    //   "postnom":encrypt(postnom),
    //   "email":encrypt(email),
    //   "adresse":encrypt(adresse),
    //   "telephone":encrypt(telephon),
    //   "pass":encrypt(pass)
    // });
    // var data =jsonDecode(decrypt(response.body));
    // // print(data);
    // var result=data['resultat'];
    //   int success=result[1];
    //   if (success==1) {
    //     // On passe à la partie concernée 
    //     setState(() {
    //       erreurs=result[0];
    //       _loading=false;
    //     });
    //   }else{
    //     setState(() {
    //       erreurs=result[0];
    //       _loading=false;
    //     });
    //   }
  }