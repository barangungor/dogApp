import 'dart:ui';

import 'package:dogapp/bloc/dog/dog_bloc.dart';
import 'package:dogapp/bloc/search/search_bloc.dart';
import 'package:dogapp/constants/color.dart';
import 'package:dogapp/repository/dog_repository.dart';
import 'package:dogapp/services/os_version_getter.dart';
import 'package:dogapp/views/screens/screens.dart';
import 'package:dogapp/views/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

part '../components/search_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const DogListScreen(),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: const SearchBar(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: SvgPicture.asset("assets/icons/home.svg"), label: "Home"),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/settings.svg"),
            label: "Settings",
          ),
        ],
        onTap: (value) async {
          if (value == 1) {
            await OSVersionGetter.instance.getOSVersion().then((value) => showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return const SettingsView();
                  },
                ));
          }
        },
      ),
    );
  }
}
