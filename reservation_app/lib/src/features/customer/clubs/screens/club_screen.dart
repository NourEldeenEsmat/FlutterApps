import 'package:flutter/material.dart';
import 'package:reservation_app/src/core/utils/widgets/custom_appbar.dart';
import 'package:reservation_app/src/features/customer/clubs/widgets/search_filter_widget.dart';
import 'package:reservation_app/src/features/customer/home/widgets/popular_clubs_widget.dart';
import 'package:dio/dio.dart';

import '../../../../constants/app_strings.dart';

class ClubScreen extends StatefulWidget {
  const ClubScreen({super.key});

  @override
  State<ClubScreen> createState() => _ClubScreenState();
}

class _ClubScreenState extends State<ClubScreen> {
  List clubs = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getClubs();
  }

  void getClubs() async {
    var response = await Dio().get('${AppStrings.baseUrl}/clubs');
    if(response.statusCode==200){
      setState(() {
        clubs = response.data as List;
      });
    }else{
      clubs = [];
    }
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
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: 3,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return PopularClubsWidget(
                        clubName: clubs[index]['clubName'],
                        clubType: clubs[index]['clubType'],
                        clubImage: 'assets/images/restaurant.jpg',
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 10);
                    },
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
