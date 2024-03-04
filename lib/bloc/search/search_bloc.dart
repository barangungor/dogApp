import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchOpenEvent>((event, emit) {
      emit(const SearchIsOpened(isOpened: true));
    });
    on<SearchCloseEvent>((event, emit) {
      emit(const SearchIsOpened(isOpened: false));
    });
    on<SearchFullEvent>((event, emit) {
      emit(const SearchFull(isOpened: true));
    });
  }
}
