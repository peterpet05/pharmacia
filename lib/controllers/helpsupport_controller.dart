import 'package:flutter/material.dart';

class HelpSupportController {
  TextEditingController searchController = TextEditingController();

  void dispose() {
    searchController.dispose();
  }
}