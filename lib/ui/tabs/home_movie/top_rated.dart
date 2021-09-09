import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/index.dart';
import '../../../models/index.dart';
import '../../../ui/widgets/index.dart';

class TopRatedMoviesTab extends GetView<TopRatedMoviesController> {
  const TopRatedMoviesTab({Key? key}) : super(key: key);

  Future<void> refreshPage() async {}

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => refreshPage(),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: controller.scrollController,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                controller.obx(
                      (MovieWrapper? movieWrapper) {
                    if (movieWrapper != null) {
                      CustomProgressIndicator.closeLoadingOverlay();
                      return ProductList(
                        productList: movieWrapper.results,
                        isMovie: true,
                      );
                    } else {
                      CustomProgressIndicator.openLoadingDialog();
                      return const SizedBox();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
