import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class Movie {
  Movie({this.movieName, this.isAnimated, this.rating});
  final String movieName;
  final bool isAnimated;
  final double rating;
}

List<Movie> AllMovies = [
  Movie(movieName: "Toy Story", isAnimated: true, rating: 4.0),
  Movie(movieName: "How to Train Your Dragon", isAnimated: true, rating: 4.0),
  Movie(movieName: "Hate Story", isAnimated: false, rating: 1.0),
  Movie(movieName: "Minions", isAnimated: true, rating: 4.0),
];

class HomePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<HomePage> {
  List<Movie> _AnimatedMovies = null;

  @override
  void initState() {
    super.initState();
    _AnimatedMovies = AllMovies.where((i) => i.isAnimated).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: _AnimatedMovies.length,
          itemBuilder: (BuildContext context, int index) {
            return SafeArea(
              child: Container(
                child: Center(
                  child: Text('${_AnimatedMovies[index].movieName}'),
                ),
              ),
            );
          }),
    );
  }
}
