import 'dart:ui';

import 'package:fertie_application/helpers/route.dart';
import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/utils/app_icons.dart';
import 'package:fertie_application/utils/style.dart';
import 'package:fertie_application/views/screen/bottomMenuBar/user_bottom_menu..dart';
import 'package:fertie_application/views/screen/cycle_insights/controller/cycle_insights_controller.dart';
import 'package:fertie_application/views/screen/cycle_insights/widgets/cycleInsight_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CycleInsightsScreen extends StatefulWidget {
  const CycleInsightsScreen({super.key});

  @override
  State<CycleInsightsScreen> createState() => _CycleInsightsScreenState();
}

class _CycleInsightsScreenState extends State<CycleInsightsScreen> {

  final cycleInsightController = Get.put(CycleInsightsController());
  bool isPremiumUser = false;
  bool showPopup = false;

  @override
  void initState() {
    super.initState();
    cycleInsightController.getCycleInsights();

    if (!isPremiumUser) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          showPopup = true;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: UserBottomMenu(1),
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text('Cycle Insights', style: AppStyles.fontSize16(fontWeight: FontWeight.w600)),
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 14),
          child: IconButton(onPressed: (){Get.toNamed(AppRoutes.homeScreen);}, icon: Icon(Icons.arrow_back_ios_new_outlined)),
        ),
      ),
      body: Stack(
        children: [
          // Main content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Obx((){
                final content = cycleInsightController.cycleInsights.value.data?.attributes;
                return Column(
                  children: [
                    CycleInsightsCard(
                        svgIcon: SvgPicture.asset(AppIcons.cycleIcon),
                        iconColor: Colors.redAccent,
                        headerText :'Your Current Cycle',
                        title: 'Cycle Day ${content?.cycleDay.toString() ?? ''}',
                        content: 'Cycle Day ${content?.cycleDay.toString()}: ${content?.currentCycleInfo ?? ''}'
                    ),
                    CycleInsightsCard(
                      svgIcon: SvgPicture.asset(AppIcons.suggestionIcon),
                      iconColor: Colors.redAccent,
                      backgroundColor: Color(0xFFEBF1EF),
                      headerText :'Fertie\'s Suggestions for You',
                    content: '• ${content?.suggestion ?? ''}',
                    ),
                    CycleInsightsCard(
                      svgIcon: SvgPicture.asset(AppIcons.noticeIcon),
                      iconColor: Colors.redAccent,
                      headerText :'Patterns Fertie Noticed',
                      content: content?.patternFertieNoticed ?? '',
                    ),
                    CycleInsightsCard(
                      svgIcon: SvgPicture.asset(AppIcons.mindIcon),
                      iconColor: Colors.redAccent,
                      headerText :'What to Keep in Mind in This Cycle',
                      content: content?.whatToKeepInMindInThisCycle ?? '',
                    ),
                  ],
                );
              }),
            ),
          ),

          // Popup overlay (only covers the body area)
          if (showPopup)
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                child: Center(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.15),
                          offset: Offset(0, 4),
                        )
                      ],
                      color: Color(0xFFFFDC86),
                      border: Border.all(
                        color: Colors.white,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RichText(
                            text: TextSpan(
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w500,
                                  height: 1.71,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Unlock full cycle insights with a 👑',
                                  ),
                                  TextSpan(text: ' Premium subscription! ', style: TextStyle(fontWeight: FontWeight.bold)),
                                  TextSpan(text: 'Tap to '),
                                  TextSpan(
                                      text: 'Upgrade ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF2B5CC7),
                                        decoration: TextDecoration.underline,
                                      ),
                                      recognizer: TapGestureRecognizer()..onTap = () {
                                        // setState(() {
                                        //   showPopup = false;
                                        // });
                                        Get.toNamed(AppRoutes.upgradeAccountScreen);
                                      }
                                  ),
                                  TextSpan(text: 'and get personalized features. 🎉🎉'),
                                ]
                            )
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}