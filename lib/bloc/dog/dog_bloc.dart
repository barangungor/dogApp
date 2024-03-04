import 'package:dogapp/models/dog.dart';
import 'package:dogapp/repository/dog_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dog_event.dart';
part 'dog_state.dart';

class DogBloc extends Bloc<DogEvent, DogState> {
  final DogRepository dogRepository;
  DogBloc(this.dogRepository) : super(DogInitial()) {
    on<LoadDogsEvent>(
      (event, emit) async {
        if (event.forClear == true) {
          emit(DogLoaded(dogRepository.dogBreeds));
        } else {
          emit(DogLoading());
          try {
            final dogs = await dogRepository.getBreeds();
            if (dogs != null) {
              emit(DogLoaded(dogs ?? []));
            } else {
              emit(DogError());
            }
          } catch (e) {
            emit(DogError());
          }
        }
      },
    );
    on<SearchDogsEvent>(
      (event, emit) async {
        try {
          List<Dog>? dogs = dogRepository.searchDogs(event.searchText);
          emit((dogs?.isNotEmpty == true) ? DogLoaded(dogs!) : DogSearchError());
        } catch (e) {
          emit(DogSearchError());
        }
      },
    );
  }
}
