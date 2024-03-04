part of '../screens/dog_list_screen.dart';

class DogCard extends StatelessWidget {
  const DogCard({
    super.key,
    required this.dogData,
  });

  final Dog dogData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final divider = Divider(
          color: context.theme.dividerColor,
          indent: 30,
          endIndent: 30,
        );
        Padding title(title) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                "$title",
                style: context.textTheme.titleLarge,
              ),
            );
        Padding subTitle(title) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                "$title",
                style: context.textTheme.bodyMedium,
              ),
            );
        context.showDialogFromBottom(
            dialogContent: AlertDialog(
          elevation: 0,
          titlePadding: EdgeInsets.zero,
          backgroundColor: Colors.white,
          title: Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                child: CachedNetworkImage(
                  imageUrl: dogData.image ?? "",
                  imageBuilder: (context, imageProvider) {
                    return Container(
                        constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * .35),
                        decoration: BoxDecoration(
                          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                        ));
                  },
                ),
              ),
              Positioned(
                  top: 12,
                  right: 12,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                        child: const Icon(Icons.close)),
                  )),
            ],
          ),
          contentPadding: const EdgeInsets.all(16),
          content: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * .5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        title("Breed"),
                        divider,
                        subTitle(dogData.name),
                        if (dogData.subDogs?.isNotEmpty == true) ...[
                          title("Sub Breed"),
                          divider,
                          ...List.generate(dogData.subDogs?.length ?? 0, (index) {
                            final Dog? subDogData = dogData.subDogs?[index];
                            return subTitle(subDogData?.name);
                          }),
                        ],
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await DogRepository.instance.getBreedImage(dogData).then((value) {
                      if (value?.isNotEmpty == true) precacheImage(CachedNetworkImageProvider(value!), context);
                      context.showDialogFromBottom(
                          dialogContent: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: CachedNetworkImage(
                              imageUrl: value ?? "",
                              imageBuilder: (context, imageProvider) {
                                return Container(
                                    constraints: BoxConstraints(
                                        maxHeight: MediaQuery.of(context).size.height * .35,
                                        maxWidth: MediaQuery.of(context).size.width * .5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                                    ));
                              },
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 15),
                              decoration: const BoxDecoration(color: Colors.white),
                              padding: const EdgeInsets.all(5),
                              child: const Icon(Icons.close),
                            ),
                          )
                        ],
                      ));
                    });
                  },
                  child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(color: AppColors.buttonColor, borderRadius: BorderRadius.circular(8)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Center(
                            child: Text(
                          "Generate",
                          style: TextStyle(color: Colors.white),
                        )),
                      )),
                )
              ],
            ),
          ),
        ));
      },
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl: dogData.image ?? "",
              fit: BoxFit.fitHeight,
              placeholderFadeInDuration: Duration.zero,
            ),
            Positioned(
                bottom: 0,
                left: 0,
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.3),
                            borderRadius: const BorderRadius.only(topRight: Radius.circular(20))),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          dogData.name ?? "",
                          style: const TextStyle(color: Colors.white),
                        )),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
