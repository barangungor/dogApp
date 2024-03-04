import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dogapp/bloc/dog/dog_bloc.dart';
import 'package:dogapp/constants/color.dart';
import 'package:dogapp/extensions/contextExtensions.dart';
import 'package:dogapp/models/dog.dart';
import 'package:dogapp/repository/dog_repository.dart';
import 'package:dogapp/views/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../components/dog_card.dart';
part '../components/dog_error.dart';

class DogListScreen extends StatefulWidget {
  const DogListScreen({super.key});

  @override
  State<DogListScreen> createState() => _DogListScreenState();
}

class _DogListScreenState extends State<DogListScreen> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("DogApp"),
        ),
        body: BlocBuilder<DogBloc, DogState>(
          builder: (context, state) {
            switch (state) {
              case DogLoading():
                return const SplashScreen();
              case DogLoaded():
                return GridView.builder(
                  padding: const EdgeInsets.only(bottom: 90, left: 16, right: 16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
                  itemCount: state.dogs.length ?? 0,
                  itemBuilder: (context, index) {
                    final Dog dogData = state.dogs[index];
                    if (dogData.image != null) {
                      precacheImage(CachedNetworkImageProvider(dogData.image!), context);
                    }
                    return DogCard(key: UniqueKey(), dogData: dogData);
                  },
                );
              case DogError():
                return const DogErrorView(title: "Something went wrong!", subTitle: "Please try again later..");
              case DogSearchError():
                return const DogErrorView(title: "No results found", subTitle: "Try searching with another word");
              default:
                return const CircularProgressIndicator(color: Colors.yellow);
            }
          },
        ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
