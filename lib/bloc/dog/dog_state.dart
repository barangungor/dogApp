part of 'dog_bloc.dart';

abstract class DogState extends Equatable {
  const DogState();

  @override
  List<Object?> get props => [];
}

final class DogInitial extends DogState {}

final class DogError extends DogState {}

final class DogSearchError extends DogState {}

final class DogLoading extends DogState {
  @override
  List<Object?> get props => [];
}

final class DogLoaded extends DogState {
  final List<Dog> dogs;

  const DogLoaded(this.dogs);

  @override
  List<Object?> get props => [dogs];
}
