import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:reservation_app/src/core/utils/shared_preferences.dart';
import '../../../core/utils/dio_client.dart';

class CompleteProfileProvider extends ChangeNotifier {
  final DioClient _dioClient = DioClient();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  bool isValidPhoneNumber = false;

  DateTime? _selectedDate;

  DateTime? get selectedDate => _selectedDate;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<String> genderList = ["Male", "Female"];
  List<String> nationalityList = [
    "Afghan",
    "Albanian",
    "Algerian",
    "American",
    "Andorran",
    "Angolan",
    "Antiguan and Barbudan",
    "Argentine",
    "Armenian",
    "Australian",
    "Austrian",
    "Azerbaijani",
    "Bahamian",
    "Bahraini",
    "Bangladeshi",
    "Barbadian",
    "Belarusian",
    "Belgian",
    "Belizean",
    "Beninese",
    "Bhutanese",
    "Bolivian",
    "Bosnian and Herzegovinian",
    "Botswanan",
    "Brazilian",
    "British",
    "Bruneian",
    "Bulgarian",
    "Burkinabe",
    "Burundian",
    "Cambodian",
    "Cameroonian",
    "Canadian",
    "Cape Verdean",
    "Central African",
    "Chadian",
    "Chilean",
    "Chinese",
    "Colombian",
    "Comoran",
    "Congolese (Democratic Republic of the Congo)",
    "Congolese (Republic of the Congo)",
    "Costa Rican",
    "Croatian",
    "Cuban",
    "Cypriot",
    "Czech",
    "Danish",
    "Djiboutian",
    "Dominican",
    "Dominican (Dominica)",
    "Dutch",
    "East Timorese",
    "Ecuadorean",
    "Egyptian",
    "Emirati",
    "Equatorial Guinean",
    "Eritrean",
    "Estonian",
    "Ethiopian",
    "Fijian",
    "Filipino",
    "Finnish",
    "French",
    "Gabonese",
    "Gambian",
    "Georgian",
    "German",
    "Ghanaian",
    "Greek",
    "Grenadian",
    "Guatemalan",
    "Guinean",
    "Guinean-Bissauan",
    "Guyanese",
    "Haitian",
    "Honduran",
    "Hungarian",
    "Icelander",
    "Indian",
    "Indonesian",
    "Iranian",
    "Iraqi",
    "Irish",
    "Israeli",
    "Italian",
    "Ivorian",
    "Jamaican",
    "Japanese",
    "Jordanian",
    "Kazakhstani",
    "Kenyan",
    "Kiribati",
    "Kittian and Nevisian",
    "Kuwaiti",
    "Kyrgyz",
    "Laotian",
    "Latvian",
    "Lebanese",
    "Liberian",
    "Libyan",
    "Liechtensteiner",
    "Lithuanian",
    "Luxembourgish",
    "Macedonian",
    "Malagasy",
    "Malawian",
    "Malaysian",
    "Maldivian",
    "Malian",
    "Maltese",
    "Marshallese",
    "Mauritanian",
    "Mauritian",
    "Mexican",
    "Micronesian",
    "Moldovan",
    "Monacan",
    "Mongolian",
    "Montenegrin",
    "Moroccan",
    "Mosotho",
    "Motswana",
    "Mozambican",
    "Namibian",
    "Nauruan",
    "Nepalese",
    "New Zealander",
    "Nicaraguan",
    "Nigerian",
    "Nigerien",
    "North Korean",
    "Norwegian",
    "Omani",
    "Pakistani",
    "Palauan",
    "Panamanian",
    "Papua New Guinean",
    "Paraguayan",
    "Peruvian",
    "Polish",
    "Portuguese",
    "Qatari",
    "Romanian",
    "Russian",
    "Rwandan",
    "Saint Lucian",
    "Salvadoran",
    "Samoan",
    "San Marinese",
    "Sao Tomean",
    "Saudi",
    "Senegalese",
    "Serbian",
    "Seychellois",
    "Sierra Leonean",
    "Singaporean",
    "Slovakian",
    "Slovenian",
    "Solomon Islander",
    "Somali",
    "South African",
    "South Korean",
    "South Sudanese",
    "Spanish",
    "Sri Lankan",
    "Sudanese",
    "Surinamer",
    "Swazi",
    "Swedish",
    "Swiss",
    "Syrian",
    "Taiwanese",
    "Tajik",
    "Tanzanian",
    "Thai",
    "Togolese",
    "Tongan",
    "Trinidadian or Tobagonian",
    "Tunisian",
    "Turkish",
    "Turkmen",
    "Tuvaluan",
    "Ugandan",
    "Ukrainian",
    "Uruguayan",
    "Uzbekistani",
    "Vanuatuan",
    "Vatican",
    "Venezuelan",
    "Vietnamese",
    "Yemeni",
    "Zambian",
    "Zimbabwean"
  ];

  void initializeControllers() {
    genderController.text = "Male";
    dobController.clear();
    nationalityController.clear();
    phoneNumberController.clear();
  }

  @override
  void dispose() {
    dobController
      ..dispose()
      ..clear();
    genderController
      ..dispose()
      ..clear();
    nationalityController
      ..dispose()
      ..clear();
    phoneNumberController
      ..dispose()
      ..clear();
    super.dispose();
  }

  void setPhoneNumber(PhoneNumber number) {
    //formatting the phone number and storing it in the controller for validation
    phoneNumberController.text = number.phoneNumber!;
    print("Phone number: ${phoneNumberController.text}");
  }

  void setGender(String gender) {
    genderController.text = gender;
    print("setGender: $gender");
  }

  void setDob(DateTime date) {
    _selectedDate = date;
    dobController.text = date.toString().split(" ")[0];
    print("Date: ${dobController.text}");
    notifyListeners();
  }

  void setNationality(String nationality) {
    nationalityController.text = nationality;
    notifyListeners();
  }

  Future<void> completeProfile(BuildContext context) async {
    String userPhoneNumber = phoneNumberController.text;
    String userGender = genderController.text;
    String userNationality = nationalityController.text;
    String userDob = dobController.text;

    //get user id from shared preferences
    String userId = await SharedPrefs.getUserId();

    print("User ID: $userId");

    Response response = await _dioClient
        .init()
        .put('/users/$userId', data: {
          'dateOfBirth': userDob,
          'phoneNumber': userPhoneNumber,
          'nationality': userNationality,
          'gender': userGender,
        })
        .then((value) => value)
        .catchError((error) {
          print(error);
        });

    if (response.statusCode == 200) {
      print("Profile completed successfully");
    } else {
      print("Profile completion failed");
    }

    notifyListeners();
  }
}
