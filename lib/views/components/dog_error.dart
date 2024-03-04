part of '../screens/dog_list_screen.dart';

class DogErrorView extends StatelessWidget {
  final String? title, subTitle;
  const DogErrorView({
    super.key,
    this.title,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          title ?? "Something went wrong!",
          style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
        ),
        if (subTitle != null)
          Text(
            subTitle!,
            style: context.textTheme.bodyMedium?.copyWith(color: AppColors.customGrey.withOpacity(.6)),
          )
      ]),
    );
  }
}
