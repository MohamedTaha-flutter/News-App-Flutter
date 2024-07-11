import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Widget/NewsWidget.dart';
import 'package:news/bloc/cubit.dart';
import 'package:news/bloc/state.dart';


class SportsPage extends StatelessWidget {
  const SportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        if(cubit.sport.isNotEmpty)
        {
          return Scaffold(
              body: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => newsWidget(cubit.sport[index]),
                separatorBuilder: (context, index) =>
                const SizedBox(
                  height: 10,
                ),
                itemCount: 10,
              ));
        }else
        {
          return Center(child: const CircularProgressIndicator()) ;
        }
      },
    );
  } }
