import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_amit_g4/features/main/products/model.dart';

import '../../../../../../core/design/app_button.dart';
import '../../../../../../core/design/app_image.dart';

class ItemProduct extends StatelessWidget {
  final ProductModel model;

  const ItemProduct({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(9.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: AppImage(
                    model.mainImage,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 1.h),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadiusDirectional.only(
                          topEnd: Radius.circular(11.r),
                          bottomStart: Radius.circular(7.r))),
                  child: Text(
                    "-${model.discount}%",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontSize: 14.sp,
                        height: 1.4.h,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          Text(
            model.title,
            style: TextStyle(
                fontSize: 16.sp,
                height: 2.1.h,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).primaryColor),
          ),
          Text(
            "السعر / 1${model.unit.name}",
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
                color: Color(0xff808080)),
          ),
          SizedBox(height: 3.h),
          Row(
            children: [
              Text(
                "${model.price} ر.س",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColor),
              ),
              SizedBox(
                width: 3.w,
              ),
              Text(
                "${model.priceBeforeDiscount} ر.س",
                style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w300,
                    decoration: TextDecoration.lineThrough,
                    color: Theme.of(context).primaryColor),
              ),
            ],
          ),
          SizedBox(height: 19.h),
          SizedBox(
            height: 30.h,
            child: AppButton(
              text: "أضف للسلة",
              onPress: () {},
            ),
          )
        ],
      ),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(17.r), boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(.09),
            offset: Offset(0, 2),
            blurRadius: 11,
            blurStyle: BlurStyle.outer)
      ]
              // color: Colors.red,
              ),
    );
  }
}
