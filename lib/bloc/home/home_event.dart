import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {}

class FetchDataArticle implements HomeEvent {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}
