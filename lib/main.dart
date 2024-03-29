import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      //lihat di google-services.json
      apiKey: "AIzaSyAjepKB3hVDOw8psS4_PQAVBMFxbGqZ_rQ", //"current_key"
      appId:
          "1:680096043413:android:98a15e845e739ec2ff669c", //"mobilesdk_app_id"
      messagingSenderId: "680096043413", //"project_number"
      projectId: "my-firebase-projek", //"project_id"
    ),
  );
  runApp(
    ScreenUtilInit(
      child: GetMaterialApp(
        title: "tugas6-2-sugiarti",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
