import 'package:flutter/widgets.dart';
import 'package:test_hello_cse/Models/popular_movies.dart';

class MoviesVM with ChangeNotifier {
  List<PopularMovies> lst = [];

  add(
    int id,
    String title,
    String overview,
    String poster_path,
    DateTime release_date,
    double vote_average,
  ) {
    lst.add(PopularMovies(
      id: id,
      title: title,
      overview: overview,
      poster_path: poster_path,
      release_date: release_date,
      vote_average: vote_average,
    ));
    notifyListeners();
  }

  delete(int index) {
    lst.removeAt(index);
    notifyListeners();
  }
}
