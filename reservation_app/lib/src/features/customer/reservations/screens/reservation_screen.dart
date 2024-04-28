import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservation_app/src/core/utils/widgets/custom_appbar.dart';
import 'package:reservation_app/src/features/customer/reservations/providers/reservation_provider.dart';

class ReservationScreen extends StatelessWidget {
  const ReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: CustomAppBar(
          title: 'Your Reservations',
          isBack: true,
          isHome: false,
        ),
      ),
      body: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Column(
          children: <Widget>[
            const TabBar(
              tabs: <Widget>[
                Tab(
                  text: 'Upcoming',
                ),
                Tab(
                  text: 'Previous',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: Provider.of<ReservationProvider>(context)
                    .buildTabViews(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
