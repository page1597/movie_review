import 'package:flutter/material.dart';
import 'package:movie_review/components/review_search_component.dart';
import 'package:movie_review/components/search_bar_componen.dart';
import 'package:movie_review/model/movie.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
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
          star: 5),
    ];
    return ListView(
      children: [
        const SearchBarComponent(placeholder: '영화 제목을 입력하세요.'),
        reviewSearchComponent(movie: movie, me: false)
      ],
    );
  }
}
