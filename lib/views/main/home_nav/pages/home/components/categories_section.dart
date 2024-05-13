import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';
import 'package:thimar_amit_g4/core/design/app_image.dart';
import 'package:thimar_amit_g4/core/logic/cache_helper.dart';
import 'package:thimar_amit_g4/features/main/categories/bloc.dart';

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({Key? key}) : super(key: key);

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  final bloc = GetIt.instance<CategoriesBloc>()..add(GetCategoriesEvent());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Text(
                  "الأقسام",
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w800),
                ),
                Spacer(),
                TextButton(onPressed: () {}, child: Text("عرض الكل"))
              ],
            ),
          ),
          SizedBox(
            height: 112.h,
            child: BlocBuilder(
                bloc: bloc,
                builder: (context, state) {
                  if (state is GetCategoriesFailedState) {
                    return Text(state.msg);
                  } else if (state is GetCategoriesSuccessState) {
                    return ListView.separated(
                      itemCount: state.list.length,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 16.w),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Container(
                        height: 102.h,
                        width: 100.w,
                        child: Column(
                          children: [
                            Expanded(child: AppImage(state.list[index].media)),
                            SizedBox(height: 2.h),
                            Text(
                              state.list[index].name,
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  } else {
                    return _Loading();
                  }
                }),
          )
        ],
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Column(
        children: [
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Text(
                  "الأقسام",
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w800),
                ),
                Spacer(),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 4,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              separatorBuilder: (context, index) => SizedBox(width: 16.w),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                height: 102.h,
                width: 100.w,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey,
                      ),
                    )),
                    SizedBox(height: 2.h),
                    Container(
                      height: 15,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.white,
    );
  }
}
