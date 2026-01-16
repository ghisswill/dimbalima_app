import 'package:dimbalima_app/core/theme/app_colors.dart';
import 'package:dimbalima_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  String _formatDate() {
    final now =DateTime.now();
    return DateFormat('EEEE, d MMM').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // logo
        Container(
          width: 48,
          height: 48,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.grey,
          ),
          child: const Icon(Icons.star, size: 20,),
        ),
        const SizedBox(width: 12,),
        // Texts
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ouh Ka Mi', style: AppTextStyles.title,),
            SizedBox(height: 4,),
            Text('GhissWill-Coder', style: AppTextStyles.subtitle,),
            SizedBox(height: 4,),
            Text(_formatDate(), style: AppTextStyles.subtitle,),
          ],
        )
      ],
    );
  }
}