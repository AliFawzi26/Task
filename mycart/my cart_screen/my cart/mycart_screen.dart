import 'package:focal2/core/const_data/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controller/cart_controller.dart';
import '../widget/contanier_price.dart';
class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: AppColor.background_color,
        appBar: AppBar(
          backgroundColor: AppColor.background_color,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'My Cart',
            style: TextStyle(
              fontFamily: 'Raleway-Bold',
              fontSize: 16.sp,
              color: Colors.black,
            ),),),
        body: GetBuilder<CartController>(
          init: CartController(),
          builder: (controller) {
            return Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Items',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.items.length,
                      itemBuilder: (context, index) {
                        var item = controller.items[index];
                        return SizedBox(
                          width: double.infinity,
                          child: Slidable(
                            key: Key(item['name'] as String),
                            startActionPane: ActionPane(
                              motion: const StretchMotion(),
                              extentRatio: 0.4,
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    controller.decrementQuantity(index);
                                  },
                                  backgroundColor: AppColor.primarycolor.withOpacity(0.7),
                                  foregroundColor: Colors.white,
                                  icon: Icons.remove,
                                ),
                                SlidableAction(
                                  onPressed: (context) {
                                    controller.incrementQuantity(index);
                                  },
                                  backgroundColor: AppColor.primarycolor,
                                  foregroundColor: Colors.white,
                                  icon: Icons.add,
                                ),
                              ],
                            ),
                            endActionPane: ActionPane(
                              motion: const StretchMotion(),
                              extentRatio: 0.2,
                              children: [
                                SlidableAction(
                                  onPressed: (context) async {
                                    bool confirm = await showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text('Confirm Delete'),
                                        content: Text('Are you sure you want to delete this item?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.of(context).pop(false),
                                            child: Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              controller.removeItem(index);
                                              Navigator.of(context).pop(true);
                                            },
                                            child: Text('Delete'),
                                          ),
                                        ],),);},
                                  backgroundColor: AppColor.icondelete,
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete_outline,
                                  label: 'Delete',
                                ),],),
                            child: Container(
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    item['image'] as String,
                                    width: 80.w,
                                    height: 80.h,
                                  ),
                                  SizedBox(width: 10.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item['name'] as String,
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(height: 5.h),
                                        Text(
                                          '\$${(item['price'] as double).toStringAsFixed(2)}',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],),),),);},),),
                  SizedBox(height: 10.h),
                  Contanierprice(),
                ],
              ),
            );
          },
        ),),);
  }
}
