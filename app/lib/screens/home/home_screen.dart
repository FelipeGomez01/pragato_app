import 'package:flutter/material.dart';
import 'package:home_module/presentation/list_cats/list_cats_component.dart';
import 'package:pragato_app/utils/app_constants.dart';
import 'package:shared/entities/cat_detail_entity.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback navToSearcher;
  final Function(CatDetailEntity) navToDetail;

  const HomeScreen({
    super.key,
    required this.navToSearcher,
    required this.navToDetail
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.applicationName),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => navToSearcher()
          )
        ]
      ),
      body: ListCatsComponent(
        navToDetail: navToDetail
      )
    );
  }
}