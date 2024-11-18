import 'package:core_ui/resources/app_colors.dart';
import 'package:core_ui/widgets/info_card_widget.dart';
import 'package:core_ui/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_module/l10n/home_localizations_extension.dart';
import 'package:home_module/presentation/list_cats/bloc/list_cats_bloc.dart';
import 'package:shared/utils/status.dart';
import 'package:shared/entities/cat_detail_entity.dart';

class ListCatsComponent extends StatefulWidget {
  final Function(CatDetailEntity) navToDetail;

  const ListCatsComponent({
    super.key,
    required this.navToDetail
  });

  @override
  createState() => _ListCatsComponentState();
}

class _ListCatsComponentState extends State<ListCatsComponent> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent * 0.9) {
      context.read<ListCatsBloc>().add(const LoadMoreCatsEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<ListCatsBloc>();
    homeBloc.add(const GetListEvent());

    return BlocBuilder<ListCatsBloc,HomeState>(
      buildWhen: (previous, current) =>
        current.homeStatus != previous.homeStatus ||
        current.homeData!.length > previous.homeData!.length,
      builder: (_, state) => Container(
        color: AppColors.secondary,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: state.homeStatus.isError
          ? Center(child: Text(context.homeL10n.errorMessage))
          : state.homeStatus.isLoading
              ? const LoadingWidget()
              : ListView.builder(
                  controller: _scrollController,
                  itemCount: state.homeData!.length,
                  itemBuilder: (_, index) {
                    if ((index + 1) >= state.homeData!.length) {
                      return state.hasReachedMax
                        ? const SizedBox.shrink()
                        : const Center(child: CircularProgressIndicator());
                    }

                    final item = state.homeData![index];
                    return InfoCardWidget(
                      navTo: () => widget.navToDetail(
                        item.catDetailList.first
                      ),
                      name: item.catDetailList.first.name,
                      imageUrl: item.url,
                      countryOrigin: item.catDetailList.first.origin,
                      intelligence: item.catDetailList.first.intelligence
                    );
                  }
                )
      )
    );
  }
}