import 'package:flutter/material.dart';

import 'category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  // void selectCategory(BuildContext ctx) {
  //   Navigator.of(ctx).push(
  //     MaterialPageRoute(
  //       //builder: (_) = ctx/context, but only used here to simplify
  //       builder: (_) {
  //         return CategoryMealsScreen(id, title);
  //       },
  //     ),
  //   );
  // }

//named routes easier for larger applications
//where navigation is easier with naming conventions
  void selectCategoryNamed(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.screenName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => selectCategory(context),
      onTap: () => selectCategoryNamed(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
