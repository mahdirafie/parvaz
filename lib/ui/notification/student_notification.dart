import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parvaz_event/theme.dart';
import 'package:parvaz_event/ui/company/company_details.dart';

class StudentNotificationScreen extends StatelessWidget {
  const StudentNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            title: const Text('درخواست ها'),
            centerTitle: true,
            backgroundColor: theme.colorScheme.primary,
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
          SliverList.builder(
            itemBuilder: (context, index) {
              return Column(
                children: [
                  requestWidget(context),
                  SizedBox(
                    height: 8,
                  ),
                  if (index != 9) const Divider()
                ],
              );
            },
            itemCount: 10,
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 30,
            ),
          )
        ],
      ),
    );
  }

  Widget requestWidget(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return CompanyDetailsScreen();
          },
        ));
      },
      child: Container(
        padding: const EdgeInsets.only(left: 12, top: 8, right: 12, bottom: 8),
        margin: const EdgeInsets.fromLTRB(25, 4, 25, 4),
        decoration: BoxDecoration(),
        width: double.infinity,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(40)),
                child: Image.asset(
                  'assets/images/company_profile.jpg',
                  width: 60,
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('اسم شرکت'),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Color.fromARGB(255, 255, 17, 0),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      'همدان',
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: theme.colorScheme.primary),
                    )
                  ],
                )
              ],
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    //TODO: accept the request
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        border: Border.all(
                            color: LightTheme.borderButtonColor, width: 2)),
                    width: 35,
                    child: Icon(
                      Icons.check,
                      color: LightTheme.borderButtonColor,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                InkWell(
                  onTap: () {
                    //TODO: reject the request
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.redAccent.withOpacity(0.6),
                        border: Border.all(color: Colors.red)),
                    width: 35,
                    child: const Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
