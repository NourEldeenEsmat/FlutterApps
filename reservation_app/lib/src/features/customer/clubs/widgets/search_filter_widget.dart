import 'package:flutter/material.dart';
import '../../../../constants/app_colors.dart';

class SearchFilterWidget extends StatefulWidget {
  const SearchFilterWidget({super.key});

  @override
  State<SearchFilterWidget> createState() => _SearchFilterWidgetState();
}

class _SearchFilterWidgetState extends State<SearchFilterWidget> {
  @override
  Widget build(BuildContext context) {
    List<String> options = ['Depression', 'Anxiety', 'Stress', 'PTSD', 'OCD'];
    var selectedOptions = List<bool>.filled(options.length, false);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: AppColors.whiteColor,
                      filled: true,
                      hintText: 'Search Clubs',
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      hintStyle: Theme.of(context).textTheme.bodySmall,
                      prefixIcon: const Icon(Icons.search),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: AppColors.textColor.withOpacity(0.12),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      focusColor: AppColors.textColor.withOpacity(0.12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Container(
                width: 50,
                height: 50,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const RotatedBox(
                  quarterTurns: 1,
                  child: Icon(
                    Icons.tune_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

