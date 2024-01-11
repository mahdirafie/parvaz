import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompanyDetailsScreen extends StatelessWidget {
  const CompanyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('جزییات شرکت'),
            centerTitle: true,
            backgroundColor: theme.colorScheme.primary,
          ),
          SliverToBoxAdapter(child: Column(
            children: [
              ClipRRect(borderRadius: BorderRadius.circular(100),child: Image.asset('assets/images/company_profile.jpg', width: 100, height: 100,),)
            ],
          ),)
        ],
      ),
    );
  }
}