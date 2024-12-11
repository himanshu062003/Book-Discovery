
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/api_service.dart';
import '../models/book.dart';
import '../widgets/book_item.dart';
import '../widgets/search_bar.dart';

class BookListScreen extends StatefulWidget {
  @override
  _BookListScreenState createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  List<Book> books = [];
  bool isLoading = false;
  int currentPage = 1;
  final ApiService apiService = ApiService();
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchBooks();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        fetchBooks();
      }
    });
  }

  Future<void> fetchBooks() async {
    if (isLoading) return;
    setState(() {
      isLoading = true;
    });

    List<Book> newBooks = await apiService.fetchBooks(currentPage);
    setState(() {
      currentPage++;
      books.addAll(newBooks);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Discovery',style: TextStyle(
          fontWeight: FontWeight.bold
        ),),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: BookSearchDelegate());
            },
          ),
        ],
      ),
      body: GridView.builder(
        controller: _scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 books per row
          crossAxisSpacing: 10, // Horizontal spacing between items
          mainAxisExtent: MediaQuery.of(context).size.height*0.5
        ),
        itemCount: books.length + (isLoading ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == books.length) {
            return Center(child: CircularProgressIndicator());
          }
          return BookItem(book: books[index]);
        },
      ),
    );
  }
}
