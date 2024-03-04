part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchIsOpened extends SearchState {
  final bool isOpened;
  const SearchIsOpened({required this.isOpened});
  @override
  // TODO: implement props
  List<Object> get props => [isOpened];
}

final class SearchFull extends SearchIsOpened {
  const SearchFull({required super.isOpened});
}
