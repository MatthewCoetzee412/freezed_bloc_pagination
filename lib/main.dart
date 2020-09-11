import 'package:camera_demo/bloc_delegate/delegate.dart';
import 'package:camera_demo/blocs/food_cud_bloc/food_cud_bloc.dart';
import 'package:camera_demo/blocs/food_cud_bloc/food_cud_export.dart';
import 'package:camera_demo/blocs/food_load_bloc/food_load_bloc.dart';
import 'package:camera_demo/blocs/food_load_bloc/food_load_export.dart';
import 'package:camera_demo/dependency_injection/injection_container.dart';
import 'package:camera_demo/models/food_model.dart';
import 'package:camera_demo/custom_error_handler/custom_error_handler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  initGetIt();
  BlocSupervisor.delegate = BlocLogging();
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _scrollControllerHomeScreen = ScrollController();
  bool _hasReachedEnd = false;
  FoodLoadBloc _bloc = getit<FoodLoadBloc>();

  @override
  void initState() {
    _bloc.add(FoodLoadEvent.load([], null));
    super.initState();
  }

  @override
  void dispose() {
    _bloc.drain();
    _bloc.close();
    super.dispose();
  }

//Notification Handler
  bool _scrollNotificationHandler(
      ScrollNotification notification,
      DocumentSnapshot amountDocumentSnapshot,
      bool hasReachedEndOfDocuments,
      List<Food> items) {
    print(hasReachedEndOfDocuments);

    if (notification is ScrollEndNotification &&
        _scrollControllerHomeScreen.position.extentAfter == 0 &&
        !hasReachedEndOfDocuments) {
      print('INSIDE SCROLL NOTE');

      _bloc.add(FoodLoadEvent.load(items, amountDocumentSnapshot));
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text('Built Value bloc project'),
      ),
      body: BlocListener<FoodLoadBloc, FoodLoadState>(
          bloc: _bloc,
          listener: (context, state) {
            state.when(
              intial: () {},
              loading: () {},
              success: (_) {},
              error: (ItemFailure itemFailure) {
                if (itemFailure == ItemFailure.noMoreDocumentsException()) {
                  setState(() {
                    _hasReachedEnd = true;
                  });
                }
              },
            );
          },
          child: BlocBuilder<FoodLoadBloc, FoodLoadState>(
              bloc: _bloc,
              builder: (context, state) {
                return state.maybeWhen(
                    orElse: () => Container(),
                    intial: () => Container(),
                    loading: () => Center(
                          child: CircularProgressIndicator(),
                        ),
                    success: (items) {
                      if (items.isEmpty) {
                        return Center(
                          child: Text('Currently no items'),
                        );
                      } else {
                        print('inside success state');
                        return Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: NotificationListener<ScrollNotification>(
                            onNotification: (notification) =>
                                _scrollNotificationHandler(
                                    notification,
                                    items?.last?.document,
                                    _hasReachedEnd,
                                    items),
                            child: SingleChildScrollView(
                              controller: _scrollControllerHomeScreen,
                              child: Column(
                                children: [
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: items.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        leading: Icon(Icons.album),
                                        title:
                                            Text(items[index].type.toString()),
                                      );
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    });
              })),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (builder) => AddFoodItem()));
        },
      ),
    );
  }
}

class AddFoodItem extends StatefulWidget {
  @override
  _AddFoodItemState createState() => _AddFoodItemState();
}

class _AddFoodItemState extends State<AddFoodItem> {
  TextEditingController controller = new TextEditingController();
  FoodCudBloc _bloc = getit<FoodCudBloc>();

  void _onPressedAddFoodItem() {
    _bloc.add(FoodCudEvent.add(Food(type: controller.text, document: null)));
  }

  @override
  void dispose() {
    _bloc.drain();
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text('Add Food item'),
      ),
      body: BlocListener<FoodCudBloc, FoodCudState>(
        bloc: _bloc,
        listener: (context, state) {
          state.when(
            intial: () {},
            loading: () {},
            success: () => Navigator.of(context).pop(),
            error: (err) => print(err),
          );
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: controller,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                child: FlatButton(
                  onPressed: () {
                    _onPressedAddFoodItem();
                  },
                  child: Text('Add Item'),
                  color: Colors.blue,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
