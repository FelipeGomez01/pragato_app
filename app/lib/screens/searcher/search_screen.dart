import 'package:flutter/material.dart';
import 'package:pragato_app/utils/app_constants.dart';
import 'package:search_module/presentation/searcher/searcher_component.dart';
import 'package:shared/entities/cat_detail_entity.dart';

class SearchScreen extends StatelessWidget {
  final Function(CatDetailEntity) navToDetail;

  const SearchScreen({
    required this.navToDetail,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.searcher)
      ),
      body: SearcherComponent(
        navToDetail: navToDetail
      )
    );
  }
}