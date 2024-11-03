import 'package:flutter/material.dart';
import 'package:focal2/core/const_data/app_color.dart';
import 'package:focal2/widgets/app_bar_icon.dart';
import 'package:get/get.dart';
import '../controller/favourite_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final FavouriteController favouriteController = Get.find();
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: AppColor.background_color,
        appBar: AppBar(
          backgroundColor: AppColor.background_color,
          elevation: 0,
          leading: AppBarIcon(
            icon: Icon(Icons.arrow_back, size: 15.sp, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },),
          centerTitle: true,
          title: Text(
            'Favourite',
            style: TextStyle(
              fontFamily: 'Raleway-Bold',
              fontSize: 12.sp,
              color: Colors.black,
            ),),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: SvgPicture.asset(
                'assets/icon/favorite.svg',
                width: 24.w,
                height: 24.h,
              ),),],),
        body: GetBuilder<FavouriteController>(
          init: FavouriteController(),
          builder: (controller) {
            return Padding(
              padding: EdgeInsets.all(16.w),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
                  childAspectRatio: 0.75,
                ),
                itemCount: controller.favourites.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = controller.favourites[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Image.asset(
                                item['image'],
                                width: 125.w,
                                height: 125.h,
                              ),),
                            Positioned(
                              top: 10.h, left: 10.w,
                              child: CircleAvatar(
                                backgroundColor: Colors.grey[200],
                                radius: 16.r,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 16.sp,),
                                  onPressed: () {
                                    // controller.removeFromFavourites(item['id']);
                                     },
                                ),
                              ),),],),
                        Padding(
                          padding: EdgeInsets.all(8.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (item['isBestSeller'])
                                Text(
                                  'BEST SELLER',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              SizedBox(height: 8.h),
                              Text(
                                item['title'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Row(
                                children: [
                                  Text(
                                    '\$${item['price']}',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 40.w),
                                  Row(
                                    children: [
                                      Container(
                                        width: 10.w, height: 10.h,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.red,
                                        ),
                                      ),
                                      SizedBox(width: 8.w),
                                      Container(
                                        width: 10.w,
                                        height: 10.h,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.blue,
                                        ),
                                      ),],),],),],),),],),);},),);},),));
  }
}
