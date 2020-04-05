import 'package:comotudoreceitas/models/category.dart';
import 'package:flutter/material.dart';


///Essa Tela irá receber ../models/category.dart como parâmetro
class CategoryItem extends StatelessWidget {

  final Category category;

  const CategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Text(category.title),
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
    );
  }
}
