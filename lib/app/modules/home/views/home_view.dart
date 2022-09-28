import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../studentModel.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HomeView'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(height: 5,),
                  // Row(
                  //   children: [
                  //     Text("Student Name",style: TextStyle(fontSize: 12),),
                  //     SizedBox(width: 10,),
                  //     Text("Number: ${controller.count.value}",style: TextStyle(fontSize: 12),),
                  //     // IconButton(onPressed: (){
                  //     //   controller.spanList.removeAt(spanNumber) ;
                  //     // }, icon: Icon(Icons.close))
                  //   ],
                  // ),
                  // SizedBox(height: 5,),
                  // TextFormField(
                  //
                  //   decoration: InputDecoration(
                  //       isDense: true,
                  //       contentPadding: EdgeInsets.fromLTRB(6,14,14,0),
                  //       border: OutlineInputBorder(
                  //         borderRadius: const BorderRadius.all(
                  //           Radius.circular(8.0),
                  //         ),
                  //       ),
                  //       focusedBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(8.0),
                  //         borderSide: BorderSide(
                  //           color: Colors.lightGreen,
                  //         ),
                  //       ),
                  //
                  //       focusColor:Colors.lightGreen,
                  //       filled: true,
                  //       fillColor: Colors.white),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 6),
                  //   child: Text("Student id",style: TextStyle(fontSize: 12),),
                  // ),
                  // TextFormField(
                  //   initialValue: 0.toString(),
                  //   decoration: InputDecoration(
                  //       isDense: true,
                  //       contentPadding: EdgeInsets.fromLTRB(6,14,14,0),
                  //       border: OutlineInputBorder(
                  //         borderRadius: const BorderRadius.all(
                  //           Radius.circular(8.0),
                  //         ),
                  //       ),
                  //       focusedBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(8.0),
                  //         borderSide: BorderSide(
                  //           color: Colors.lightGreen,
                  //         ),
                  //       ),
                  //
                  //       focusColor: Colors.lightGreen,
                  //       filled: true,
                  //       fillColor: Colors.white),
                  // ),
                ],
              ),
              SizedBox(height: 5,),
              Obx(()=>ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.studentList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5,),
                        Row(
                          children: [
                            Text("Student Name",style: TextStyle(fontSize: 12),),
                            SizedBox(width: 10,),
                            Text("Number: ${controller.studentList[index]}",style: TextStyle(fontSize: 12),),
                            IconButton(onPressed: (){
                              controller.studentList.removeAt(index) ;
                              // controller.count.value-=1;
                            }, icon: Icon(Icons.close))
                          ],
                        ),
                        SizedBox(height: 5,),
                        TextFormField(
                          controller: controller.studentName,
                          decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.fromLTRB(6,14,14,0),
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(
                                  color: Colors.lightGreen,
                                ),
                              ),

                              focusColor: Colors.lightGreen,
                              filled: true,
                              fillColor: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Text("Student id",style: TextStyle(fontSize: 12),),
                        ),
                        TextFormField(
                          controller: controller.studentId,
                          decoration: InputDecoration(

                              isDense: true,
                              contentPadding: EdgeInsets.fromLTRB(6,14,14,0),
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(
                                  color: Colors.lightGreen,
                                ),
                              ),

                              focusColor: Colors.lightGreen,
                              filled: true,
                              fillColor: Colors.white),
                        ),

                        Obx(()=>ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.hobby.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Obx(
                                    () => Container(
                                  child: DropdownButtonFormField(
                                    isExpanded: true,
                                    decoration: InputDecoration(border: InputBorder.none),


                                    hint: Text(
                                      'Select Your Student Hobby',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.lightGreen,
                                      ),
                                    ),

                                    items: controller.hobbyList.map(( category) {
                                      return DropdownMenuItem(
                                          value: category,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 12),
                                            child: Text(category,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.lightGreen,
                                                ),
                                                overflow: TextOverflow.ellipsis),
                                          ));
                                    }).toList(),
                                    onChanged: (newValue) {
                                      print(newValue);
                                      controller.hobbyVal.value=newValue.toString();
                                    },
                                  ),
                                ),
                              );
                            }),),






                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.orange
                            ),
                            onPressed: () {
                              controller.hobbyIncrement();
                              controller.hobbyaddList.add(controller.countHobby.value);
                              controller.hobby.add(Hobby(
                                hobbyName: controller.hobbyVal.value
                              ));
                            },
                            child: Text(
                              "Add Student Hobby",
                              style: TextStyle(fontSize: 12),
                            )),
                      ],
                    );
                  }),),

              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.lightGreen
                  ),
                  onPressed: () {
                    controller.increment();
                    controller.studentList.add(controller.count.value);

                    controller.student.add(Student(
                      hobby:[],
                      id:  controller.studentId.text,
                      name: controller.studentName.text,

                    ));



                  },
                  child: Text(
                    "Add Student ",
                    style: TextStyle(fontSize: 12),
                  )),
              // Obx(()=>Text(controller.count.value.toString())),
              SizedBox(
                height: 10,
              ),


            ],
          ),
        )
    );
  }
}
