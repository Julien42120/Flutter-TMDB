import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:test_hello_cse/Models/moviesVM.dart';
import 'package:provider/provider.dart';
import 'package:test_hello_cse/Models/popular_movies.dart';
import 'package:test_hello_cse/Services/api_response.dart';
import 'package:test_hello_cse/Views/bottomBar.dart';
import 'package:intl/date_symbol_data_local.dart';

class FavoriteMovies extends StatefulWidget {
  @override
  _FavoriteMoviesState createState() => _FavoriteMoviesState();
}

class _FavoriteMoviesState extends State<FavoriteMovies> {
  @override
  void initState() {
    super.initState();

    _getData();
    initializeDateFormatting();
  }

  void _getData() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: BottomBarCustom(),
      body: SingleChildScrollView(
        child: Container(
          child: Consumer<MoviesVM>(
            builder: (context, value, child) => SafeArea(
              child: Column(
                children: [
                  Container(
                    child: Text(
                      'Favoris',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: height * 0.05),
                    height: height * 0.62,
                    margin: EdgeInsets.only(
                      top: height * 0.08,
                    ),
                    child: ListView.builder(
                      itemCount: value.lst.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                              vertical: height * 0.015,
                              horizontal: width * 0.025),
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
                                        value.lst[index].poster_path),
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                      offset: Offset(8, 8),
                                      spreadRadius: -6,
                                      blurRadius: 15,
                                      color: Color.fromARGB(255, 75, 75, 75),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.only(
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
                                    margin:
                                        EdgeInsets.only(top: height * 0.005),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: width * 0.45,
                                          child: Text(
                                            value.lst[index].title,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                decoration:
                                                    TextDecoration.none),
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          child: InkWell(
                                            child: const FaIcon(
                                                FontAwesomeIcons.solidHeart,
                                                color: Colors.red),
                                            onTap: () {
                                              value.delete(index);
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.05),
                                    child: Text(
                                      DateFormat("dd MMMM yyyy", "fr").format(
                                          DateTime.parse(value
                                              .lst[index].release_date
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
                                    margin:
                                        EdgeInsets.only(top: height * 0.015),
                                    child: Text(
                                      value.lst[index].overview,
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
