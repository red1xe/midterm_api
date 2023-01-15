import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:midterm_api/model/BookModel.dart';
import '../services/book_api.dart';

class CategoryBooksScreen extends StatefulWidget {
  static const routeName = '/second';

  @override
  _CategoryBooksScreen createState() => _CategoryBooksScreen();
}

class _CategoryBooksScreen extends State<CategoryBooksScreen> {
  @override
  Widget build(BuildContext context) {
    late int current;
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
      ),
      backgroundColor: Color.fromARGB(255, 255, 254, 229),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: FutureBuilder(
                future: BookApi.getDataBygenre(q: items[6]),
                builder: (context, AsyncSnapshot<List<BookModel>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        current = index;
                        final book = snapshot.data![index];
                        return Card(
                          child: ListTile(
                            leading: Text(current.toString()),
                            title: Text(book.title!),
                            subtitle: Text(book.author!),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ),
          BottomNavigationBar(
            backgroundColor: Color.fromARGB(255, 255, 254, 229),
            onTap: ((value) {
              if (value == 1) {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      final titleCont = TextEditingController();
                      return Container(
                        padding: EdgeInsets.all(10),
                        height: 500,
                        child: Column(
                          children: [
                            TextField(
                              controller: titleCont,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Title",
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: (() {
                                      // AddBook(titleCont.text);
                                    }),
                                    child: Text("Add Book")),
                              ],
                            )
                          ],
                        ),
                      );
                    });
              }
              if (value == 0) {
                Navigator.pop(context);
              }
            }),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'Add',
              ),
            ],
          )
        ],
      ),
    );
  }
}
