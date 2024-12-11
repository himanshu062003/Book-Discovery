import 'package:flutter/material.dart';
import '../models/book.dart';

class BookDetailScreen extends StatelessWidget {
  final Book book;

  const BookDetailScreen({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              Image.network(
                book.formats['image/jpeg'] ?? '', 
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.book, size: 100); 
                },
              ),
              SizedBox(height: 20),

       
              Text(
                book.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

            
              Text(
                'Authors: ${book.authors.isNotEmpty ? book.authors.map((author) => author.name).join(", ") : 'Unknown'}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),

            
              if (book.translators.isNotEmpty)
                Text(
                  'Translators: ${book.translators.map((translator) => translator.name).join(", ")}',
                  style: TextStyle(fontSize: 18),
                ),
              SizedBox(height: 10),

           
              if (book.subjects.isNotEmpty)
                Text(
                  'Subjects: ${book.subjects.join(", ")}',
                  style: TextStyle(fontSize: 16),
                ),
              SizedBox(height: 10),

           
              if (book.bookshelves.isNotEmpty)
                Text(
                  'Bookshelves: ${book.bookshelves.join(", ")}',
                  style: TextStyle(fontSize: 16),
                ),
              SizedBox(height: 10),

           
              Text(
                'Languages: ${book.languages.join(", ")}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),

            
              Text(
                'Media Type: ${book.mediaType}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),

            
              Text(
                'Download Count: ${book.downloadCount}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),

         
            ],
          ),
        ),
      ),
    );
  }
}
