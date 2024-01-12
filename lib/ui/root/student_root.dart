// ignore_for_file: sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parvaz_event/ui/notification/student_notification.dart';
import 'package:parvaz_event/ui/profile/profile.dart';
import 'package:parvaz_event/ui/skill_page.dart';


const int profileIndex = 0;
const int notifIndex = 1;
const int skillIndex = 2;

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key, required this.meli}) : super(key: key);
  final int meli;

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int selectedScreenIndex = profileIndex;
  final List<int> _history = [];

  final GlobalKey<NavigatorState> _profileKey = GlobalKey();
  final GlobalKey<NavigatorState> _notifKey = GlobalKey();
  final GlobalKey<NavigatorState> _skillKey = GlobalKey();

  late final map = {
    profileIndex: _profileKey,
    notifIndex: _notifKey,
    skillIndex: _skillKey,
  };

  Future<bool> _onWillPop() async {
    final NavigatorState currentSelectedTabNavigatorState =
        map[selectedScreenIndex]!.currentState!;
    if (currentSelectedTabNavigatorState.canPop()) {
      currentSelectedTabNavigatorState.pop();
      return false;
    } else if (_history.isNotEmpty) {
      setState(() {
        selectedScreenIndex = _history.last;
        _history.removeLast();
      });
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: IndexedStack(
            index: selectedScreenIndex,
            children: [
              _navigator(_profileKey, profileIndex, StudentProfileScreen(meli: widget.meli,)),
              _navigator(_notifKey, notifIndex, StudentNotificationScreen(meli: widget.meli,)),
              _navigator(_skillKey, skillIndex, const SkillPage()),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.profile_circled), label: 'پروفایل'),
              BottomNavigationBarItem(
                  icon: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Icon(CupertinoIcons.bell),
                    ],
                  ),
                  label: 'اعلانات'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.hammer), label: 'مهارت'),
            ],
            currentIndex: selectedScreenIndex,
            onTap: (selectedIndex) {
              setState(() {
                _history.remove(selectedScreenIndex);
                _history.add(selectedScreenIndex);
                selectedScreenIndex = selectedIndex;
              });
            },
          ),
        ),
        onWillPop: _onWillPop);
  }

  Widget _navigator(GlobalKey key, int index, Widget child) {
    return key.currentState == null && selectedScreenIndex != index
        ? Container()
        : Navigator(
            key: key,
            onGenerateRoute: (settings) => MaterialPageRoute(
                builder: (context) => Offstage(
                    offstage: selectedScreenIndex != index, child: child)));
  }

  @override
  void initState() {
    super.initState();
  }
}