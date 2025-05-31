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
          child: Column(
            children: [
              CycleInsightsCard(
                svgIcon: SvgPicture.asset(AppIcons.cycleIcon),
                iconColor: Colors.redAccent,
                headerText :'Your Current Cycle',
                title: 'Cycle Day 10',
                content: 'Cycle Day 14: Likely ovulating today (LH test + CM). Period: Apr 10, 5 days (light-heavy-light). Ovulation: LH surge on CD 13, egg white CM. Intercourse: CD 11, CD 13.',
              ),
              CycleInsightsCard(
                svgIcon: SvgPicture.asset(AppIcons.suggestionIcon),
                iconColor: Colors.redAccent,
                backgroundColor: Color(0xFFEBF1EF),
                headerText :'Fertie’s Suggestions for You',
                content: '• You logged ovulation symptoms but didn\'t track LH—consider adding that xt cycle to boost prediction accuracy. \n • You\'ve had shorter luteal phases (10-11)days—this can affect implantation. soconsider bringing this up to your doctor. \n• Try logging mood and energy levelsaround ovulation. It can help Fertiefine-tune your score',
              ),
              CycleInsightsCard(
                svgIcon: SvgPicture.asset(AppIcons.noticeIcon),
                iconColor: Colors.redAccent,
                headerText :'Patterns Fertie Noticed',
                content: 'You logged ovulation symptoms but didn\'t track LH—consider adding that xt cycle to boost prediction accuracy You\'ve had shorter luteal phases (10-11).',
              ),
              CycleInsightsCard(
                svgIcon: SvgPicture.asset(AppIcons.mindIcon),
                iconColor: Colors.redAccent,
                headerText :'What to Keep in Mind This Cycle',
                content: 'You logged ovulation symptoms but didn\'t track LH—consider adding that xt cycle to boost prediction accuracy You\'ve had shorter luteal phases (10-11).',
              ),

            ],
          ),
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
