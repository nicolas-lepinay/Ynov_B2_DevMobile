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
          SizedBox(
            height: 500,
            child: dataProvider.nowPlayingMovieList.isEmpty
                ? SizedBox()
                : MovieCard(movie: dataProvider.nowPlayingMovieList.first),
          ),

          MovieCategory(
            label: "Les mieux notés",
            movieList: dataProvider.popularMovieList,
            imageWidth: 110,
            imageHeight: 160,
            callback: dataProvider.getPopularMovies,
          ),

          const SizedBox(height: 24),

          MovieCategory(
            label: "Actuellement au cinéma",
            movieList: dataProvider.nowPlayingMovieList,
            imageWidth: 220,
            imageHeight: 320,
            callback: dataProvider.getNowPlayingMovies,
          ),

          const SizedBox(height: 24),

          MovieCategory(
            label: "Bientôt disponibles",
            movieList: dataProvider.upcomingMovieList,
            imageWidth: 110,
            imageHeight: 160,
            callback: dataProvider.getUpcomingMovies,
          ),
        ],
      ),
    );
  }
}
