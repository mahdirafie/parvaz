import 'package:flutter/material.dart';
import 'package:parvaz_event/ui/profile/profile.dart';
import 'package:parvaz_event/ui/root/student_root.dart';

class GetStudentContantInfoScreen extends StatelessWidget {
  const GetStudentContantInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'در صورت تمایل ایمیل خود را وارد کنید تا پیشنهادات اخیر کاری را از طریق ایمیل دریافت کنید.',
                style: theme.textTheme.bodyLarge!
                    .copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 60,
                child: TextFormField(
                  textDirection: TextDirection.ltr,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(hintText: 'example@gmail.com', hintTextDirection: TextDirection.ltr),
                ),
              ),
              const SizedBox(height: 16,),
              ElevatedButton(onPressed: () {
                //TODO: make request here
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return const RootScreen();
                },));
              }, child: const Text('تمام'))
            ],
          ),
        ),
      ),
    );
  }
}
