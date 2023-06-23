import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_review/home_page.dart';
import 'package:movie_review/list_page.dart';
import 'package:movie_review/my_page.dart';
import 'package:movie_review/write_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Review',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromARGB(255, 112, 103, 128),
          secondary: const Color.fromARGB(255, 160, 144, 131),
        ),
        fontFamily: 'GowunDodum',
      ),
      home: const MyHomePage(title: '영화 리뷰'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _activePage = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    @override
    void dispose() {
      _pageController.dispose();
      super.dispose();
    }

    @override
    void initState() {
      super.initState();
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          elevation: 0.0,
        ),
        body: PageView(
          controller: _pageController,
          children: const [HomePage(), ListPage(), MyPage()],
          onPageChanged: (index) {
            setState(() {
              _activePage = index;
            });
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _activePage,
            onTap: (index) {
              if (_pageController.hasClients) {
                _pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.bounceInOut);
              }
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
              BottomNavigationBarItem(icon: Icon(Icons.list), label: 'list'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'my page'),
            ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const WritePage())));
          },
          tooltip: 'write review',
          child: const Icon(CupertinoIcons
              .pen), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
