import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:test_hello_cse/Models/moviesVM.dart';
import 'package:test_hello_cse/Models/popular_movies.dart';
import 'package:test_hello_cse/Services/api_response.dart';
import 'package:test_hello_cse/Services/movies_service.dart';
import 'package:provider/provider.dart';
import 'package:test_hello_cse/Views/bottomBar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:test_hello_cse/Views/favorite_movies.dart';

class MoviesPopularList extends StatefulWidget {
  const MoviesPopularList({Key? key});

  @override
  State<MoviesPopularList> createState() => _MoviesPopularListState();
}

class _MoviesPopularListState extends State<MoviesPopularList> {
  List<PopularMovies>? _listPopularMovies = [];

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  _getData() async {
    _listPopularMovies = await MoviesService().getCategoriesList();
    return _listPopularMovies;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: BottomBarCustom(),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: _getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                padding: EdgeInsets.only(bottom: height * 0.05),
                width: width,
                height: height,
                child: ListView.builder(
                  itemCount: _listPopularMovies!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(
                          vertical: height * 0.015, horizontal: width * 0.025),
                      height: height * 0.20,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromARGB(255, 255, 255, 255),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(8, 8),
                            spreadRadius: -8,
                            blurRadius: 10,
                            color: Color.fromARGB(255, 75, 75, 75),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: height,
                            width: width * 0.25,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                alignment: Alignment.center,
                                matchTextDirection: true,
                                repeat: ImageRepeat.noRepeat,
                                fit: BoxFit.cover,
                                image: NetworkImage(APIResponse.image +
                                    _listPopularMovies![index].poster_path),
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(8, 8),
                                  spreadRadius: -6,
                                  blurRadius: 15,
                                  color: Color.fromARGB(255, 75, 75, 75),
                                ),
                              ],
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.05),
                                margin: EdgeInsets.only(top: height * 0.005),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: width * 0.43,
                                      child: Text(
                                        _listPopularMovies![index].title,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            decoration: TextDecoration.none),
                                      ),
                                    ),
                                    Consumer<MoviesVM>(
                                      builder: (context, value, child) =>
                                          Material(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        child: InkWell(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                          splashColor:
                                              Colors.red.withOpacity(0.8),
                                          focusColor: Colors.white,
                                          hoverColor: const Color.fromARGB(
                                              124, 70, 173, 19),
                                          onTap: () async {
                                            value.add(
                                                _listPopularMovies![index].id,
                                                _listPopularMovies![index]
                                                    .title,
                                                _listPopularMovies![index]
                                                    .overview,
                                                _listPopularMovies![index]
                                                    .poster_path,
                                                _listPopularMovies![index]
                                                    .release_date,
                                                _listPopularMovies![index]
                                                    .vote_average);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                  'Film ajouté au favoris',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                backgroundColor: Color.fromARGB(
                                                    255, 64, 172, 68),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            child: const FaIcon(
                                              FontAwesomeIcons.heart,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.05),
                                child: Text(
                                  DateFormat("dd MMMM yyyy", "fr").format(
                                      DateTime.parse(_listPopularMovies![index]
                                          .release_date
                                          .toString())),
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      decoration: TextDecoration.none),
                                ),
                              ),
                              Container(
                                width: width * 0.7,
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.05),
                                margin: EdgeInsets.only(top: height * 0.015),
                                child: Text(
                                  _listPopularMovies![index].overview,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      decoration: TextDecoration.none),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  softWrap: false,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return Center(
              child: Container(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }
}
