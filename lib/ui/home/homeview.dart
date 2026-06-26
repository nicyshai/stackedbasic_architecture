import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stackedbasic/models/RespProducts.dart';


import '../tools/model_future_builder.dart';
import 'homeviewmodel.dart';


class Homeview extends StatelessWidget {
  num id;
  Homeview({super.key,required this.id });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<Homeviewmodel>.reactive(
      onViewModelReady: (viewmodel)=>viewmodel.init(),
      viewModelBuilder: () => Homeviewmodel(id),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Products"),
          ),
          body: ModelFutureBuilder<List<Products>>(
            busy: viewModel.isBusy,
            data: viewModel.plist,
            error: viewModel.modelError,
            onRefresh: viewModel.fetchproducts,
            builder: (BuildContext context, List<Products> products, Widget? child) {
              return ModelFutureListBuilder<Products>(
                busy: false, // already handled by ModelFutureBuilder
                data: products,
                onRefresh: viewModel.fetchproducts,
                emptyText: "No products available",
                builder: (BuildContext context, List<Products> value, Widget? child) {
                  return GridView.builder(itemCount: value.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 4,mainAxisSpacing: 8),
                    itemBuilder: (BuildContext context, int index) {
                    final Singleproduct=value[index];
                    return Card(
                      margin: EdgeInsets.all(8),
                      child: GridTile(

                        child:Column(
                          crossAxisAlignment: .start,
                          children: [
                             Singleproduct.imageUrl != null?Image.network(Singleproduct.imageUrl!,width: 60,height: 60,fit: .cover):Icon(Icons.image),
                            Text("${Singleproduct.name??""}"),
                            Text("${Singleproduct.description??""}"),
                            SizedBox(height: 5,),
                            Text("${Singleproduct.price??""}"),
                          ],
                        ),
                      )
                    );
                    },

                      );
                },

              );
            },
            onError: (context)=>ModelErrorWidget(
              error: viewModel.modelError,
              isFullScreen: false,
              onRefresh: viewModel.fetchproducts,
          )

        )
        );
      },
    );
  }
}