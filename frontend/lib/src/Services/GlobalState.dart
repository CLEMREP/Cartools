import 'package:sliding_up_panel/sliding_up_panel.dart';

class GlobalState
{
  static final GlobalState _instance = GlobalState._internal();
  factory GlobalState() => _instance;
  GlobalState._internal();

  static final PanelController filterController = PanelController();
}