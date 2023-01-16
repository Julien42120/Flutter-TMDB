import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_hello_cse/Models/popular_movies.dart';
import 'package:test_hello_cse/Services/api_key.dart';
import 'package:test_hello_cse/Services/api_response.dart';

class MoviesService {
  Future<List<PopularMovies>?> getCategoriesList() async {
    var url =
        Uri.parse(APIResponse.popularMovies + apiKey + APIResponse.language);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      List<PopularMovies> results = [];
      jsonResponse['results'].forEach((v) {
        results.add(PopularMovies.fromJson(v));
      });

      List<PopularMovies> popularMovies = [];
      for (var i = 0; i < 10; i++) {
        popularMovies.add(results[i]);
      }
      print(popularMovies);
      return popularMovies;
    } else {
      throw Exception('Failed to load Movies from API');
    }
  }
}
