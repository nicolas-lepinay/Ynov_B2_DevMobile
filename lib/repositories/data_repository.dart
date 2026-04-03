import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/services/api_service.dart';

class DataRepository with ChangeNotifier {
  final ApiService apiService = ApiService();
  // Movies
  final List<Movie> _popularMovieList = [];
  final List<Movie> _nowPlayingMovieList = [];
  final List<Movie> _upcomingMovieList = [];

  // Page indexes
  int _popularMovieIndex = 1;
  int _nowPlayingMovieIndex = 1;
  int _upcomingMovieIndex = 1;

  // Getters
  List<Movie> get popularMovieList => _popularMovieList;
  List<Movie> get nowPlayingMovieList => _nowPlayingMovieList;
  List<Movie> get upcomingMovieList => _upcomingMovieList;

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

  Future<void> getNowPlayingMovies() async {
    try {
      List<Movie> movies = await apiService.getNowPlayingMovies(
        pageNumber: _nowPlayingMovieIndex,
      );
      _nowPlayingMovieList.addAll(movies);
      _nowPlayingMovieIndex++;
      notifyListeners();
    } on Response catch (response) {
      print("(!) ERROR: ${response.statusCode}");
      rethrow;
    }
  }

  Future<void> getUpcomingMovies() async {
    try {
      List<Movie> movies = await apiService.getUpcomingMovies(
        pageNumber: _upcomingMovieIndex,
      );
      _upcomingMovieList.addAll(movies);
      _upcomingMovieIndex++;
      notifyListeners();
    } on Response catch (response) {
      print("(!) ERROR: ${response.statusCode}");
      rethrow;
    }
  }

  // Lance toutes les fonctions "get..."
  Future<void> initData() async {
    await getPopularMovies();
    await getNowPlayingMovies();
    await getUpcomingMovies();
    // ...
  }
}
