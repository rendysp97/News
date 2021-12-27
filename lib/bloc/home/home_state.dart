import 'package:equatable/equatable.dart';
import 'package:news/model/news.dart';

abstract class HomeState implements Equatable {}

class Intial implements HomeState {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}

class Loading implements HomeState {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}

// success
class Loaded implements HomeState {
  final List<Articles> myArticle;

  Loaded({required this.myArticle});

  @override
  List<Object?> get props => [myArticle];

  @override
  bool? get stringify => true;
}

class Message implements HomeState {
  final String? message;

  Message(this.message);

  @override
  List<Object?> get props => [message];

  @override
  bool? get stringify => false;
}
