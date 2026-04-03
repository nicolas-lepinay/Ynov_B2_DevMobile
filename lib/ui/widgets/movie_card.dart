import 'package:flutter/material.dart';
import 'package:netflix_clone/models/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Image.network(movie.posterURL()!, fit: BoxFit.cover);
  }
}
