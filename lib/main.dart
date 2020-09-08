import 'package:built_collection/built_collection.dart';
import 'package:camera_demo/bloc/built_value_bloc_bloc.dart';
import 'package:camera_demo/bloc/built_value_bloc_export.dart';
import 'package:camera_demo/bloc_delegate/delegate.dart';
import 'package:camera_demo/dependency_injection/injection_container.dart';
import 'package:camera_demo/models/food_model.dart';
import 'package:camera_demo/repository/firebase_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  BuiltValueBlocBloc _bloc = getit<BuiltValueBlocBloc>();

  @override
  void initState() {
    _bloc.add(LoadBuiltValueBlocEvent(documentSnapshot: null));
    super.initState();
  }

  @override
  void dispose() {
    _bloc.drain();
    _bloc.close();
    super.dispose();
  }

//Notification Handler
  bool _scrollNotificationHandler(ScrollNotification notification,
      DocumentSnapshot amountDocumentSnapshot, bool hasReachedEndOfDocuments) {
    if (notification is ScrollEndNotification &&
        _scrollControllerHomeScreen.position.extentAfter == 0 &&
        !hasReachedEndOfDocuments) {
      _bloc.add(
          LoadBuiltValueBlocEvent(documentSnapshot: amountDocumentSnapshot));
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
      body: BlocListener<BuiltValueBlocBloc, BuiltValueBlocState>(
          bloc: _bloc,
          listener: (context, state) {
            print(state.exception);
          },
          child: BlocBuilder<BuiltValueBlocBloc, BuiltValueBlocState>(
              bloc: _bloc,
              builder: (context, state) {
                if (state.isLoading != null && state.isLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state.isLoaded != null && state.isLoaded) {
                  return StreamBuilder(
                    stream: state.items.asStream(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        BuiltList<Food> foodItems = snapshot.data;

                        if (foodItems.isEmpty) {
                          return Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('You currently have no items'),
                          ));
                        } else {
                          return Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            child: NotificationListener<ScrollNotification>(
                              onNotification: (notification) =>
                                  _scrollNotificationHandler(
                                      notification,
                                      foodItems.last.document,
                                      state.hasReachedEndofDocuments),
                              child: SingleChildScrollView(
                                controller: _scrollControllerHomeScreen,
                                child: Column(
                                  children: [
                                    ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: foodItems.length,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          leading: Icon(Icons.album),
                                          title: Text(
                                              foodItems[index].type.toString()),
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                      }
                    },
                  );
                  //!Work, but not ideal
                  // return FutureBuilder<Stream<QuerySnapshot>>(
                  //   future: FirebaseRepository().getMoreItems(null),
                  //   builder: (context, fsnapshot) {
                  //     if (!fsnapshot.hasData) {
                  //       return Center(
                  //         child: CircularProgressIndicator(),
                  //       );
                  //     } else {
                  //       return StreamBuilder<QuerySnapshot>(
                  //         stream: fsnapshot.data,
                  //         builder: (context, snapshot) {
                  //           if (!snapshot.hasData) {
                  //             return Center(
                  //               child: CircularProgressIndicator(),
                  //             );
                  //           } else {
                  //             List<DocumentSnapshot> foodItems =
                  //                 snapshot.data.documents;

                  //             if (foodItems.isEmpty) {
                  //               return Center(
                  //                   child: Padding(
                  //                 padding: const EdgeInsets.all(8.0),
                  //                 child: Text('You currently have no items'),
                  //               ));
                  //             } else {
                  //               return Container(
                  //                 height: MediaQuery.of(context).size.height,
                  //                 width: MediaQuery.of(context).size.width,
                  //                 child:
                  //                     NotificationListener<ScrollNotification>(
                  //                   onNotification: (notification) =>
                  //                       _scrollNotificationHandler(
                  //                           notification,
                  //                           foodItems.last,
                  //                           state.hasReachedEndofDocuments),
                  //                   child: SingleChildScrollView(
                  //                     controller: _scrollControllerHomeScreen,
                  //                     child: Column(
                  //                       children: [
                  //                         ListView.builder(
                  //                           shrinkWrap: true,
                  //                           itemCount: foodItems.length,
                  //                           physics:
                  //                               NeverScrollableScrollPhysics(),
                  //                           itemBuilder: (context, index) {
                  //                             return ListTile(
                  //                               leading: Icon(Icons.album),
                  //                               title: Text(foodItems[index]
                  //                                       ['type']
                  //                                   .toString()),
                  //                             );
                  //                           },
                  //                         )
                  //                       ],
                  //                     ),
                  //                   ),
                  //                 ),
                  //               );
                  //             }
                  //           }
                  //         },
                  //       );
                  //     }
                  //   },
                  // );
                }

                return Container();
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
  BuiltValueBlocBloc _bloc = getit<BuiltValueBlocBloc>();

  void _onPressedAddFoodItem() {
    _bloc.add(AddFoodItemEvent(food: Food((b) => b..type = controller.text)));
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
      body: BlocListener<BuiltValueBlocBloc, BuiltValueBlocState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state.isSuccessful != null && state.isSuccessful) {
            Navigator.of(context).pop();
          }
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
