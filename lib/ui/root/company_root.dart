import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:parvaz_event/ui/company/company_layout.dart';
import 'package:parvaz_event/ui/company/confirmed_screen.dart';

const int explore = 0;
const int waiting = 1;
const int confirmed = 2;

class CompanyRootScreen extends StatefulWidget {
  const CompanyRootScreen({Key? key}) : super(key: key);

  @override
  State<CompanyRootScreen> createState() => _CompanyRootScreenState();
}

class _CompanyRootScreenState extends State<CompanyRootScreen> {
  int selectedScreenIndex = explore;
  final List<int> _history = [];

  final GlobalKey<NavigatorState> _exploreKey = GlobalKey();
  final GlobalKey<NavigatorState> _waitingKey = GlobalKey();
  final GlobalKey<NavigatorState> _confirmedKey = GlobalKey();

  late final map = {
    explore: _exploreKey,
    waiting: _waitingKey,
    confirmed: _confirmedKey,
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
        onWillPop: _onWillPop,
        child: Scaffold(
          body: IndexedStack(
            index: selectedScreenIndex,
            children: [
              _navigator(
                  _exploreKey,
                  explore,
                  const CompanyHome(
                    waiting: false,
                    confirmed: false,
                  )),
              _navigator(_waitingKey, waiting,
                  const CompanyHome(waiting: true, confirmed: false)),
              _navigator(
                  _confirmedKey,
                  confirmed,
                  const CompanyHome(
                    waiting: false,
                    confirmed: true,
                  )),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.search), label: 'جست و جو'),
              BottomNavigationBarItem(
                  icon: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Icon(CupertinoIcons.alarm),
                    ],
                  ),
                  label: 'صف انتظار'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.check_mark_circled),
                  label: 'تایید شده'),
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
        ));
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
