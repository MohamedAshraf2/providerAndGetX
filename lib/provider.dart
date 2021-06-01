
import 'package:flutter/cupertino.dart';

class counterProvider with ChangeNotifier{
  int c =0;

  void inc(){
    c++;
    notifyListeners();
  }
}