import 'package:flutter/material.dart';
import 'package:movie_review/components/movie_search_component.dart';
import 'package:movie_review/components/search_bar_componen.dart';
import 'package:movie_review/model/movie.dart';
import 'package:movie_review/save_page.dart';

class WritePage extends StatefulWidget {
  const WritePage({Key? key}) : super(key: key);

  @override
  _WritePageState createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  late var currentPage = select();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: const Text(''),
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Color.fromARGB(255, 112, 103, 128),
            ),
            onPressed: () => {
                  Navigator.pop(context)
                  // if (currentPage != write())
                  //   Navigator.pop(context)
                  // else if
                  //   setState(() {
                  //     currentPage = select();
                  //   })
                }),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const SavePage())));
              },
              icon: const Icon(
                Icons.save,
                color: Color.fromARGB(255, 112, 103, 128),
              ))
        ],
      ),
      body: Hero(tag: 'top', child: currentPage),
    );
  }

  Widget select() {
    List<Movie> movie = [
      Movie(
          title: '따봉 도치야 고마워',
          director: 'director lee',
          summary:
              'summary summary summary summary summary summary summary summary summary summary summary summary summarysummary summary summarysummary summary summary',
          star: 3,
          dateTime: DateTime.utc(2022, 8, 22))
    ];
    return Column(
      children: [
        const SearchBarComponent(placeholder: '영화 제목을 입력하세요'),
        InkWell(
          child: movieSearchComponent(movie: movie),
          onTap: () {
            setState(() {
              currentPage = write(movie: movie);
            });
          },
        )
      ],
    );
  }
}

// 리뷰 작성 페이지
Widget write({required List<Movie> movie}) {
  List<num> stars = [0, 1, 2, 3, 4];
  return Column(
    children: [
      Row(
        children: [
          Image.asset(
            'assets/ddabong.jpeg',
            width: 40,
            height: 48,
            fit: BoxFit.fill,
          ),
          const SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('리뷰 제목: ${movie[0].title}',
                  style: const TextStyle(fontSize: 12)),
              Row(
                children: [
                  const Text('별점: '),
                  for (final element in stars)
                    if (element < movie[0].star)
                      const Icon(Icons.star, size: 12)
                    else
                      const Icon(Icons.star_border, size: 12),
                ],
              ),
              Text(
                  '시청 날짜: ${movie[0].dateTime?.year}년 ${movie[0].dateTime?.month}월 ${movie[0].dateTime?.day}일',
                  style: const TextStyle(fontSize: 12)),
            ],
          )
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      Expanded(
        child: Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.only(bottom: 40.0),
          child: const TextField(
            keyboardType: TextInputType.multiline,
            minLines: 99,
            maxLines: null,
            style: TextStyle(fontSize: 12),
            decoration: InputDecoration(
                hintText: '내가 시청한 영화의 리뷰를 작성해 주세요',
                contentPadding: EdgeInsets.all(10),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black))),
          ),
          // child: TextField(
          //   keyboardType: TextInputType.multiline,
          //   maxLines: null,
          //   decoration: const InputDecoration(),
          // ),
        ),
      ),
    ],
  );
}
