import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/cubit.dart';
import 'package:news/bloc/state.dart';
import 'package:news/network/remote/dio_helper.dart';
import 'package:news/pages/searchPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text("News App"),
            actions: [
              IconButton(
                onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)
                  {
                    return  const SearchPage();
                  }));
                },
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: ()
                {
                  cubit.changeThemeMode();
                },
                icon:cubit.isDark ? Icon(Icons.brightness_4_outlined) : Icon(Icons.brightness_4),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            items: cubit.items,
            onTap: (index)
            {
              cubit.changeNavBar(index) ;
            },

          ),
          body: cubit.pages[cubit.currentIndex],
        );
      },
    );
  }
}
