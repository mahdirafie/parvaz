import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parvaz_event/ui/company/company_details.dart';

class StudentNotificationScreen extends StatelessWidget {
  const StudentNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 231, 231),
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
              return requestWidget(context);
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
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return CompanyDetailsScreen();
        },));
      },
      child: Container(
        padding: const EdgeInsets.only(left: 12, top: 8, right: 12, bottom: 8),
        margin: const EdgeInsets.fromLTRB(25, 4, 25, 4),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          // boxShadow: const [
          //   BoxShadow(color: Colors.grey, blurRadius: 50),
          // ],
        ),
        width: double.infinity,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(40)),
                child: Image.asset(
                  'assets/images/company_profile.jpg',
                  width: 80,
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('اسم کارخانه'),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const Icon(Icons.location_on, color: Color.fromARGB(255, 255, 17, 0),),
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
                        color: Colors.greenAccent,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.green)),
                    width: 35,
                    child: const Icon(Icons.check, color: Colors.green,),
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
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.red)),
                    width: 35,
                    child: const Icon(Icons.close, color: Colors.red,),
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
