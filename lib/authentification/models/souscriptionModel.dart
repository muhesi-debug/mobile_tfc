class SouscriptionModel {
  String? designation;
  String? valeur;
  String? membre;
  String? id_souscrption,datesouscription;
  SouscriptionModel({this.designation,this.valeur,this.membre,this.id_souscrption,this.datesouscription});

  // Methode
  factory SouscriptionModel.fromJson(Map<String,dynamic>j){
    return SouscriptionModel(
      membre:j['membre'],
      designation: j['designation'],
      valeur: j['valeur'],
      datesouscription: j['dateSouscription'],
      id_souscrption:j['id_souscrption']
    );
  }

  // La methode 
  Map toMap(){
    return{
      "membre":membre,
      "id_souscrption":id_souscrption,
      "designation":designation,
      "valeur":valeur
    };
  }
}