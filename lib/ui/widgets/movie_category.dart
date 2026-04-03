import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/models/movie.dart';

import 'movie_card.dart';

class MovieCategory extends StatelessWidget {
  final String label;
  final List<Movie> movieList;
  final double imageHeight;
  final double imageWidth;
  final Function callback;

  const MovieCategory({
    super.key,
    required this.label,
    required this.movieList,
    required this.imageWidth,
    required this.imageHeight,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          label,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: imageHeight,
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              final currentPosition = notification.metrics.pixels;
              final maxPosition = notification.metrics.maxScrollExtent;
              if (currentPosition > maxPosition / 2) {
                callback();
              }
              return true;
            },
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movieList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  width: imageWidth,
                  child: movieList.isEmpty
                      ? Center(child: Text(index.toString()))
                      : movieList[index].posterPath != null
                      ? MovieCard(movie: movieList[index])
                      : SizedBox(),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
