import 'package:bookly/Features/home/presentation/manger/feature_book_cubit/feature_book_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchFeaturedBooksListViewBloc extends StatelessWidget {
  const FetchFeaturedBooksListViewBloc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureBookCubit, FeatureBookState>(
      builder: (context, state) {
        if (state is FeatureBookSuccess) {
          return const FeaturedBooksListView();
        } else if (state is FeatureBookFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
