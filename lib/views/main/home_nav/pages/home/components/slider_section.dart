import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';
import 'package:thimar_amit_g4/core/design/app_image.dart';
import 'package:thimar_amit_g4/features/main/slider/bloc.dart';

class SliderSection extends StatefulWidget {
  const SliderSection({Key? key}) : super(key: key);

  @override
  State<SliderSection> createState() => _SliderSectionState();
}

class _SliderSectionState extends State<SliderSection> {
  int currentImage = 0;

  final bloc = GetIt.instance<SliderBloc>()..add(GetSliderEvent());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is GetSliderFailedState) {
            return Text(state.msg);
          } else if (state is GetSliderSuccessState) {
            return Padding(
              padding: EdgeInsets.only(top: 16.h),
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        currentImage = index;
                        setState(() {});
                      },
                      autoPlayCurve: Curves.linear,
                    ),
                    itemCount: state.list.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        AppImage(
                      state.list[itemIndex].media,
                      fit: BoxFit.fill,
                      height: 164.h,
                      width: double.infinity,
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    margin: EdgeInsets.only(bottom: 7.h),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(.8),
                        borderRadius: BorderRadius.circular(9.r)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        state.list.length,
                        (index) => Padding(
                          padding: EdgeInsetsDirectional.only(end: 3.w),
                          child: CircleAvatar(
                            radius: 3.5.w,
                            backgroundColor: currentImage == index
                                ? Colors.white
                                : Colors.white.withOpacity(.38),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return _Loading();
          }
        });
  }
}

class _Loading extends StatelessWidget {
  const _Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Shimmer.fromColors(
        child: Container(
          height: 180.h,
          margin: EdgeInsets.only(top: 16),
          width: double.infinity,
          color: Colors.grey.withOpacity(.6),
        ),
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.white,
      ),
    );
  }
}
