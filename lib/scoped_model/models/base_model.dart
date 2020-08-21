import 'package:arties_flutter_prototype/scoped_model/view_states.dart';
import 'package:scoped_model/scoped_model.dart';

export 'package:arties_flutter_prototype/scoped_model/view_states.dart';

abstract class BaseModel extends Model {
  ViewState _state;
  ViewState get state => _state;

  bool get isBusy => _state == ViewState.Busy;

  void setState(ViewState newState) {
    _state = newState;
    notifyListeners();
  }
}