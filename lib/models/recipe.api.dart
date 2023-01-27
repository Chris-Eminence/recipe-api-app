import 'dart:convert';
import 'package:flutter_login/models/recipe.dart';
import 'package:http/http.dart' as http ;

class RecipeApi{

  static Future<List<Recipe>> getRecipe() async{
    var uri = Uri.http('yummly2.p.rapidapi.com', '/feeds/list',{
      "limit": "24",
      "start": "0",
      "tag" : "list.recipe.popular"});

    final response = await http.get(uri, headers: {
    "X-RapidAPI-Key": "e07bfb52b7msh97c3ca523c7bea7p18e0f5jsn9bd95a32e91f",
    "X-RapidAPI-Host": "yummly2.p.rapidapi.com",
    "useQueryString": " "
    });

    Map data =jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']){
      _temp.add(i['content']['details']);
    }
    return Recipe.recipesFromSnapshot(_temp);

  }
}