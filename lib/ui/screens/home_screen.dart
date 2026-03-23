import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/services/api_service.dart';
import 'package:netflix_clone/utils/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie>? movies;

  @override
  void initState() {
    super.initState();
    getMovies();
  }

  void getMovies() {
    ApiService().getPopularMovies(pageNumber: 1).then((movieList) {
      setState(() {
        movies = movieList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        leading: Image.asset('assets/images/netflix_logo_2.png'),
        backgroundColor: kBackgroundColor,
      ),
      body: ListView(
        children: [
          Container(
            height: 500,
            //color: Colors.red,
            child: movies == null || movies?[0].posterPath == null
                ? SizedBox()
                : Image.network(movies![0].posterURL()!, fit: BoxFit.cover),
          ),
          const SizedBox(height: 16),
          Text(
            'Tendance actuelle',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  width: 110,
                  //color: Colors.yellow,
                  child: movies == null
                      ? Center(child: Text(index.toString()))
                      : movies?[index].posterPath != null
                      ? Image.network(
                          movies![index].posterURL()!,
                          fit: BoxFit.cover,
                        )
                      : SizedBox(),
                );
              },
            ),
          ),

          const SizedBox(height: 24),
          Text(
            'Actuellement au cinéma',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 320,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  width: 220,
                  color: Colors.blue,
                  child: Center(child: Text(index.toString())),
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Bientôt disponibles',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  width: 110,
                  color: Colors.green,
                  child: Center(child: Text(index.toString())),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
