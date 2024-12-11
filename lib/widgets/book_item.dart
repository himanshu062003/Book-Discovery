// lib/widgets/book_item.dart
import 'package:flutter/material.dart';
import '../models/book.dart';
import '../screens/book_detail_screen.dart';

class BookItem extends StatelessWidget {
  final Book book;

  const BookItem({required this.book});

  @override
  Widget build(BuildContext context) {
   
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetailScreen(book: book),
          ),
        );
        
      },
      child: Container(
        margin: EdgeInsets.only(right: 8, left: 8),
        padding: EdgeInsets.only(top: 6, bottom: 6),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(book.formats['image/jpeg']!,
                height: MediaQuery.of(context).size.height * 0.35,
                fit: BoxFit.contain),
            Text(
              book.title,
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
            Text(
              "Author: ${book.authors.isNotEmpty ? book.authors.map((author) => author.name).join(", ") : 'Unknown'}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
   
  }
}
