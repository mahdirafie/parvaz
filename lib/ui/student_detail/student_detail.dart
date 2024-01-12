import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parvaz_event/data/DTO/companyDTO.dart';
import 'package:parvaz_event/data/DTO/studentDTO.dart';
import 'package:parvaz_event/data/auth/repository/company_cooperate_repo.dart';
import 'package:parvaz_event/theme.dart';
import 'package:parvaz_event/ui/common/common.dart';
import 'package:parvaz_event/ui/company/bloc/cooperation_bloc.dart';

class StudentDetailScreen extends StatefulWidget {
  final StudentDTO student;
  final CompanyDTO company;
  const StudentDetailScreen({super.key, required this.student, required this.company});

  @override
  State<StudentDetailScreen> createState() => _StudentDetailScreenState();
}

class _StudentDetailScreenState extends State<StudentDetailScreen> {
  StreamSubscription<CooperationState>? subscription;

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.student.maharats!.remove('');
    debugPrint(widget.student.maharats!.length.toString());
    final theme = Theme.of(context);
    return BlocProvider<CooperationBloc>(
      create: (BuildContext context) {
        final bloc = CooperationBloc(cooperateRepository);
        subscription = bloc.stream.listen((state) {
          if (state is CooperationSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.green,
            ));
          } else if (state is CooperationFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ));
          } else if (state is SaveForCooperationSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.green,
            ));
          } else if (state is SaveForCooperationFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ));
          }
        });
        return bloc;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            Directionality(
              textDirection: TextDirection.ltr,
              child: SliverAppBar(
                leading: Container(),
                backgroundColor: theme.colorScheme.primary,
                stretch: true,
                onStretchTrigger: () {
                  return Future<void>.value();
                },
                expandedHeight: 300.0,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: const EdgeInsets.only(left: 25, bottom: 25),
                  title: Container(
                      decoration: BoxDecoration(boxShadow: const [
                        BoxShadow(color: Colors.white, blurRadius: 30)
                      ], borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        children: [
                          Text(
                            widget.student.namKhanevadegi!.isNotEmpty
                                ? widget.student.namKhanevadegi!
                                : 'تواناجو',
                            style: theme.textTheme.titleLarge,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            widget.student.nam!.isNotEmpty
                                ? widget.student.nam!
                                : 'مهمان',
                            style: theme.textTheme.titleLarge,
                          ),
                        ],
                      )),
                  background: Image.asset(
                    'assets/images/default_profile.png',
                    fit: BoxFit.cover,
                  ),
                  stretchModes: const [
                    StretchMode.zoomBackground,
                    StretchMode.fadeTitle,
                  ],
                ),
                pinned: true,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 12, bottom: 12),
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: LightTheme.shadowColor,
                            blurRadius: LightTheme.blurRadius)
                      ],
                      color: theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 12, 25, 12),
                      child: Column(
                        children: [
                          Text(
                            'اطلاعات دانشجو',
                            style: theme.textTheme.bodyLarge!
                                .copyWith(fontWeight: FontWeight.w800),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    const Text('نام: '),
                                    Expanded(
                                        child: Text(
                                      widget.student.nam!.isNotEmpty
                                          ? widget.student.nam!
                                          : 'مهمان',
                                      textAlign: TextAlign.center,
                                      style: theme.textTheme.bodyMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.w600),
                                    )),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('نام خانوادگی: '),
                                    Text(
                                      widget.student.namKhanevadegi!.isNotEmpty
                                          ? widget.student.namKhanevadegi!
                                          : 'تواناجو',
                                      textAlign: TextAlign.center,
                                      style: theme.textTheme.bodyMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('دانشگاه: '),
                              Text(
                                widget.student.daneshgah!.isNotEmpty
                                    ? widget.student.daneshgah!
                                    : 'بوعلی',
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodyMedium!
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('رشته تحصیلی: '),
                              Text(
                                widget.student.reshtehTahsili!.isNotEmpty
                                    ? widget.student.reshtehTahsili!
                                    : '--',
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodyMedium!
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('محل زندگی: '),
                              Text(
                                widget.student.maghta!.isNotEmpty
                                    ? widget.student.mahalZendegi!
                                    : 'همدان',
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodyMedium!
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('معدل: '),
                              Text(
                                widget.student.moadel != 0
                                    ? widget.student.moadel!.toString()
                                    : '--',
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodyMedium!
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
              ),
            ),
            if (widget.student.maharats!.isNotEmpty)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 25, right: 25, top: 12, bottom: 12),
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: LightTheme.shadowColor,
                              blurRadius: LightTheme.blurRadius)
                        ],
                        color: theme.colorScheme.surface,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 12, 25, 12),
                        child: Column(
                          children: [
                            Text(
                              'مهارت ها',
                              style: theme.textTheme.bodyLarge!
                                  .copyWith(fontWeight: FontWeight.w800),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Wrap(
                              alignment: WrapAlignment.center,
                              children: widget.student.maharats!.map((item) {
                                return SkillContainer(
                                  skill: item,
                                );
                              }).toList(),
                            )
                          ],
                        )),
                  ),
                ),
              ),
            if (widget.student.tozihatEzafe!.trim().isNotEmpty)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 25, right: 25, top: 12, bottom: 12),
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: LightTheme.shadowColor,
                              blurRadius: LightTheme.blurRadius)
                        ],
                        color: theme.colorScheme.surface,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 12, 25, 12),
                        child: Column(
                          children: [
                            Text(
                              'رزومه',
                              style: theme.textTheme.bodyLarge!
                                  .copyWith(fontWeight: FontWeight.w800),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              widget.student.tozihatEzafe!,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )),
                  ),
                ),
              ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: BlocBuilder<CooperationBloc, CooperationState>(
                  builder: (BuildContext context, CooperationState state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<CooperationBloc>(context).add(CooperationButtonClicked(codeMeli: widget.student.codeMeli!, shenaseComp: widget.company.shenaseMeli!, explanation: 'You are invited to cooperate with us!', isConfirmed: true));
                            },
                            child: state is! CooperationLoading
                                ? const Text('درخواست همکاری')
                                : const CircularProgressIndicator()),
                        const SizedBox(
                          width: 16,
                        ),
                        ElevatedButton(
                          onPressed: () {
                              BlocProvider.of<CooperationBloc>(context).add(SaveForCooperationButtonClicked(codeMeli: widget.student.codeMeli!, shenaseComp: widget.company.shenaseMeli!, explanation: 'You are Saved to cooperate with us!', isConfirmed: false));

                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  theme.colorScheme.secondary),
                              foregroundColor: MaterialStatePropertyAll(
                                  theme.colorScheme.onSecondary)),
                          child: state is! SaveForCooperationLoading? const Text('ذخیره کردن'): const CircularProgressIndicator(),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
            const SliverToBoxAdapter(
                child: SizedBox(
              height: 80,
            ))
          ],
        ),
      ),
    );
  }
}
