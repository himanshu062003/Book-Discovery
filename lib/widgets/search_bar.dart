// lib/widgets/search_bar.dart
import 'package:flutter/material.dart';
import '../models/book.dart';
import '../services/api_service.dart';
import '../widgets/book_item.dart';

class BookSearchDelegate extends SearchDelegate {
  final ApiService apiService = ApiService();

  @override
  String get searchFieldLabel => 'Search books...';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }
    ScrollController _scrollController = ScrollController();

  bool isLoading = false;
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Book>>(
      future: apiService.searchBooks(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final books = snapshot.data ?? [];
        isLoading = true;
        return GridView.builder(
          controller: _scrollController,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 books per row
              crossAxisSpacing: 10, // Horizontal spacing between items
              mainAxisExtent: MediaQuery.of(context).size.height * 0.5),
          itemCount: books.length + (isLoading ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == books.length) {
              return Center(child: CircularProgressIndicator());
            }
            return BookItem(book: books[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(child: Text('Search for books by title or author.'));
  }
}
