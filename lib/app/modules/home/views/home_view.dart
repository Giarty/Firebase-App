import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 50.w),
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: ListView(
            children: [
              Center(
                child: Text(
                  "Recipe Input",
                  style: TextStyle(
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 127, 62, 62)),
                ),
              ),
              SizedBox(
                height: 35.h,
              ),
              TextField(
                controller: controller.titleC,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 127, 62, 62)),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Title...",
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal)),
              ),
              SizedBox(height: 20.h),
              TextField(
                controller: controller.timeEstimationC,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 127, 62, 62)),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Time estimation...",
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal)),
              ),
              SizedBox(height: 20.h),
              TextField(
                controller: controller.typeC,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 127, 62, 62)),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Minuman/Makanan",
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(height: 20.h),
              TextField(
                controller: controller.instructionC,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 127, 62, 62)),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Instruction...",
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal),
                ),
                maxLines: 4,
              ),
              SizedBox(height: 20.h),
              TextField(
                controller: controller.ingredientsC,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 127, 62, 62)),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Ingredients...",
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal),
                ),
                maxLines: 4,
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                onPressed: () {
                  controller.addRecipe(
                      controller.titleC.text,
                      int.parse(controller.timeEstimationC.text),
                      controller.typeC.text,
                      controller.ingredientsC.text,
                      controller.instructionC.text);
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green)),
                child: Text(
                  "Submit",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.offNamed(Routes.RECIPE);
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.red)),
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
