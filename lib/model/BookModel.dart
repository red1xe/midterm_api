import 'package:flutter/cupertino.dart';

class BookModel {
  final String? title;
  final String? author;
  final String? categories;

  BookModel({
    this.title,
    this.author,
    this.categories,
  });

  factory BookModel.fromMap(Map<String, dynamic> json) {
    return BookModel(
      title: json['volumeInfo']['title'] != null
          ? json['volumeInfo']['title']!
          : 'Loading...',
      author: json['volumeInfo']['authors'] != null
          ? json['volumeInfo']['authors'][0]!
          : 'anonymous',
      categories: json['volumeInfo']['categories'] != null
          ? json['volumeInfo']['categories'][0]!
          : 'No Data...',
    );
  }
}
