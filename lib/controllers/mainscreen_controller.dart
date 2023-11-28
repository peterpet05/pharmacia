import 'package:pharmacia/models/mainscreen_model.dart';

class MainScreenController {
  final MainScreenModel model;
  final Function(int) onTapNav;

  MainScreenController(this.model, this.onTapNav);
}
