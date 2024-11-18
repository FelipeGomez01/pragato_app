import 'package:core_ui/resources/app_colors.dart';
import 'package:core_ui/resources/text_styles.dart';
import 'package:core_ui/widgets/info_card_widget.dart';
import 'package:core_ui/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_module/presentation/searcher/bloc/searcher_bloc.dart';
import 'package:shared/entities/cat_detail_entity.dart';
import 'package:shared/utils/status.dart';
import 'package:search_module/l10n/search_localizations_extension.dart';

class SearcherComponent extends StatefulWidget {
  final Function(CatDetailEntity) navToDetail;

  const SearcherComponent({
    super.key,
    required this.navToDetail
  });

  @override
  SearcherComponentState createState() => SearcherComponentState();
}

class SearcherComponentState extends State<SearcherComponent> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: context.searchL10n.writeTheNameCat,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  final searcherBloc = context.read<SearcherBloc>();
                  searcherBloc.add(GetDataEvent(query: _searchController.text));
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                ),
                child: Text(context.searchL10n.search),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: BlocBuilder<SearcherBloc,SearcherState>(
              builder: (_, state) => Container(
                color: AppColors.secondary,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: state.searcherStatus.isUndefined
                  ? Center(
                      child: Text(
                        context.searchL10n.resultsWillAppearHere,
                        style: CustomTextStyles.title.copyWith(
                          color: AppColors.white
                        ),
                      )
                    )
                    : state.searcherStatus.isLoading
                        ? const LoadingWidget()
                        : ListView.builder(
                            itemCount: state.searchData!.length,
                            itemBuilder: (_, index) {
                              final cat = state.searchData![index];
                              return InfoCardWidget(
                                navTo: () => widget.navToDetail(
                                  state.searchData![index]
                                ),
                                name: cat.name,
                                imageUrl: cat.image!.url,
                                countryOrigin: cat.origin,
                                intelligence: cat.intelligence
                              );
                            }
                          )
                )
            )
          )
        ]
      )
    );
  }
}