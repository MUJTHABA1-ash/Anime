part of 'anime_bloc.dart';

@immutable
sealed class AnimeState {}

final class AnimeInitial extends AnimeState {}
final class Animeloading extends AnimeState {}
final class Animeloaded extends AnimeState {}
final class Animeerror extends AnimeState {}
