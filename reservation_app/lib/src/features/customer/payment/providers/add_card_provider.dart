import 'package:flutter/material.dart';

class AddCardProvider extends ChangeNotifier {
  String _cardNumber = '';
  String _expiryDate = '';
  String _cardHolderName = '';
  String _cvvCode = '';
  bool _isCvvFocused = false;

  get cardNumber => _cardNumber;

  get expiryDate => _expiryDate;

  get cardHolderName => _cardHolderName;

  get cvvCode => _cvvCode;

  get isCvvFocused => _isCvvFocused;

  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cardHolderNameController = TextEditingController();
  TextEditingController cvvCodeController = TextEditingController();


  void updateCardNumber(String value) {
    _cardNumber = value;
    notifyListeners();
  }



  void updateCardHolderName(String value) {
    _cardHolderName = value;
    notifyListeners();
  }

  void updateExpiryDate(String value) {
    _expiryDate = value;
    notifyListeners();
  }

  void updateCvvCode(String value) {
    _cvvCode = value;
    notifyListeners();
  }
}
