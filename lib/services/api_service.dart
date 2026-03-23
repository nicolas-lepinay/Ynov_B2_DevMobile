import 'package:dio/dio.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/services/api.dart';

class ApiService {
  final API api = API();
  final Dio dio = Dio();

  // Chaque requête
  Future<Response> getData(String path, {Map<String, dynamic>? params}) async {
    // On construit l'URL
    String _url = api.baseURL + path;
    // On rajoute les paramètres de la requête (query parameters)
    Map<String, dynamic> _params = {'api_key': api.apiKey, 'language': 'fr-FR'};
    // Si params n'est pas null, on l'ajoute
    if (params != null) {
      _params.addAll(params);
    }
    // On fait l'appel d'API
    final response = await dio.get(_url, queryParameters: _params);
    // Vérifie si la requête est OK
    if (response.statusCode == 200) {
      return response;
    } else {
      throw response;
    }
  }

  Future<List<Movie>> getPopularMovies({required int pageNumber}) async {
    Response response = await getData(
      '/movie/popular',
      params: {'page': pageNumber},
    );
    if (response.statusCode == 200) {
      Map data = response.data;
      List<dynamic> results = data['results'];
      List<Movie> movies = [];

      for (Map<String, dynamic> json in results) {
        Movie movie = Movie.fromJson(json);
        movies.add(movie);
      }
      return movies;
    } else {
      throw response;
    }
  }
}
