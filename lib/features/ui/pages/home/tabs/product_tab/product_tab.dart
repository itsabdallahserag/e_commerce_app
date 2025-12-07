import 'package:e_commerce_app/config/di.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/features/ui/pages/home/tabs/product_tab/cubit/products_tab_states.dart';
import 'package:e_commerce_app/features/ui/pages/home/tabs/product_tab/cubit/products_view_model.dart';
import 'package:e_commerce_app/features/ui/pages/home/tabs/product_tab/widgets/product_tab_item.dart';
import 'package:e_commerce_app/features/ui/widgets/main_error_widget.dart';
import 'package:e_commerce_app/features/ui/widgets/main_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ProductTab extends StatefulWidget {
  const ProductTab({super.key});
  @override
  State<ProductTab> createState() => _ProductTabState();
}

class _ProductTabState extends State<ProductTab> {
  ProductsViewModel viewModel = getIt<ProductsViewModel>();
  @override
  void initState() {
    super.initState();
    viewModel.getAllProducts();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsViewModel,ProductsTabStates>(
      bloc: viewModel,
      builder: (context, state) {
        if(state is ProductsLoadingState){
          return MainLoadingWidget();
        }else if(state is ProductsErrorState){
          return MainErrorWidget();
        }else if(state is ProductsSuccessState){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              itemCount: 20,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.62,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRoutes.productDetails,arguments: state.productsList![index]);
                    },
                    child: ProductTabItem(product: state.productsList![index],));
              },
            ),
          );
        }else{
          return Container();
        }
      },
    );
  }
}
