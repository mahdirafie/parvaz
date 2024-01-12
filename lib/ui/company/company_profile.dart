import 'package:flutter/material.dart';
import 'package:parvaz_event/data/DTO/companyDTO.dart';
import 'package:parvaz_event/theme.dart';
import 'package:parvaz_event/ui/company/waiting_confirmed_students.dart';

class CompanyProfile extends StatelessWidget {
  const CompanyProfile({super.key, required this.company});
  final CompanyDTO company;

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
              expandedHeight: 300.0,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.only(left: 25, bottom: 25),
                title: Container(
                    decoration: BoxDecoration(boxShadow: const [
                      BoxShadow(color: Colors.white, blurRadius: 30)
                    ], borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      company.companyName!.isNotEmpty
                          ? company.companyName!
                          : 'شرکت',
                      style: theme.textTheme.titleLarge,
                    )),
                background: Image.asset(
                  'assets/images/company_profile.png',
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
                              company.companyName!.isNotEmpty
                                  ? company.companyName!
                                  : 'شرکت',
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
                              company.address!.isNotEmpty
                                  ? company.address!
                                  : 'شرکت',
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
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const WaitingAndConfirmedStudents();
                  },
                ));
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 12, bottom: 12),
                child: Container(
                  alignment: Alignment.center,
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
                      child: Text(
                        'مشاهده دانشجویان',
                        style: theme.textTheme.bodyLarge!
                            .copyWith(fontWeight: FontWeight.w800),
                      )),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
              child: SizedBox(
            height: 80,
          ))
        ],
      ),
    );
  }
}
