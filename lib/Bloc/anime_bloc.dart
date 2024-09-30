import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


import '../Repository/Api/Anime/Anime.dart';
import '../Repository/Model_Class/Anime_model.dart';

part 'anime_event.dart';
part 'anime_state.dart';

class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {
  late AnimeModel animemodel;
  AnimeApi animeApi=AnimeApi();
  AnimeBloc() : super(AnimeInitial()) {
    on<AnimeEvent>((event, emit)async {
      emit(Animeloading());
      try {
        animemodel =await animeApi.getAnime();
        emit(Animeloaded());
      } catch (e) {
        emit(
          Animeerror(),
        );
      }

      // TODO: implement event handler
    });
  }
}
