part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

final class SearchOpenEvent extends SearchEvent {}

final class SearchFullEvent extends SearchEvent {}

final class SearchCloseEvent extends SearchEvent {}
