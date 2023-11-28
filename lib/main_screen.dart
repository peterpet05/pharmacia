import 'package:flutter/material.dart';
import 'package:pharmacia/controllers/mainscreen_controller.dart';
import 'package:pharmacia/models/mainscreen_model.dart';
import 'package:pharmacia/views/mainscreen_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late MainScreenController controller;

  @override
  void initState() {
    super.initState();
    final model = MainScreenModel();
    controller = MainScreenController(model, (index) {
      setState(() {
        model.selectedIndex = index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainScreenView(controller);
  }
}
