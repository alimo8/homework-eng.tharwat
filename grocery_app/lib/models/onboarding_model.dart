import 'package:grocery_app/constants/assets.dart';

class OnboardingModel {
  final String image;
  final String title;
  final String subtitle;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}

final List<OnboardingModel> contents = [
  OnboardingModel(
    image: Assets.imagesImage1,
    title: 'Welcome to Fresh Fruits',
    subtitle: "Enjoy fresh and organic fruits delivered to your doorstep.",
  ),
  OnboardingModel(
    image: Assets.imagesImage1,
    title: 'Best Quality for Your Family',
    subtitle: "We ensure premium quality fruits with health benefits.",
  ),
  OnboardingModel(
    image: Assets.imagesImage3,
    title: 'Fast and Responsible Delivery',
    subtitle: "Our couriers deliver fresh fruits swiftly to your home.",
  ),
];
