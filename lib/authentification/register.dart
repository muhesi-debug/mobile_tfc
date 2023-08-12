import 'package:apisaissai/colors/color.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(30),

              // Le formulaire d'enregistrement
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Créer compte Membre",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold),
                ),
          
          
                // Button 
                 ElevatedButton(
                      child: const Text("Enregistrer"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: redColorTextTitre,
                        minimumSize: const Size.fromHeight(40)
                        
                      ),
                       onPressed: (){
                        // if (_key.currentState!.validate()) {
                        //   if (txtPass.value==txtPassConf.value) {
                        //     register(txtNom.value, txtPostNom.value, txtEmail.value, txtAdresse.value, txtPhone.value, txtPass.value);
                        //   }else{
                        //     print("echouer");
                        //   }
                        // }
                        
                       }, ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
