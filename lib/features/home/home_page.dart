import 'package:dimbalima_app/core/theme/app_colors.dart';
import 'package:dimbalima_app/core/theme/app_text_styles.dart';
import 'package:dimbalima_app/core/widgets/app_card.dart';
import 'package:dimbalima_app/features/habits/habits_page.dart';
import 'package:dimbalima_app/features/home/home_header.dart';
import 'package:dimbalima_app/features/menus/menus_page.dart';
import 'package:dimbalima_app/features/planning/planning_page.dart';
import 'package:dimbalima_app/features/todo/todo_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const HomeHeader(),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  children: [
                    AppCard(
                      title: 'Menus',
                      subtitle: 'de la semaine',
                      backgroundColor: AppColors.beige,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> const MenusPage(),),);
                      },
                    ),
                    AppCard(
                      title: 'To Do',
                      subtitle: 'Liste',
                      backgroundColor: AppColors.nude,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> const TodoPage(),),);
                      },
                    ),
                    AppCard(
                      title: 'Planning',
                      subtitle: 'Menage',
                      backgroundColor: AppColors.grey,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> const MenusPage(),),);
                      },
                    ),
                    AppCard(
                      title: 'Courses',
                      subtitle: 'du quotidien',
                      backgroundColor: AppColors.grey,
                      onTap: () {},
                    ),
                    AppCard(
                      title: 'Dépenses',
                      subtitle: 'du mois',
                      backgroundColor: AppColors.green,
                      onTap: () {},
                    ),
                    AppCard(
                      title: 'Planning',
                      subtitle: 'de la semaine',
                      backgroundColor: AppColors.nude,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> const PlanningPage(),),);
                      },
                    ),
                    AppCard(
                      title: 'Tracker',
                      subtitle: 'de la semaine',
                      backgroundColor: AppColors.green,
                      onTap: () {},
                    ),
                    AppCard(
                      title: 'Habits',
                      subtitle: 'Tracker',
                      backgroundColor: AppColors.pink,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> const HabitsPage(),),);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16,),
              Container(
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.beige,
                  borderRadius: BorderRadius.circular(30),
                ),
                alignment: Alignment.center,
                child: Text('Magazin', style: AppTextStyles.cardTitle,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
