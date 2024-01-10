import 'package:miniblog/models/blog.dart';

abstract class DetailState {}

class DetailInitial extends DetailState {}

class DetailLoading extends DetailState {}

class DetailLoaded extends DetailState {
  Blog blog;

  DetailLoaded({required this.blog});
}

class DetailError extends DetailState {}