import 'package:comotudoreceitas/models/category.dart';
import 'package:flutter/material.dart';
import '../screens/categories_meals_screen.dart';

///Essa Tela irá receber ../models/category.dart como parâmetro
class CategoryItem extends StatelessWidget {

  final Category category;

  const CategoryItem(this.category);

  void _selectCategory(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) {
          return CategoriesMealsScreen(category);
        },
       ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      onTap: () => _selectCategory(context),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
              colors: [///Recebe com cor da categoria + opacidade 0.5
                category.color.withOpacity(0.5),
                category.color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
