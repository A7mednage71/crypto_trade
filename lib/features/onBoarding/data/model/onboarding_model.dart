import 'package:crypto_trade/core/utils/constant/app_assets.dart';

class OnboardingModel {
  final String image;
  final String title;
  final String subTitle;

  const OnboardingModel({
    required this.image,
    required this.title,
    required this.subTitle,
  });

  static const List<OnboardingModel> pages = [
    OnboardingModel(
      image: Assets.imagesPngOnboardingOne,
      title: 'Trade anytime anywhere',
      subTitle:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.',
    ),
    OnboardingModel(
      image: Assets.imagesPngOnboardingTwo,
      title: 'Save and invest at the same time',
      subTitle:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.',
    ),
    OnboardingModel(
      image: Assets.imagesPngOnboardingThree,
      title: 'Transact fast and easy',
      subTitle:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.',
    ),
  ];
}
