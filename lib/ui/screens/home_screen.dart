import 'package:flutter/material.dart';
import 'package:netflix_clone/repositories/data_repository.dart';
import 'package:netflix_clone/ui/widgets/movie_card.dart';
import 'package:netflix_clone/ui/widgets/movie_category.dart';
import 'package:netflix_clone/utils/constant.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataRepository>(context);

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
            child: dataProvider.popularMovieList.isEmpty
                ? SizedBox()
                : MovieCard(movie: dataProvider.popularMovieList.first),
          ),

          MovieCategory(
            label: "Tendances actuelles",
            movieList: dataProvider.popularMovieList,
            imageWidth: 110,
            imageHeight: 160,
          ),

          const SizedBox(height: 24),

          MovieCategory(
            label: "Actuellement au cinéma",
            movieList: dataProvider.popularMovieList,
            imageWidth: 220,
            imageHeight: 320,
          ),

          const SizedBox(height: 24),

          MovieCategory(
            label: "Bientôt disponibles",
            movieList: dataProvider.popularMovieList,
            imageWidth: 110,
            imageHeight: 160,
          ),
        ],
      ),
    );
  }
}
