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
      image: 'assets/images/png/onboarding_one.png',
      title: 'Trade anytime anywhere',
      subTitle:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.',
    ),
    OnboardingModel(
      image: 'assets/images/png/onboarding_two.png',
      title: 'Save and invest at the same time',
      subTitle:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.',
    ),
    OnboardingModel(
      image: 'assets/images/png/onboarding_three.png',
      title: 'Transact fast and easy',
      subTitle:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.',
    ),
  ];
}
