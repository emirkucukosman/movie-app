import 'package:flutter/material.dart';
import 'package:movie_app/pages/movie_list_page.dart';
import 'package:movie_app/services/webservice.dart';
import 'package:movie_app/view_models/movie_list_view_model.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
        create: (context) => MovieListViewModel(
            webService: WebService(httpClient: http.Client())),
        child: MovieListPage(),
      ),
    );
  }
}
