import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservation_app/src/core/utils/widgets/custom_appbar.dart';
import 'package:reservation_app/src/features/admin/clubs/providers/manage_clubs_provider.dart';
import 'package:reservation_app/src/features/customer/clubs/screens/club_description_screen.dart';
import 'package:reservation_app/src/features/customer/clubs/widgets/search_filter_widget.dart';
import 'package:reservation_app/src/features/customer/home/widgets/popular_clubs_widget.dart';
import 'package:dio/dio.dart';

import '../../../../constants/app_strings.dart';
import '../provider/customer_club_provider.dart';

class ClubScreen extends StatefulWidget {
  const ClubScreen({super.key});

  @override
  State<ClubScreen> createState() => _ClubScreenState();
}

class _ClubScreenState extends State<ClubScreen> {
  @override
  void initState() {
    Provider.of<CustomerClubsProvider>(context, listen: false).initClubs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: CustomAppBar(
            title: 'Popular Clubs',
            isBack: true,
            isHome: false,
          ),
        ),
        body: Column(
          children: [
            const SearchFilterWidget(),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ChoiceChip(
                      label: const Text('Cuisines'),
                      selected: false,
                      onSelected: (value) {},
                    ),
                    const SizedBox(width: 10),
                    ChoiceChip(
                      label: const Text('Nearest'),
                      selected: true,
                      onSelected: (value) {},
                    ),
                    const SizedBox(width: 10),
                    ChoiceChip(
                      label: const Text('Great Offers'),
                      selected: true,
                      onSelected: (value) {},
                    ),
                    const SizedBox(width: 10),
                    ChoiceChip(
                      label: const Text('Ratings 4.5+'),
                      selected: true,
                      onSelected: (value) {},
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  child:Consumer<CustomerClubsProvider>(
                    builder: (context, CustomerClubsProvider bloc,child)
                    => ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: bloc.clubs.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: PopularClubsWidget(
                          clubName: bloc.clubs[index].clubName,
                          clubType: bloc.clubs[index].clubType!,
                          clubImage: bloc.clubs[index].clubId,
                        ),
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const ClubDescriptionScreen()),
                              (route) => false);
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 10);
                    },
                  )),
                ),
              ),
            ),
          ],
        ));
  }
}
