import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parvaz_event/data/DTO/companyDTO.dart';
import 'package:parvaz_event/data/DTO/studentDTO.dart';
import 'package:parvaz_event/data/student/bloc/student_bloc.dart';
import 'package:parvaz_event/data/student/student_repo.dart';
import 'package:parvaz_event/theme.dart';
import 'package:parvaz_event/ui/student_detail/student_detail.dart';

class CompanyStudentsScreen extends StatefulWidget {
  const CompanyStudentsScreen({super.key, required this.company});
  final CompanyDTO company;

  @override
  State<CompanyStudentsScreen> createState() => _CompanyStudentsScreenState();
}

class _CompanyStudentsScreenState extends State<CompanyStudentsScreen>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  bool isGrid = true;
  final TextEditingController _searchController = TextEditingController();
  final ValueNotifier<String> _searchNotifier = ValueNotifier<String>('');

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    _searchController.dispose();
    _searchNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        body: BlocProvider<GetStudentBloc>(
      create: (BuildContext context) {
        final bloc = GetStudentBloc(studentRepository);
        bloc.add(CompanyLayoutScreenStarted());
        return bloc;
      },
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: theme.colorScheme.primary,
                height: 80,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 12),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              isGrid = !isGrid;
                            });
                          },
                          icon: Icon(!isGrid
                              ? CupertinoIcons.square_grid_2x2
                              : Icons.list)),
                      Expanded(
                          child: SizedBox(
                              height: 40,
                              child: Container(
                                decoration: BoxDecoration(color: theme.colorScheme.surface, borderRadius: BorderRadius.circular(12)),
                                child: TextFormField(
                                  controller: _searchController,
                                  onChanged: (value) {
                                    _searchNotifier.value = value;
                                  },
                                  cursorColor: Colors.black,
                                  // cursorHeight: 0,
                                  decoration: InputDecoration(
                                    fillColor: theme.colorScheme.surface,
                                      contentPadding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      suffixIcon:
                                          const Icon(CupertinoIcons.search),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                ),
                              ))),
                    ],
                  ),
                ),
              ),
              BlocBuilder<GetStudentBloc, StudentGetState>(
                builder: (context, state) {
                  if (state is StudentGetSuccess) {
                    final students = state.students;
                    return ValueListenableBuilder<String>(
                      valueListenable: _searchNotifier,
                      builder:
                          (BuildContext context, String value, Widget? child) {
                        final List<StudentDTO> items;
                        if (_searchController.text.isEmpty) {
                          items = students;
                        } else {
                          items = students.where((element) {
                            final val = value.trim().replaceAll(RegExp(r'\s+'), ' ');
                            return element.nam!.contains(val) ||
                                element.namKhanevadegi!.contains(val) ||
                                ("${element.nam!} ${element.namKhanevadegi!}")
                                    .contains(val) ||
                                element.reshtehTahsili!.contains(val) ||
                                // element.daneshgah!.contains(val) ||
                                element.maghta!.contains(val) ||
                                element.mahalZendegi!.contains(val);
                          }).toList();
                        }
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(25, 12, 25, 12),
                          child: AnimatedBuilder(
                            animation: _controller!,
                            builder: (context, child) {
                              return AnimatedSwitcher(
                                duration: const Duration(milliseconds: 1000),
                                child: isGrid
                                    ? GridView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 0.8,
                                          mainAxisSpacing: 8,
                                          crossAxisSpacing: 8,
                                        ),
                                        itemCount: items.length,
                                        itemBuilder: (context, index) {
                                          final student = items[index];
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                builder: (context) {
                                                  return StudentDetailScreen(
                                                    student: student,
                                                    company: widget.company,
                                                  );
                                                },
                                              ));
                                            },
                                            child: SlideTransition(
                                              position: Tween<Offset>(
                                                      begin: const Offset(0, 0),
                                                      end: const Offset(100, 0))
                                                  .animate(_controller!),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: theme
                                                        .colorScheme.surface,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: LightTheme
                                                              .shadowColor,
                                                          blurRadius: LightTheme
                                                              .blurRadius)
                                                    ]), // Change color for grid items
                                                margin: const EdgeInsets.all(2),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                        decoration: BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: theme
                                                                .colorScheme
                                                                .surface,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  color: LightTheme
                                                                      .shadowColor,
                                                                  blurRadius:
                                                                      LightTheme
                                                                          .blurRadius)
                                                            ],
                                                            border: Border.all(
                                                                color: Colors
                                                                    .black)),
                                                        child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50),
                                                            child: Image.asset(
                                                              'assets/images/default_profile.png',
                                                              width: 100,
                                                            ))),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          student.nam!
                                                                  .isNotEmpty
                                                              ? student.nam!
                                                              : "مهمان",
                                                          style: theme.textTheme
                                                              .bodyMedium!
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                        ),
                                                        const SizedBox(
                                                          width: 6,
                                                        ),
                                                        Text(
                                                            student.namKhanevadegi!
                                                                    .isNotEmpty
                                                                ? student
                                                                    .namKhanevadegi!
                                                                : "تواناجو",
                                                            style: theme
                                                                .textTheme
                                                                .bodyMedium!
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600)),
                                                      ],
                                                    ),
                                                    if (student.reshtehTahsili!
                                                        .isNotEmpty)
                                                      Text(
                                                          student
                                                              .reshtehTahsili!,
                                                          style: theme.textTheme
                                                              .bodySmall!
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: theme
                                                                      .colorScheme
                                                                      .primary)),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        const Icon(
                                                          Icons
                                                              .location_on_sharp,
                                                          color: Color.fromARGB(
                                                              255, 221, 32, 19),
                                                          size: 15,
                                                        ),
                                                        const SizedBox(
                                                          width: 4,
                                                        ),
                                                        Text(
                                                            student.mahalZendegi!
                                                                    .isNotEmpty
                                                                ? student
                                                                    .mahalZendegi!
                                                                : "همدان",
                                                            style: theme
                                                                .textTheme
                                                                .bodySmall!
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: LightTheme
                                                                        .secondaryTextColor)),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                    : ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: items.length,
                                        itemBuilder: (context, index) {
                                          final student = items[index];
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                builder: (context) {
                                                  return StudentDetailScreen(
                                                    student: student,
                                                    company: widget.company,
                                                  );
                                                },
                                              ));
                                            },
                                            child: SlideTransition(
                                              position: Tween<Offset>(
                                                      begin: const Offset(0, 0),
                                                      end: const Offset(10, 0))
                                                  .animate(_controller!),
                                              child: Container(
                                                height: 80,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    color: theme
                                                        .colorScheme.surface,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: LightTheme
                                                              .shadowColor,
                                                          blurRadius:
                                                              LightTheme
                                                                  .blurRadius)
                                                    ]),
                                                margin: const EdgeInsets.only(
                                                    top: 4, bottom: 4),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 16,
                                                          right: 16,
                                                          top: 12,
                                                          bottom: 12),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: theme
                                                                  .colorScheme
                                                                  .surface,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                    color: LightTheme
                                                                        .shadowColor,
                                                                    blurRadius:
                                                                        LightTheme
                                                                            .blurRadius)
                                                              ],
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .black)),
                                                          child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/default_profile.png',
                                                                width: 60,
                                                              ))),
                                                      const SizedBox(
                                                        width: 16,
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                student.nam!
                                                                        .isNotEmpty
                                                                    ? student
                                                                        .nam!
                                                                    : "مهمان",
                                                                style: theme
                                                                    .textTheme
                                                                    .bodyMedium!
                                                                    .copyWith(
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                              ),
                                                              const SizedBox(
                                                                width: 6,
                                                              ),
                                                              Text(
                                                                  student.namKhanevadegi!
                                                                          .isNotEmpty
                                                                      ? student
                                                                          .namKhanevadegi!
                                                                      : "تواناجو",
                                                                  style: theme
                                                                      .textTheme
                                                                      .bodyMedium!
                                                                      .copyWith(
                                                                          fontWeight:
                                                                              FontWeight.w600)),
                                                            ],
                                                          ),
                                                          if (student
                                                              .reshtehTahsili!
                                                              .isNotEmpty)
                                                            Text(
                                                                student
                                                                    .reshtehTahsili!,
                                                                style: theme
                                                                    .textTheme
                                                                    .bodySmall!
                                                                    .copyWith(
                                                                        fontWeight: FontWeight
                                                                            .w600,
                                                                        color: theme
                                                                            .colorScheme
                                                                            .primary)),
                                                        ],
                                                      ),
                                                      Expanded(
                                                          child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Text(student
                                                                  .daneshgah!
                                                                  .isNotEmpty
                                                              ? student
                                                                  .daneshgah!
                                                              : 'بوعلی'),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Text(
                                                                  student.maghta!
                                                                          .isNotEmpty
                                                                      ? student
                                                                          .maghta!
                                                                      : 'کارشناسی',
                                                                  style: theme
                                                                      .textTheme
                                                                      .bodySmall!
                                                                      .copyWith(
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          color: LightTheme.secondaryTextColor)),
                                                              const SizedBox(
                                                                width: 4,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  const Icon(
                                                                    Icons
                                                                        .location_on_sharp,
                                                                    color: Color.fromARGB(
                                                                        255,
                                                                        221,
                                                                        32,
                                                                        19),
                                                                    size: 15,
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 4,
                                                                  ),
                                                                  Text(
                                                                      student.mahalZendegi!.isNotEmpty
                                                                          ? student
                                                                              .mahalZendegi!
                                                                          : "همدان",
                                                                      style: theme
                                                                          .textTheme
                                                                          .bodySmall!
                                                                          .copyWith(
                                                                              fontWeight: FontWeight.w600,
                                                                              color: LightTheme.secondaryTextColor)),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  } else if (state is StudentGetLoading) {
                    return const SizedBox(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (state is StudentGetFailed) {
                    return const Center(
                      child: Text('خطا!'),
                    );
                  } else {
                    throw Exception('state not supported');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
