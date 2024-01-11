import 'package:flutter/material.dart';
import 'package:parvaz_event/theme.dart';
import 'package:parvaz_event/ui/common/common.dart';

class StudentDetailScreen extends StatelessWidget {
  const StudentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
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
                    child: Text(
                      'مهدی رفیعی',
                      style: theme.textTheme.titleLarge,
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
                                    'مهدی',
                                    textAlign: TextAlign.center,
                                    style: theme.textTheme.bodyMedium!
                                        .copyWith(fontWeight: FontWeight.w600),
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
                                    'رفیعی',
                                    textAlign: TextAlign.center,
                                    style: theme.textTheme.bodyMedium!
                                        .copyWith(fontWeight: FontWeight.w600),
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
                              'بوعلی سینا',
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
                              'مهندسی صنایع',
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
                              'همدان',
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
                              '18',
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
                        Text('مهارت ها', style: theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w800),),
                        const SizedBox(height: 16,),
                        Wrap(
                          alignment: WrapAlignment.center,
                          children: List.generate(10, (index) => SkillContainer(skill: "*" * (index + 1))),
                        )
                      ],
                    )),
              ),
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
                        Text('رزومه', style: theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w800),),
                        SizedBox(height: 16,),
                        Text('رزومه'),
                      ],
                    )),
              ),
            ),
          ),
          const SliverToBoxAdapter(
              child: const SizedBox(
            height: 80,
          ))
        ],
      ),
    );
  }
}
