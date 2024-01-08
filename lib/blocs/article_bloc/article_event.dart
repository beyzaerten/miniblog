// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:miniblog/models/blog.dart';

abstract class ArticleEvent {}

class FetchArticles extends ArticleEvent {}

// class FetchArticleDetail extends ArticleEvent {
//   String id;

//   FetchArticleDetail({
//     required this.id,
//   });
// }

class AddArticle extends ArticleEvent {
  final Blog blog;
  final BuildContext context;

  AddArticle({required this.blog, required this.context});
}
