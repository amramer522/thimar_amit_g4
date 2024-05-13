import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:thimar_amit_g4/core/design/app_button.dart';
import 'package:thimar_amit_g4/core/design/app_image.dart';
import 'package:thimar_amit_g4/features/main/products/bloc.dart';
import 'package:thimar_amit_g4/views/main/home_nav/pages/home/components/iten_product.dart';

class ProductsSection extends StatefulWidget {
  const ProductsSection({Key? key}) : super(key: key);

  @override
  State<ProductsSection> createState() => _ProductsSectionState();
}

class _ProductsSectionState extends State<ProductsSection> {
  final bloc = GetIt.instance<ProductsBloc>()..add(GetProductsEvent());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "الأصناف",
            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w800),
          ),
          SizedBox(height: 7.h),
          BlocBuilder(
            bloc: bloc,
            builder: (context, state) {
              if (state is GetProductsFailedState) {
                return Text(state.msg);
              } else if (state is GetProductsSuccessState) {
                return GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.w,
                      childAspectRatio: 163.w / 250.h,
                      mainAxisSpacing: 16.h),
                  itemCount: state.list.length,
                  itemBuilder: (context, index) => ItemProduct(
                    model: state.list[index],
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
