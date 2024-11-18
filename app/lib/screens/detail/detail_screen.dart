import 'package:flutter/material.dart';
import 'package:detail_module/presentation/more_information/more_information_component.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/entities/cat_detail_entity.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final catDetail =
      GoRouter.of(context).state!.extra as CatDetailEntity;

    return Scaffold(
      appBar: AppBar(title: Text(catDetail.name)),
      body: MoreInformationComponent(
        catDetail: catDetail
      )
    );
  }
}