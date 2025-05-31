import 'package:fertie_application/helpers/route.dart';
import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/utils/app_icons.dart';
import 'package:fertie_application/utils/style.dart';
import 'package:fertie_application/views/screen/bottomMenuBar/user_bottom_menu..dart';
import 'package:fertie_application/views/screen/cycle_insights/controller/cycle_insights_controller.dart';
import 'package:fertie_application/views/screen/cycle_insights/widgets/cycleInsight_card.dart';
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

  @override
  void initState() {
    super.initState();
    cycleInsightController.getCycleInsights();
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
      body: SingleChildScrollView(
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
                  // content: 'Cycle Day 14: Likely ovulating today (LH test + CM). Period: Apr 10, 5 days (light-heavy-light). Ovulation: LH surge on CD 13, egg white CM. Intercourse: CD 11, CD 13.',
                  content: 'Cycle Day ${content?.cycleDay.toString()}: ${content?.currentCycleInfo ?? ''}'
                ),
                CycleInsightsCard(
                  svgIcon: SvgPicture.asset(AppIcons.suggestionIcon),
                  iconColor: Colors.redAccent,
                  backgroundColor: Color(0xFFEBF1EF),
                  headerText :'Fertie’s Suggestions for You',
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
    );
  }
  void _showPopup (BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color(0xFFFFDC86),
          title: Text('Unlock full cycle insights with a 👑 Premium subscription! ',
              style: AppStyles.fontSize16(fontWeight: FontWeight.w600)),
          content: Text('Tap to Upgrade and get personalized features. 🎉🎉'),
        );
      },
    );
  }
}
