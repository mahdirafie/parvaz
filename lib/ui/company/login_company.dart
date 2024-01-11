import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parvaz_event/data/auth/bloc/company_login_bloc.dart';
import 'package:parvaz_event/data/auth/bloc/company_sign_up_bloc.dart';
import 'package:parvaz_event/data/auth/repository/company_auth_repo.dart';
import 'package:parvaz_event/ui/root/company_root.dart';

class LoginCompany extends StatefulWidget {
  const LoginCompany({Key? key, required this.loginPage}) : super(key: key);
  final ValueChanged<bool> loginPage;

  @override
  State<LoginCompany> createState() => _LoginCompanyState();
}

class _LoginCompanyState extends State<LoginCompany> {
  final TextEditingController _idcode = TextEditingController();
  final TextEditingController _password = TextEditingController();
  StreamSubscription<CompanyLoginState>? streamSubscription;

  @override
  void dispose() {
    _idcode.dispose();
    _password.dispose();
    streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider<CompanyLoginBloc>(
      create: (BuildContext context) {
        final bloc = CompanyLoginBloc(companyAuthRepository);
        streamSubscription = bloc.stream.listen((state) {
          if (state is CompanyLoginSuccess) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CompanyRootScreen()));
          } else if (state is CompanyLoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ));
          } else {}
        });
        return bloc;
      },
      child: Scaffold(
        body: Center(
            child: SingleChildScrollView(
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
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    controller: _idcode,
                    decoration: const InputDecoration(hintText: 'شناسه ملی'),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _password,
                    decoration: const InputDecoration(hintText: 'کد ثبت'),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  BlocBuilder<CompanyLoginBloc, CompanyLoginState>(
                      builder: (BuildContext context, CompanyLoginState state) {
                    return ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CompanyLoginBloc>(context).add(
                            CompanyLoginButtonClicked(
                                idMeli: int.parse(_idcode.text),
                                sabt: int.parse(_password.text)));
                      },
                      child: state != CompanyLoginLoading
                          ? const Text('ورود')
                          : CircularProgressIndicator(
                              color: theme.colorScheme.onPrimaryContainer,
                            ),
                    );
                  }),
                  const SizedBox(
                    height: 2,
                  ),
                  TextButton(
                      onPressed: () {
                        widget.loginPage(false);
                      },
                      child: const Text('آیا حسابی ندارید؟'))
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
