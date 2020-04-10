import 'package:comotudoreceitas/models/settings.dart';
import 'package:comotudoreceitas/screens/settings_screen.dart';
import 'package:flutter/material.dart';

import 'screens/tabs_screen.dart';
import 'package:comotudoreceitas/screens/categories_meals_screen.dart';
import 'package:comotudoreceitas/screens/meal_detail_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'utils/app_routes.dart';
import 'models/settings.dart';
import 'models/meal.dart';
import 'data/dummy_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Meal> _availableMeals = DUMMY_MEALS;//Comidas Disponíveis

  void _filterMeals(Settings settings) {
    setState(() {
      _availableMeals = DUMMY_MEALS.where((meal) {
          final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
          final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
          final filterVegan = settings.isVegan && !meal.isVegan;
          final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
          return !filterGluten && filterLactose && filterVegan && filterVegetarian;
///Se filtro de gluten não for verdadeiro & filtro de lactose não for verdadeiro
///e fintro vegano não for verdadeiro e filtro vegetariano nao for verdadeiro
///exibe a comida
      }).toList();
    });
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Como Tudo - Receitas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.amber,
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: CategoriesScreen(),
      routes: {
        AppRoutes.HOME: (ctx) => TabsScreen(),
        AppRoutes.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(_availableMeals),
        ///_availableMeals Passa as comidas disponíveis para exibição por categoria
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(_filterMeals),
      },
//      onUnknownRoute: (settings) { //Tratamento de erros em Rotas
//        return MaterialPageRoute(
//          builder: (_) {
//            return CategoriesScreen();
//          },
//        );
//      },
    );
  }
}


