import 'package:apisaissai/colors/color.dart';
import 'package:apisaissai/widgets/fieldText.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

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
  @override
  Widget build(BuildContext context) {
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
                          // if (_key.currentState!.validate()) {
                          //   register(txtNom.value,
                          //   txtPostnom.value, 
                          //   txtEmail.value, 
                          //   txtAdresse.value,
                          //   txtPhone.value);
                          // }
                          
                         }, ),
            
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
