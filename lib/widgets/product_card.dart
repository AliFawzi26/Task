import 'package:focal2/core/const_data/app_color.dart';
import 'package:focal2/core/const_data/app_image.dart';
import 'package:focal2/view/favourite_screen/controller/favourite_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../core/const_data/responsive.dart';
import '../model/product_model.dart';
import '../view/details_screen/details/details_screen.dart';
import 'favourite_button.dart';

class ProductCard extends StatelessWidget {
  final void Function()? onTap;
  final ProductModel product;

  const ProductCard({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(DetailsPage(productModel: product)),
      child: Container(
        width: Responsive(context).screenWidth * 0.45,
        height: 250.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GetBuilder<FavouriteController>(
                    init: FavouriteController(),

    builder: (controller) {

    return IconButton(
    onPressed: () {
     
    },
    icon: SvgPicture.asset(
    AppImage.favorite,
    height: 20,

    ),
    );
    },
                  ),
                  Image.asset(
                    AppImage.t_shirt2,
                    height: Responsive(context).screenWidth * 0.25,
                    width: Responsive(context).screenWidth * 0.25,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Best Seller',
                style: TextStyle(
                  color: AppColor.primarycolor,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 13.sp,
                ),
              ),
              SizedBox(height: 5),
              Text(
                product.data.name,
                style: TextStyle(
                  color: AppColor.text,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 7),
              Spacer(),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '\$ ${product.data.price}',
                      style: TextStyle(
                        color: AppColor.blacktext,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 35,
                    width: 34,
                    decoration: BoxDecoration(
                      color: AppColor.primarycolor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}