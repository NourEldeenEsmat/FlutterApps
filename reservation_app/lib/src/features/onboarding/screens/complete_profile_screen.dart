import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:reservation_app/src/constants/app_colors.dart';
import 'package:reservation_app/src/core/utils/app_dialogs.dart';
import 'package:reservation_app/src/features/onboarding/providers/complete_profile_provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  void initState() {
    Provider.of<CompleteProfileProvider>(context, listen: false)
        .initializeControllers();
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Complete Your profile',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Form(
          key: _formKey,
          child: Consumer<CompleteProfileProvider>(
            builder: (context, completeProfileProvider, child) {
              return Column(
                children: [
                  Divider(
                    color: AppColors.textColor.withOpacity(0.5),
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 30.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: ToggleSwitch(
                              minWidth: MediaQuery.of(context).size.width * 0.3,
                              cornerRadius: 50.0,
                              activeFgColor: AppColors.whiteColor,
                              activeBgColor: const [AppColors.primaryColor],
                              inactiveBgColor: AppColors.whiteColor,
                              inactiveFgColor: AppColors.textColor,
                              labels: completeProfileProvider.genderList,
                              onToggle: (index) {
                                completeProfileProvider.setGender(
                                    completeProfileProvider.genderList[index!]);
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'Date of Birth',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: AppColors.textColor),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            onTap: () async {
                              await showCupertinoModalPopup<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    decoration: const BoxDecoration(
                                      color: AppColors.whiteColor,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        topRight: Radius.circular(12),
                                      ),
                                    ),
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    child: CupertinoDatePicker(
                                      mode: CupertinoDatePickerMode.date,
                                      onDateTimeChanged: (value) {
                                        completeProfileProvider.setDob(value);
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                            controller: completeProfileProvider.dobController,
                            readOnly: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select date of birth';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Select Date of Birth',
                              suffixIcon: const Icon(
                                  FontAwesomeIcons.calendarDay,
                                  color: AppColors.primaryColor),
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      color:
                                          AppColors.textColor.withOpacity(0.5)),
                              fillColor: AppColors.whiteColor,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(
                                  color: AppColors.textColor.withOpacity(0.12),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'Nationality',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: AppColors.textColor),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            controller:
                                completeProfileProvider.nationalityController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter nationality';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter Your Nationality',
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              suffixIcon: const Icon(FontAwesomeIcons.globe,
                                  color: AppColors.primaryColor),
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      color:
                                          AppColors.textColor.withOpacity(0.5)),
                              fillColor: AppColors.whiteColor,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(
                                  color: AppColors.textColor.withOpacity(0.12),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'Phone Number',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: AppColors.textColor),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          InternationalPhoneNumberInput(
                            errorMessage: 'Invalid phone number',
                            onInputChanged: (PhoneNumber number) {
                              completeProfileProvider.setPhoneNumber(number);
                            },
                            onInputValidated: (bool value) {
                              completeProfileProvider.isValidPhoneNumber =
                                  value;
                            },
                            selectorConfig: const SelectorConfig(
                              selectorType: PhoneInputSelectorType.DIALOG,
                              trailingSpace: false,
                              showFlags: true,
                            ),
                            spaceBetweenSelectorAndTextField: 10,
                            searchBoxDecoration: InputDecoration(
                              hintText: 'Search by country name',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: AppColors.textColor),
                              fillColor: AppColors.whiteColor,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(
                                  color: AppColors.textColor.withOpacity(0.12),
                                ),
                              ),
                            ),
                            autoValidateMode:
                                AutovalidateMode.onUserInteraction,
                            // Autovalidate on user interaction
                            selectorTextStyle:
                                const TextStyle(color: Colors.black),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a phone number';
                              } else if (!completeProfileProvider
                                  .isValidPhoneNumber) {
                                return 'Invalid phone number';
                              } else {
                                return null;
                              }
                            },
                            inputDecoration: InputDecoration(
                              hintText: 'XXX XXXXXXX',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      color:
                                          AppColors.textColor.withOpacity(0.5)),
                              fillColor: AppColors.whiteColor,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(
                                  color: AppColors.textColor.withOpacity(0.12),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
          child: SizedBox(
            width: double.infinity,
            height: 60.0,
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  AppDialog.showLoadingDialog(context, 'Saving profile');
                  await Provider.of<CompleteProfileProvider>(context,
                          listen: false)
                      .completeProfile(context);
                  GoRouter.of(context).go('/main_screen');
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: Text(
                'Save',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: AppColors.whiteColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
