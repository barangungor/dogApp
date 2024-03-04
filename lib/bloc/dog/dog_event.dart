part of 'dog_bloc.dart';

@immutable
sealed class DogEvent {}

final class LoadDogsEvent extends DogEvent {
  final forClear;
  LoadDogsEvent({this.forClear = false});
}

final class SearchDogsEvent extends DogEvent {
  final searchText;
  SearchDogsEvent({required this.searchText});
}
