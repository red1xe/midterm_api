import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/BookModel.dart';
import '../services/book_api.dart';

class CatergoryScreen extends StatefulWidget {
  @override
  State<CatergoryScreen> createState() => _CatergoryScreenState();
}

class _CatergoryScreenState extends State<CatergoryScreen> {
  List<BookModel> books = [];
  @override
  void initState() {
    super.initState();
    getBookData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 254, 229),
      appBar: AppBar(
        title: Text("BOOKS"),
        leading: IconButton(
          icon: Icon(Icons.book_outlined),
          onPressed: () {},
        ),
      ),
      body: InkWell(
        onTap: () => Navigator.of(context).pushNamed('/second'),
        child: Container(
          padding: const EdgeInsets.all(5),
          child: GridView.builder(
            itemCount: books.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemBuilder: (BuildContext context, int index) {
              final book = books[index];
              return Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      items[index],
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 254, 229)),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> getBookData() async {
    final response = await BookApi.getBookData();
    setState(() {
      books = response;
    });
  }

  List<String> items = [
    'Inspirational',
    'Horror',
    'Mystery',
    'Crime',
    'Paranormal',
    'Fantasy',
    'Thrillers',
    'Historical',
    'Romance',
    'Western',
    'Science',
    'Science Fiction',
    'Dystopian',
  ];
}
