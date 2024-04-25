import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservation_app/src/features/customer/reservations/widgets/previous_res_widget.dart';

import '../providers/reservation_provider.dart';

class PreviousView extends StatefulWidget {
  const PreviousView({super.key});

  @override
  State<PreviousView> createState() => _PreviousViewState();
}

class _PreviousViewState extends State<PreviousView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child:Consumer<ReservationProvider>(
      builder: (BuildContext context, ReservationProvider bloc,_) => ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      physics: const BouncingScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return PreviousReservationWidget(
          clubName: bloc.reservations[index].clubId,
          clubType: bloc.reservations[index].reservationStatus,
          reservationDate: bloc.reservations[index].reservationDate,
          reservationTime: bloc.reservations[index].reservationTime,
          clubImage: 'assets/images/restaurant.jpg',
        );
      },
      ),)
    );
  }
}
