import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parvaz_event/data/constants.dart';
import 'package:parvaz_event/theme.dart';
import 'package:parvaz_event/ui/common/common.dart';

class CompanyDetailsScreen extends StatelessWidget {
  const CompanyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        foregroundColor: theme.colorScheme.onPrimary,
        onPressed: () {},
        label: const Text('ذخیره'),
        backgroundColor: theme.colorScheme.primary,
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      resizeToAvoidBottomInset: true,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          Directionality(
            textDirection: TextDirection.ltr,
            child: SliverAppBar(
              leading:
                  Container(),
              backgroundColor: theme.colorScheme.primary,
              stretch: true,
             
              expandedHeight: 300.0,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.only(left: 25, bottom: 25),
                title: Container(
                    decoration: BoxDecoration(boxShadow: const [
                      BoxShadow(color: Colors.white, blurRadius: 30)
                    ], borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      'اسم شرکت',
                      style: theme.textTheme.titleLarge,
                    )),
                background: Image.asset(
                  'assets/images/company_profile.jpg',
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.message),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              'پیام شرکت به شما:',
                              style: theme.textTheme.bodyLarge!
                                  .copyWith(fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text('با سلام')
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
                        Text(
                          'اطلاعات شرکت',
                          style: theme.textTheme.bodyLarge!
                              .copyWith(fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('نام شرکت: '),
                            Text(
                              'نام شرکت',
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
                            const Text('آدرس شرکت: '),
                            Text(
                              'آدرس',
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
                            const Text('ایمیل: '),
                            Text(
                              'ایمیل',
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
                            const Text('شماره تلفن: '),
                            Text(
                              '213135484848',
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
                        Text(
                          'دوره ها',
                          style: theme.textTheme.bodyLarge!
                              .copyWith(fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          'لیست مهارت هایی که دوره برای آنها توسط این شرکت ارايه میشود:',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            SkillContainer(
                              skill: skills[15],
                            ),
                            SkillContainer(
                              skill: skills[16],
                            ),
                            SkillContainer(
                              skill: skills[18],
                            ),
                          ],
                        ),
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
