import 'package:get/get.dart';

import '../studentModel.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  var studentList =[].obs;
  var hobbyList =['Travelling','Fishing'].obs;
  final count = 0.obs;

  var hobbyaddList =[].obs;
  var countHobby=0.obs;
  Map sMap = {}.obs;




  var  student = <Student>[].obs;
  var studentName = TextEditingController();
  var studentId = TextEditingController();
  var hobby =<Hobby>[].obs;
  var hobbyVal =''.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
  void hobbyIncrement() => countHobby.value++;
}
