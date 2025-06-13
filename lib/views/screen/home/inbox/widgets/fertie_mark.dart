import 'package:flutter/material.dart';

import '../../../../../utils/app_images.dart';

class FertieAiAssistantMark extends StatelessWidget {
  const FertieAiAssistantMark({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey[200]!)),
      ),
      child: Row(
        children: [
          Image.asset(AppImages.cuteAppLogo, height: 24, width: 24),
          const SizedBox(width: 8),
          Text(
            'Fertie AI Assistant',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}