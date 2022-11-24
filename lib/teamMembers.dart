import 'package:flutter/foundation.dart';

class TeamMembers with ChangeNotifier {
  List<String> memberList = [];

  void addMember(name, studentNo) {
    memberList.add(name + ' (' + studentNo + ')');
    notifyListeners();
  }

  void removeMember(index) {
    memberList.removeAt(index);
    notifyListeners();
  }
}
