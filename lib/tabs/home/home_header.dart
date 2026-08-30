import 'package:evently/models/categories_model.dart';
import 'package:evently/models/Event_Model.dart';
import 'package:evently/tabs/home/tab_items.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Text('Welcome Back ✨', style: theme.titleMedium,),
         SizedBox(height: 4,),
         Text('Mohamed Adel', style: theme.titleLarge,),
        DefaultTabController(
          length: CategoriesModel.Categories.length + 1,
          child: TabBar(
            onTap: (index){
              if(currentIndex == index) return;
              setState(() {
                currentIndex = index;
              });
            },
            isScrollable: true,
            padding: EdgeInsets.symmetric(vertical: 24),
            dividerColor: Colors.transparent,
            indicatorColor: Colors.transparent,
            labelPadding: EdgeInsets.only( right: 8),
            tabAlignment: .start,
            tabs: [
              TabItems(
                title: 'All',
                icon: Icons.category_outlined,
                isSelected: currentIndex == 0,
              ),
            ...CategoriesModel.Categories.map(
              (Category) =>
            TabItems(
            title: Category.label, 
            icon: Category.icon,
            isSelected: currentIndex - 1 == CategoriesModel.Categories.indexOf(Category),
            )
            ),
            ],
          ),
        )
        ],
        
      ),
    );
  }
}