import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/services/api_service.dart';

class DataRepository with ChangeNotifier {
  final ApiService apiService = ApiService();
  final List<Movie> _popularMovieList = [];
  int _popularMovieIndex = 1;

  List<Movie> get popularMovieList => _popularMovieList;

  Future<void> getPopularMovies() async {
    try {
      List<Movie> movies = await apiService.getPopularMovies(
        pageNumber: _popularMovieIndex,
      );
      _popularMovieList.addAll(movies);
      _popularMovieIndex++;
      notifyListeners();
    } on Response catch (response) {
      print("(!) ERROR: ${response.statusCode}");
      rethrow;
    }
  }

  // Lance toutes les fonctions "get..."
  Future<void> initData() async {
    await getPopularMovies();
    // ...
  }
}
