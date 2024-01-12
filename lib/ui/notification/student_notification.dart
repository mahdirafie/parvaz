import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parvaz_event/data/DTO/companyDTO.dart';
import 'package:parvaz_event/data/notification/bloc/notification_bloc.dart';
import 'package:parvaz_event/data/notification/notification_repo.dart';
import 'package:parvaz_event/theme.dart';
import 'package:parvaz_event/ui/company/company_details.dart';

class StudentNotificationScreen extends StatelessWidget {
  const StudentNotificationScreen({super.key, required this.meli});

  final int meli;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) {
        final bloc = NotificationBloc(getAllNotification)
          ..add(GetAllNotification(meli: meli));
        return bloc;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("درخواست ها"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<NotificationBloc, NotificationState>(
                  builder: (context, NotificationState state) {
                if (state is GetAllNotificationSuccess) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          requestWidget(context,state.companys[index]),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      );
                    },
                    itemCount: state.companys.length,
                  );
                }
                else if(state is GetAllNotificationLoading){
                  return const Center(child: CircularProgressIndicator(),);
                }
                else {
                  throw();
                }
              }),
              SizedBox(
                height: 1000,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget requestWidget(BuildContext context, CompanyDTO company) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return CompanyDetailsScreen(company: company,);
          },
        ));
      },
      child: Container(
        padding: const EdgeInsets.only(left: 12, top: 8, right: 12, bottom: 8),
        margin: const EdgeInsets.fromLTRB(25, 4, 25, 4),
        decoration: const BoxDecoration(),
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
                Text(company.companyName??""),
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
                      company.address??"",
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
                    child: const Icon(
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
