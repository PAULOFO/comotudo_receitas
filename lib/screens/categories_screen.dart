import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,///Cada elemento tem uma extensão de no máximo 200 pixels
        ///mainAxis é o eixo principal vertical
        ///crossAxis é o eixo principal horizontal
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,//Espaçamento no eixo cruzado
        mainAxisSpacing: 20,
      ),
      children: <Widget>[

      ],
    );
  }
}
