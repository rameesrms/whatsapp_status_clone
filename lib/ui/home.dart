
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';
import 'package:whatsappstatus/ui/story_page.dart';

import '../logic/status_manager.dart';
import '../models/categorized_status_model.dart';

class StatusScreen extends StatefulWidget {


  @override
  _StatusScreenState createState() => _StatusScreenState();
}


class _StatusScreenState extends State<StatusScreen> {
  // List<Status> status=[];
  var statusManager = StatusManager();





  @override
  Widget build(BuildContext context) {



    return FutureBuilder(future: statusManager.getStatusData(),
      builder: (context,snapshot) {

      if(snapshot.hasData){
      List<Status> status = snapshot.data as List<Status>;


        return Scaffold(floatingActionButton: Padding(
          padding: EdgeInsets.only(right: 20, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: (){
                },
                child: Container(
                  width: 58,
                  height: 58,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff25d366),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 3),
                          blurRadius: 3,
                        )
                      ]),
                  child: Icon(
                    Icons.camera_alt_rounded,
                    color: Colors.white,
                    size: 26,
                  ),
                ),
              )
            ],
          ),
        ),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xff128C7E),
            title: Text(
              "Whatspp",
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 28,
                  ),
                  onPressed: () {}),
              IconButton(
                  icon: Icon(
                    CupertinoIcons.ellipsis_vertical,
                    color: Colors.white,
                    size: 26,
                  ),
                  onPressed: () {})
            ],
            bottom: AppBar(
              backgroundColor: Color(0xff128C7E),
              automaticallyImplyLeading: false,
              leading: Icon(
                Icons.camera_alt_rounded,
                color: Colors.white.withOpacity(0.5),
                size: 28,
              ),
              actions: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'CHATS',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 40,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'STATUS',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 40,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'CALLS',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
          body: status.isEmpty?CircularProgressIndicator():Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.transparent,
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: 25,
                              backgroundImage: AssetImage(
                              "images/profile.jpg"),                              ),
                              Positioned(
                                left: 30,
                                top: 30,
                                child: CircleAvatar(
                                  backgroundColor: Color(0xff25d366),
                                  radius: 10,
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'My Status',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Tap to add status update',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey.shade200,
                    padding: EdgeInsets.only(
                      left: 20,
                      top: 10,
                      bottom: 10,
                    ),
                    child: Text(
                      'Recent updates',
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  StatusTile(status)



                ],
              ),
            ],
          ),
        );
      }else{
        return Scaffold(body: Center(child: CircularProgressIndicator(color: Color(0xff128C7E),),),);
      }

      }
    );



  }
}

class StatusTile extends StatefulWidget {
  List<Status> status;
StatusTile(this.status);

  @override
  State<StatusTile> createState() => _StatusTileState();
}

class _StatusTileState extends State<StatusTile> {
  @override
  Widget build(BuildContext context) {
    final storyController = StoryController();



    return
      Expanded(
        child: ListView.separated(
          itemBuilder: (context, index) {

            return InkWell(
                onTap: (){

                  List<StoryItem> storyItems=[];
                  for(var i in widget.status[index].statusList!){

                    if(i.image==null||i.image!.isEmpty){
                      storyItems.add(StoryItem.text(title: i.title??"", backgroundColor: Colors.green,));
                    }else{
                      storyItems.add(StoryItem.pageImage(url: i.image??"", controller: storyController,shown:i.readStatus??false,caption: i.title  ));

                    }
                  }

                 setState(() {
                   widget.status[index].shown=true;
                 });




                  showMaterialModalBottomSheet(

                      expand: false,
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) => StoryPageView(storyItems));

                  // Navigator.push(context, MaterialPageRoute(builder: (_)=>StoryPageView(storyItems)));
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      DottedBorder(dashPattern: [50,2],
                        color: widget.status[index].shown?Colors.black26:Color(0xff25D366),
                        borderType: BorderType.Circle,
                        radius: Radius.circular(2),

                        strokeWidth: 4,
                        child: CircleAvatar(
                          radius: 27,
                          backgroundColor: Colors.transparent,
                          child: CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(widget.status[index].image??""),

                          ),
                        ),),

                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.status[index].name}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Just now',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ));
          },
          separatorBuilder: (context, index) {
            return

              Divider(
                indent: MediaQuery.of(context).size.width * 0.2,
                endIndent: MediaQuery.of(context).size.width * 0.05,
                color: Colors.grey.shade300,
                thickness: 1,
              );
          },
          itemCount: widget.status.length,
        ),
      )




    ;

  }
}