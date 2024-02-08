import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wayii/data/constants/app_assets.dart';
import 'package:wayii/data/constants/app_colors.dart';
import 'package:wayii/data/constants/app_typography.dart';
import 'package:wayii/modules/events/evernment_view.dart';
import 'package:wayii/modules/favorite/favorite_view.dart';
import 'package:wayii/modules/home/home_view.dart';
import 'package:wayii/modules/profil/profil_view.dart';
import 'package:wayii/modules/ticket/ticket_view.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _currentIndex = 0;
  List<Widget> pages = [
    const HomeView(),
    const FavoriteView(),
    const EvernmentView(),
    const TicketView(),
    const ProfilView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 1.0, color: Colors.grey), // Trait en haut
          ),
        ),
        child: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          backgroundColor: AppColors.kSecondary,
          elevation: 0,
          selectedItemColor: AppColors.kPrimary,
          unselectedItemColor: Colors.white,
          selectedLabelStyle: AppTypography.kLight10,
          unselectedLabelStyle: AppTypography.kLight10,
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            buildNavItem(AppAssets.wHome, AppAssets.wHomeActive, 'Accueil'),
            buildNavItem(
                AppAssets.wFavorite, AppAssets.wFavoriteActive, 'Préférences'),
            buildNavItem(AppAssets.wAdd, AppAssets.wAddActive, ''),
            buildNavItem(AppAssets.wTicket, AppAssets.wTicketActive, 'Tickets'),
            buildNavItem(AppAssets.wProfil, AppAssets.wProfilActive, 'Profil'),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem buildNavItem(
    String iconPath,
    String activeIconPath,
    String label,
  ) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(top: 2.0),
        child: SvgPicture.asset(iconPath),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.only(top: 2.0),
        child: SvgPicture.asset(activeIconPath),
      ),
      label: label,
    );
  }
}
