import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'main.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';

class CustomDirectSelect extends StatefulWidget {

  //The current selected index
  final int selectedIndex;
  //The new selected index
  final ValueChanged<int> onSelectedIndexChanged;
  //List of items
  final List<String> items;//Change back to List<Map<String,dynamic>> items

  CustomDirectSelect({
    Key key,
    @required this.selectedIndex,
    @required this.onSelectedIndexChanged,
    @required this.items
  }):assert(selectedIndex!=null),
     assert(items!=null),
     assert(onSelectedIndexChanged!=null),
     super(key:key);

  @override
  _CustomDirectSelectState createState() => _CustomDirectSelectState();
}

class RenderItemList extends StatefulWidget {

  final List<String>items;
  final ValueChanged<int>onSelectedIndexChanged;

  RenderItemList(this.items,this.onSelectedIndexChanged);

  @override
  _RenderItemListState createState() => _RenderItemListState();
}

class _RenderItemListState extends State<RenderItemList> {

  final scrollController = new ScrollController();
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,//Replace with middle_middle_black
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 300,//Replace with Media Query
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: DraggableScrollbar.arrows(
                    alwaysVisibleScrollThumb: true,
                    controller: scrollController,
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: widget.items.length,
                      itemBuilder: (context,index){
                        return GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),//Replace with Media Query
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(widget.items[index],style: TextStyle(color: Colors.white),)//change back to widget.items[index]['category']
                              ),
                          ),//Replace with white //FAIL POINT
                          onTap: (){
                            setState(() {
                              widget.onSelectedIndexChanged(index);//FAIL POINT
                            });
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                  ),
                ),
              )
          ],),
        ),
      ),
    );
  }
}

class _CustomDirectSelectState extends State<CustomDirectSelect> {

  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),//Replace with Media Query
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.15,
        secondaryActions: <Widget>[
          IconSlideAction(
                  caption: 'Edit',
                  color: Colors.green,
                  icon: Icons.edit,
                  onTap: (){
                    //Edit Category
                  },
                ),
                IconSlideAction(
                  caption: 'Delete',
                  color: Colors.red,
                  icon: Icons.delete,
                  onTap: () {
                    //Delete Category
                  },
                ),
        ],
          child: Container(
          width: screenSize.width,
          height: 60.0,//Replace with Mquery
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: Colors.grey[700],//Replace with middle_middle_black
            border: Border.all(
              color: Colors.black,//Replace with light_black
              width: 2.0
            )
          ),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: FlatButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute<Null>(
                      fullscreenDialog: true,
                      builder: (context){
                        return RenderItemList(widget.items,widget.onSelectedIndexChanged);//FAIL POINT <--- HIGH VERY HIGH
                      }
                    ));
                  },
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                    child: Text(widget.items[widget.selectedIndex],style: TextStyle(//FAIL POINT //Change back to widget.items[widget.selectedIndex]['category]
                    color: Colors.white
                  ),),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(Icons.add,color: Colors.white),//Replace with white
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AddCategory()));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

