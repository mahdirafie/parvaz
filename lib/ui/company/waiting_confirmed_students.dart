import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parvaz_event/theme.dart';

class WaitingAndConfirmedStudents extends StatelessWidget {
  const WaitingAndConfirmedStudents({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(title: const Text('دانشجویان'),),
        body: Column(
          children: [
            const TabBar(tabs: [
              Tab(icon: Icon(CupertinoIcons.check_mark),),
              Tab(icon: Icon(CupertinoIcons.bookmark),),
            ]),
            Expanded(child: TabBarView(children: [
              ListView.builder(itemBuilder: (context, index) {
                return const STCard();
              }, itemCount: 7,),
              ListView.builder(itemBuilder: (context, index) {
                return const STCard();
              }, itemCount: 21,),
            ]))
          ],
        ),
        
      ),
    );
  }
}


class STCard extends StatelessWidget {
  const STCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: LightTheme.shadowColor,
                blurRadius: LightTheme.blurRadius)
          ]),
      margin: const EdgeInsets.only(top: 4, bottom: 4),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: theme.colorScheme.surface,
                    boxShadow: [
                      BoxShadow(
                          color: LightTheme.shadowColor,
                          blurRadius: LightTheme.blurRadius)
                    ],
                    border: Border.all(color: Colors.black)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      'assets/images/default_profile.png',
                      width: 60,
                    ))),
            const SizedBox(
              width: 16,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "مهمان",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                        "تواناجو",
                        style: theme.textTheme.bodyMedium!
                            .copyWith(fontWeight: FontWeight.w600)),
                  ],
                ),
                
                  Text("مهندسی برق",
                      style: theme.textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: theme.colorScheme.primary)),
              ],
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('بوعلی'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                         'کارشناسی',
                        style: theme.textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: LightTheme.secondaryTextColor)),
                    const SizedBox(
                      width: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.location_on_sharp,
                          color: Color.fromARGB(255, 221, 32, 19),
                          size: 15,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                            "همدان",
                            style: theme.textTheme.bodySmall!.copyWith(
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
    );
  }
}
