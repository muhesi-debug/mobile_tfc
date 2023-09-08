class MovieModel {
  String? imageAsset;
  String? movieName;
  String? movieRating;
  String? year;
  List <Map>? cast;
  List <Map>? comments;

  // Le constructeur 
  MovieModel({
    this.imageAsset,
    this.movieName,
    this.movieRating,
    this.year,
    this.cast,
    this.comments
  });
}

  //data
 final forYouImages=[
    MovieModel(imageAsset: "images/logo.jpg"),
    MovieModel(imageAsset: "images/logo.jpg"),
    MovieModel(imageAsset: "images/logo.jpg"),
   ];


    final  popularImages=[
    MovieModel(
      imageAsset: "images/logo.jpg",
      movieName: "Muhesi muyisa",
      cast: [
        {
          "name":"muyisa",
          "role":"paul gobert",
          "image":"images/logo.jpg",
        },
        {
          "name":"muyisa",
          "role":"paul gobert",
          "image":"images/logo.jpg",
        },
        {
          "name":"muyisa",
          "role":"paul gobert",
          "image":"images/logo.jpg",
        },
        {
          "name":"muyisa",
          "role":"paul gobert",
          "image":"images/logo.jpg",
        },

      ],
      comments: [
        {
          "name":"Moto tv",
          "imageUrl":"images/Moto.PNG",
          "date":"Juin 15, 2023",
          "rating":"5.0",
          "comment":"Je suis vraiment fier de cette inovation que nous amène la moto tv, je suis sincèrement reconnessant.",
        },
        {
          "name":"Moto tv",
          "imageUrl":"images/1.jpg",
          "date":"Juin 15, 2023",
          "rating":"5.0",
          "comment":"Je suis vraiment fier de cette inovation que nous amène la moto tv, je suis sincèrement reconnessant.",
        },
        {
          "name":"Moto tv",
          "imageUrl":"images/logo.jpg",
          "date":"Juin 15, 2023",
          "rating":"5.0",
          "comment":"Je suis vraiment fier de cette inovation que nous amène la moto tv, je suis sincèrement reconnessant.",
        },
        {
          "name":"Moto tv",
          "imageUrl":"images/1.jpg",
          "date":"Juin 15, 2023",
          "rating":"5.0",
          "comment":"Je suis vraiment fier de cette inovation que nous amène la moto tv, je suis sincèrement reconnessant.",
        },
      ],
      year: "2023",
      movieRating: "8.3"),
      MovieModel(
        imageAsset: "images/1.jpg",
        movieName: "Gift",
        year: "2023",
        movieRating: "6.4",
      ),
      MovieModel(
        imageAsset: "images/Moto.PNG",
        movieName: "Gift",
        year: "2023",
        movieRating: "6.4",
      ),
      MovieModel(
        imageAsset: "images/1.jpg",
        movieName: "Gift",
        year: "2023",
        movieRating: "6.4",
      ),
      MovieModel(
        imageAsset: "images/Uac.PNG",
        movieName: "Gift",
        year: "2023",
        movieRating: "6.4",
      ),
      MovieModel(
        imageAsset: "images/1.jpg",
        movieName: "Gift",
        year: "2023",
        movieRating: "6.4",
      ),
   ];

   final legendaryImages=[
    MovieModel(
        imageAsset: "images/Moto.PNG",
        movieName: "Gift",
        year: "2023",
        movieRating: "6.4",
      ),
      MovieModel(
        imageAsset: "images/1.jpg",
        movieName: "Gift",
        year: "2023",
        movieRating: "6.4",
      ),
      MovieModel(
        imageAsset: "images/Uac.PNG",
        movieName: "Gift",
        year: "2023",
        movieRating: "6.4",
      ),
      MovieModel(
        imageAsset: "images/1.jpg",
        movieName: "Gift",
        year: "2023",
        movieRating: "6.4",
      ),

   ];
   final genresList=[
    MovieModel(movieName: "Muhesi",imageAsset: "images/1.jpg"),
    MovieModel(movieName: "Muhesi",imageAsset: "images/Moto.PNG"),
    MovieModel(movieName: "Muhesi",imageAsset: "images/Uac.PNG"),
    MovieModel(movieName: "Muhesi",imageAsset: "images/Moto.PNG"),
    MovieModel(movieName: "Muhesi",imageAsset: "images/1.jpg"),
   ];

