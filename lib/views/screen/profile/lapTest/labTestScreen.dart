import 'package:fertie_application/helpers/route.dart';
import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/utils/style.dart';
import 'package:fertie_application/views/screen/bottomMenuBar/user_bottom_menu..dart';
import 'package:fertie_application/views/screen/profile/lapTest/labTestCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LabTestScreen extends StatefulWidget {
  const LabTestScreen({Key? key}) : super(key: key);

  @override
  State<LabTestScreen> createState() => _LabTestScreenState();
}

class _LabTestScreenState extends State<LabTestScreen> {

  final List<Map<String, String>> labData = [
    {
      'imagePath': 'assets/images/labTest.png',
      'labName': 'Lab 1',
      'email': 'lab1@gmail.com',
    },
    {
      'imagePath': 'assets/images/labTest.png',
      'labName': 'Lab 2',
      'email': 'lab2@gmail.com',
    },
    {
      'imagePath': 'assets/images/labTest.png',
      'labName': 'Lab 3',
      'email': 'lab3@gmail.com',
    },
    {
      'imagePath': 'assets/images/labTest.png',
      'labName': 'Lab 4',
      'email': 'lab4@gmail.com',
    },
    {
      'imagePath': 'assets/images/labTest.png',
      'labName': 'Lab 5',
      'email': 'lab5@gmail.com',
    },
    {
      'imagePath': 'assets/images/labTest.png',
      'labName': 'Lab 6',
      'email': 'lab6@gmail.com',
    },
    {
      'imagePath': 'assets/images/labTest.png',
      'labName': 'Lab 7',
      'email': 'lab7@gmail.com',
    },
    {
      'imagePath': 'assets/images/labTest.png',
      'labName': 'Lab 8',
      'email': 'lab8@gmail.com',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Lab List',style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      backgroundColor: AppColors.secondColor,
      bottomNavigationBar: UserBottomMenu(2),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: .9,
          ),
          itemCount: labData.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                Get.toNamed(AppRoutes.labDetailsScreen);
              },
              child: LabTestCard(
                imagePath: labData[index]['imagePath']!,
                labName: labData[index]['labName']!,
                email: labData[index]['email']!,
              ),
            );
          },
        ),
      ),
    );
  }
}