import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservation_app/src/features/admin/clubs/providers/manage_clubs_provider.dart';
import 'package:reservation_app/src/features/customer/clubs/widgets/club_widget.dart';
import 'package:reservation_app/src/features/customer/home/widgets/popular_clubs_widget.dart';

import '../../clubs/provider/customer_club_provider.dart';

class ClubsView extends StatefulWidget {
  const ClubsView({super.key});

  @override
  State<ClubsView> createState() => _ClubsViewState();
}

class _ClubsViewState extends State<ClubsView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: SizedBox(
        child: Consumer<CustomerClubsProvider>(
    builder: (context, CustomerClubsProvider, child) {

     return ListView.separated(
          shrinkWrap: true,
          scrollDirection:Axis.vertical,
          itemCount: CustomerClubsProvider.clubs.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return ClubWidget(
              clubName: CustomerClubsProvider.clubs[index].clubName,
              clubType: CustomerClubsProvider.clubs[index].clubType!,
              clubImage: 'assets/images/restaurant.jpg',
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 10);
          },
  ); })
      ),
    );
  }
}
