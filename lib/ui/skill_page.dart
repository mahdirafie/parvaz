
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parvaz_event/data/minor/bloc/minor_bloc.dart';
import 'package:parvaz_event/data/minor/minor_repo.dart';
import 'package:parvaz_event/ui/course/courses_show.dart';

class SkillPage extends StatelessWidget {
  const SkillPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> keys;
    List<int> values;
    final theme = Theme.of(context);
    return BlocProvider(create: (context) {
      final bloc = MinorBloc(minorRepository)..add(GetPopularSkills());
      return bloc;
      },
    child: Scaffold(
        appBar: AppBar(
          title: const Text("محبوب ترین"),
        ),
        body: BlocBuilder<MinorBloc,MinorState>(
          builder: (context, MinorState state) {
            if (state is PopularSkillLoading){
              return const Center(child: CircularProgressIndicator(),);
            }
            else if(state is PopularSkillSuccess){
              return ListView.builder(
                itemCount: state.list.length,
                itemBuilder: (context, index) {
                  var key = state.list.keys.elementAt(index);
                  var value = state.list[key];
                  return InkWell(onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CoursesShow(name: key),));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(

                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(key,style: theme.textTheme.titleLarge),
                          Text(value.toString(),style: theme.textTheme.titleLarge)
                        ],
                      ),
                    ),
                  ),);
                },
              );
            }
            else if(state is PopularSkillFailed){
              return const Center(child: Text(" داده ای یافت نشد"),);
            }
            else{
              throw();
            }
          }
        )
    ),
    );
  }
}
