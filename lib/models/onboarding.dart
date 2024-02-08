import 'package:wayii/data/constants/app_assets.dart';

class Onboarding {
  String bgImage;
  String title;
  String info;
  Onboarding({
    required this.bgImage,
    required this.title,
    required this.info,
  });
}

List<Onboarding> onboardingList = [
  Onboarding(
    bgImage: AppAssets.wOnboardingBG1,
    title: 'Tout entre vos mains',
    info: 'Procurez-vous vos tickets pour vos sorties',
  ),
  Onboarding(
    bgImage: AppAssets.wOnboardingBG2,
    title: "Accéder à plus d’audience",
    info: 'Créez vos évènements et mettez vos tickets en vente',
  ),
  Onboarding(
    bgImage: AppAssets.wOnboardingBG3,
    title: "Bienvenue sur Wayii",
    info: 'Laissez-nous faire de vos évènements bien plus qu’un succès',
  ),
];
