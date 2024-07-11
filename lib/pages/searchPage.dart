import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Widget/NewsWidget.dart';
import 'package:news/bloc/cubit.dart';
import 'package:news/bloc/state.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        dynamic cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Search  must't be Empty ";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    NewsCubit.get(context).getSearchData(value);
                  },
                  decoration: const InputDecoration(
                      label: Text("Search"),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder()),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
