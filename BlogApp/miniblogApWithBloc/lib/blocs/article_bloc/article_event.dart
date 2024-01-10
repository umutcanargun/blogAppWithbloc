import 'package:flutter/material.dart';
import 'package:miniblog/models/blog.dart';

abstract class ArticleEvent {}

class FetchArticles extends ArticleEvent {}

class AddArticle extends ArticleEvent {
  final Blog blog;
  final BuildContext context;

  AddArticle({required this.blog, required this.context});
}

/*class FetchArticleByID extends ArticleEvent {
  final String id;

  FetchArticleByID({required this.id});
}*/