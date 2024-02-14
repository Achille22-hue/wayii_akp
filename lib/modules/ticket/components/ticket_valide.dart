import 'package:flutter/material.dart';
import 'package:wayii/data/constants/app_colors.dart';
import 'package:wayii/modules/ticket/components/card_ticket.dart';

class TicketValide extends StatelessWidget {
  const TicketValide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kSecondary,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: const [
          CardTicket(isValable: true),
          CardTicket(isValable: true),
          CardTicket(isValable: true),
          CardTicket(isValable: true),
        ],
      ),
    );
  }
}
