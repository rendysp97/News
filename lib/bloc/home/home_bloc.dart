import 'package:bloc/bloc.dart';
import 'package:news/bloc/home/home_event.dart';
import 'package:news/bloc/home/home_state.dart';
import 'package:news/repo/home_repo.dart';
import '../../model/news.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final Network? network;

  HomeBloc({this.network}) : super(Intial()) {
    on<FetchDataArticle>((event, emit) async {
      emit(Loading());
      try {
        List<Articles> data = await network!.getData();
        emit(Loaded(myArticle: data));
      } catch (e) {
        emit(Message(e.toString()));
      }
    });
  }
}
