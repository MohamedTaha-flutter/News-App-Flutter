import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Widget/NewsWidget.dart';
import 'package:news/bloc/cubit.dart';
import 'package:news/bloc/state.dart';

class SciencePage extends StatelessWidget {
  const SciencePage({super.key});

  @override
  Widget build(BuildContext context)  {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        if(cubit.science.isNotEmpty)
        {
          return Scaffold(
              body: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => newsWidget(cubit.science[index]),
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