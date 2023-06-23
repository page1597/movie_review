import 'package:flutter/material.dart';
import 'package:movie_review/components/review_search_component.dart';
import 'package:movie_review/model/movie.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    List<Movie> movie = [
      Movie(
          title: '따봉 도치야 고마워',
          director: 'director lee',
          summary:
              'summary summary summary summary summary summary summary summary summary summary summary summary summarysummary summary summarysummary summary summary',
          review:
              'review reviewreviewreviewreviewreviewreviewreviewreviewreviewreviewreviewreviewreviewreviewreviewreview',
          star: 5)
    ];
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          reviewSearchComponent(movie: movie, me: true),
        ],
      ),
    );
  }
}
