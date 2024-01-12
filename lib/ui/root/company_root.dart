import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:parvaz_event/data/DTO/companyDTO.dart';
import 'package:parvaz_event/ui/company/company_profile.dart';
import 'package:parvaz_event/ui/company/company_students.dart';

const int search = 0;
const int profile = 1;

class CompanyRootScreen extends StatefulWidget {
  const CompanyRootScreen({Key? key, required this.company}) : super(key: key);
  final CompanyDTO company;

  @override
  State<CompanyRootScreen> createState() => _CompanyRootScreenState();
}

class _CompanyRootScreenState extends State<CompanyRootScreen> {
  int selectedScreenIndex = search;
  final List<int> _history = [];

  final GlobalKey<NavigatorState> _searchKey = GlobalKey();
  final GlobalKey<NavigatorState> _profileKey = GlobalKey();

  late final map = {
    search: _searchKey,
    profile: _profileKey,
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
                  _searchKey,
                  search,
                  CompanyStudentsScreen(company: widget.company,)),
              _navigator(_profileKey, profile,
                  CompanyProfile(company: widget.company,)),
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
                      Icon(Icons.note),
                    ],
                  ),
                  label: 'پروفایل'),

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
