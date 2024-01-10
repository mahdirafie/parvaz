import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parvaz_event/ui/auth/login_student.dart';
import 'package:parvaz_event/ui/auth/student_contact_info.dart';

class SignUpStudentScreen extends StatefulWidget {
  const SignUpStudentScreen({super.key, required this.loginPage});
  final ValueChanged<bool> loginPage;

  @override
  State<SignUpStudentScreen> createState() => _SignUpStudentScreenState();
}

class _SignUpStudentScreenState extends State<SignUpStudentScreen> {
  final TextEditingController _idCode = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  @override
  void dispose() {
    _idCode.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/icon.png',
                width: 100,
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                controller: _idCode,
                decoration: const InputDecoration(hintText: 'کد ملی'),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: _password,
                decoration: const InputDecoration(hintText: 'رمز عبور'),
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: _confirmPassword,
                decoration: const InputDecoration(hintText: 'تایید رمز عبور'),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: dropDown(context)),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(onPressed: () {
                   Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const GetStudentContantInfoScreen();
              },));
              }, child: const Text('ثبت نام')),
              const SizedBox(
                height: 2,
              ),
              TextButton(
                  onPressed: () {
                    widget.loginPage(true);
                  },
                  child: const Text('آیا در حال حاضر حسابی دارید؟'))
            ],
          ),
        ),
      )),
    );
  }

  List<String> universities = ['دانشگاه بوعلی سینا', 'دانشگاه صنعتی همدان'];

  String selectedUniversity = 'دانشگاه بوعلی سینا';

  Widget dropDown(BuildContext context) {
    final theme = Theme.of(context);
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        hint: const Text('select'),
        value: selectedUniversity,
        items: universities.map((String item) {
          return DropdownMenuItem<String>(
            alignment: Alignment.center,
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: (value) {
          if (value != selectedUniversity && value != null) {
            setState(() {
              selectedUniversity = value;
            });
          }
        },
        buttonStyleData: ButtonStyleData(
          height: 50,
          width: 160,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: Colors.black26,
            ),
            color: theme.colorScheme.background,
          ),
          elevation: 2,
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_downward_outlined,
          ),
          iconSize: 15,
          iconEnabledColor: Colors.black,
          iconDisabledColor: Colors.black,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 250,
          width: MediaQuery.of(context).size.width * 0.6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: theme.colorScheme.background,
          ),
          offset: const Offset(0, -5),
          padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
          scrollbarTheme: ScrollbarThemeData(
            interactive: true,
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all<double>(8),
            thumbVisibility: MaterialStateProperty.all<bool>(true),
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
          height: 50,
          selectedMenuItemBuilder: (context, child) {
            return Container(
              decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(15),
                  border:
                      Border.all(color: theme.colorScheme.primary, width: 2)),
              child: child,
            );
          },
          padding: const EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }
}
