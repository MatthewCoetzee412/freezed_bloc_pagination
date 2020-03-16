import 'dart:math';

import 'package:camera_demo/direct_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main()=>runApp(MyApp());

class MyBehaviour extends ScrollBehavior{
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
  List<Icon>iconList = [Icon(Icons.build),Icon(Icons.edit,color: Colors.white,),Icon(Icons.fastfood,color: Colors.white,),Icon(Icons.local_gas_station,color: Colors.white,),Icon(Icons.hotel,color: Colors.white,),Icon(Icons.airplanemode_active,color: Colors.white,),Icon(Icons.local_grocery_store,color: Colors.white,),Icon(Icons.signal_wifi_4_bar_lock,color: Colors.white,),Icon(Icons.security,color: Colors.white,),Icon(Icons.party_mode,color: Colors.white,)];
  List<String>buildItems = ['Rent','Stationery','Refreshments','Petrol','Accomandation','Airplane','Groceries','Anti Virus','Secruity','Fun'];
  int selectedIndex = 0;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    buildItems.sort();
    return MaterialApp(
      builder: (context,widget){
        return ScrollConfiguration(behavior: MyBehaviour(),child: widget,);
      },
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.orange,
          title: Text('Custom Direct Select'),
        ),
        body: CameraHomeScreen(),
      ),
    );
  }
}


class CameraHomeScreen extends StatefulWidget {
  @override
  _CameraHomeScreenState createState() => _CameraHomeScreenState();
}


class _CameraHomeScreenState extends State<CameraHomeScreen> {

  @override
  Widget build(BuildContext context) {
    print('inside home screen');
    var screenSize = MediaQuery.of(context).size;
    return CustomDirectSelect(
      items: buildItems,
      selectedIndex: selectedIndex,
      onSelectedIndexChanged: (int newIndex){
        setState(() {
          selectedIndex = newIndex;
        });
      },
    );
    // return Container(
    //   child:Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: Slidable(
    //       actionPane: SlidableBehindActionPane(),
    //       actionExtentRatio: 0.15,
    //       secondaryActions: <Widget>[
    //         IconSlideAction(
    //           caption: 'Edit',
    //           closeOnTap: true,
    //           color: Colors.green,
    //           icon: Icons.delete,
    //           onTap: (){
    //             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>EditCategory(buildItems[selectedIndex])));
    //           },
    //         ),
    //         IconSlideAction(
    //           caption: 'Delete',
    //           closeOnTap: true,
    //           color: Colors.red,
    //           icon: Icons.edit,
    //           onTap: (){
    //             setState(() {
    //               buildItems.remove(selectedIndex);
    //             });
    //           },
    //         )
    //       ],
    //         child: Container(
    //         width: screenSize.width,
    //         height: 50,
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(16.0),
    //           border: Border.all(color: Colors.black,width: 2.0)
    //         ),
    //         child: Stack(
    //           children: <Widget>[
    //             Align(
    //               alignment: Alignment.centerLeft,
    //               child: FlatButton(child: Text(buildItems[selectedIndex]),onPressed: (){
    //                 Navigator.push(context, new MaterialPageRoute<Null>(
    //                   fullscreenDialog: true,
    //                   builder: (context){`
    //                     return SelectionOption();
    //                   }
    //                 ));
    //               },),
    //             ),
    //             Align(
    //               alignment: Alignment.centerRight,
    //               child: IconButton(icon: Icon(Icons.add),color: Colors.black,iconSize: 20,onPressed: (){
    //                 Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>AddCategory()));
    //               },),
    //             )
    //           ],
    //         ),
    //       ),
    //     ),
    //   )
    // );
  }
}

class TestClass extends StatefulWidget {
  @override
  _TestClassState createState() => _TestClassState();
}

class _TestClassState extends State<TestClass> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}



class SelectionOption extends StatefulWidget {
  @override
  _SelectionOptionState createState() => _SelectionOptionState();
}

class _SelectionOptionState extends State<SelectionOption> {

  @override
  Widget build(BuildContext context) {
    print('Inside selection option');
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity, 
                height: 300,
                child: Scrollbar(
                   child: ListView.builder(
                    itemCount: buildItems.length,
                    itemBuilder: (context,index){
                      return Align(
                        alignment: Alignment.center,
                         child: FlatButton(
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.center,
                                  child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:iconList[Random().nextInt(iconList.length)],
                                  
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(buildItems[index],style: TextStyle(
                                  color: Colors.white
                                ),),
                              )
                            ],
                             ),
                           onPressed: (){
                             selectedIndex = index;
                             Navigator.pop(context);
                           },
                         ),
                      );
                    },
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AddCategory extends StatefulWidget {
  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {

  final controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Category'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: <Widget>[
          Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: controller,
        ),
      ),
      FlatButton(
        child: Text('Save'),
        onPressed: (){
          setState(() {
            buildItems.add(controller.text);
            iconList.add(iconList[Random().nextInt(iconList.length)]);
          });
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyApp()));
          controller.clear();
        },
      )
        ],
      )
    );
  }
}

class EditCategory extends StatefulWidget {

  final String category;
  EditCategory(this.category);

  @override
  _EditCategoryState createState() => _EditCategoryState();
}

class _EditCategoryState extends State<EditCategory> {

  @override
  Widget build(BuildContext context) {
    final controller = new TextEditingController(text: widget.category);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Edit Category'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: <Widget>[
          Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: controller,
        ),
      ),
      FlatButton(
        child: Text('Save'),
        onPressed: (){
          setState(() {
            buildItems.remove(buildItems[selectedIndex]);
            buildItems.add(controller.text);
          });
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyApp()));
          controller.clear();
        },
      )
        ],
      )
    );
  }
}

class PLEASEPULL extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
