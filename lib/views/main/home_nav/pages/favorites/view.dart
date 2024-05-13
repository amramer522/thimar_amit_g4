import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/design/app_button.dart';
import '../../../../../core/design/app_image.dart';
import '../../../../../features/main/favorites/bloc.dart';
import '../home/components/iten_product.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final bloc = GetIt.instance<FavoritesBloc>()
    ..add(GetFavoritesEvent());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("المفضلة"),
      ),
      body: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is GetFavoritesFailedState) {
            return Text(state.msg);
          } else if (state is GetFavoritesSuccessState) {
            return Center(child: Text("FavoritesPage"),);
          // return GridView.builder(
          //   padding: EdgeInsets.all(16.r),
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2,
          //       crossAxisSpacing: 16.w,
          //       childAspectRatio: 163.w / 250.h,
          //       mainAxisSpacing: 16.h),
          //   itemCount: 10,
          //   itemBuilder: (context, index) => ItemProduct(),
          // );
          } else {
          return Center(
          child: CircularProgressIndicator(),
          );
          }
        },
      ),
    );
  }
}
