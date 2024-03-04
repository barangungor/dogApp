import 'package:dogapp/bloc/dog/dog_bloc.dart';
import 'package:dogapp/bloc/search/search_bloc.dart';
import 'package:dogapp/constants/color.dart';
import 'package:dogapp/repository/dog_repository.dart';
import 'package:dogapp/views/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DogBloc(DogRepository.instance)..add(LoadDogsEvent()),
        ),
        BlocProvider(
          create: (context) => SearchBloc()..add(SearchCloseEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'DogApp',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "GalanoGrotesque",
          textTheme: const TextTheme(
            titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: AppColors.primaryColor),
            bodyLarge: TextStyle(fontSize: 16.0),
            bodyMedium: TextStyle(fontSize: 14.0),
          ),
          dividerColor: const Color(0xFFE5E5EA),
          useMaterial3: true,
        ),
        home: const MainScreen(),
      ),
    );
  }
}
