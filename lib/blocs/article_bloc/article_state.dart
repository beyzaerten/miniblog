// initial

// ArticlesInitial
// ArticlesLoading
// ArticlesLoaded
// ArticlesError

import 'package:miniblog/models/blog.dart';

abstract class ArticleState {}

class ArticlesInitial extends ArticleState {}

class ArticlesLoading extends ArticleState {}

class ArticlesLoaded extends ArticleState {
  // hem durum belirtiyor hem de datayı geri dönüyor
  final List<Blog> blogs;

  ArticlesLoaded({required this.blogs});
}

class ArticlesError extends ArticleState {}

// class ArticlesDetailLoading extends ArticleState {}

// class ArticlesDetailLoaded extends ArticleState {
//   final Blog blog;

//   ArticlesDetailLoaded({required this.blog});
// }

// class ArticlesDetailError extends ArticleState {}
