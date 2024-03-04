part of '../screens/main_screen.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    super.key,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchIsOpened) {
          return AnimatedSize(
              duration: const Duration(milliseconds: 300),
              child: state.isOpened == false
                  ? GestureDetector(
                      onTap: () {
                        if (context.read<DogBloc>().dogRepository.dogBreeds.isNotEmpty) {
                          context.read<SearchBloc>().add(SearchOpenEvent());
                        }
                      },
                      child: Container(
                          padding: const EdgeInsets.all(16),
                          margin: const EdgeInsets.all(16),
                          height: 64,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: const Color(0xFFE5E5EA))),
                          child: Center(
                            child: Row(
                              children: [
                                Text(
                                  "Search",
                                  style: TextStyle(color: AppColors.customGrey.withOpacity(.6)),
                                ),
                              ],
                            ),
                          )),
                    )
                  : GestureDetector(
                      onVerticalDragUpdate: (details) {
                        if (details.primaryDelta! < -20) {
                          if (state is! SearchFull) context.read<SearchBloc>().add(SearchFullEvent());
                        } else if (details.primaryDelta! > 5) {
                          if (state is SearchFull) {
                            context.read<SearchBloc>().add(SearchOpenEvent());
                          }
                        }
                      },
                      child: Container(
                        height: state is SearchFull ? MediaQuery.of(context).size.height - 150 : null,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Padding(
                          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + 50),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 5,
                                width: 35,
                                margin: const EdgeInsets.symmetric(vertical: 16),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFE5E5EA), borderRadius: BorderRadius.circular(3)),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: TextFormField(
                                  controller: searchController,
                                  decoration: InputDecoration(
                                      hintText: "Search",
                                      border: InputBorder.none,
                                      suffixIcon: GestureDetector(
                                          onTap: () {
                                            searchController.clear();
                                            context.read<SearchBloc>().add(SearchCloseEvent());
                                            context.read<DogBloc>().add(LoadDogsEvent(forClear: true));
                                          },
                                          child: const Icon(Icons.close))),
                                  autofocus: true,
                                  onChanged: (value) {
                                    if (value.isNotEmpty == true) {
                                      context.read<DogBloc>().add(SearchDogsEvent(searchText: value));
                                    } else {
                                      context.read<DogBloc>().add(LoadDogsEvent(forClear: true));
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ));
        }
        return const Text("data");
      },
    );
  }
}
