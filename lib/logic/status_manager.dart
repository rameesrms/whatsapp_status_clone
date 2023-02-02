


import 'package:dio/dio.dart';
import 'package:whatsappstatus/models/categorized_status_model.dart';
import 'package:whatsappstatus/models/status_model.dart';

class StatusManager {
String url = "https://my-json-server.typicode.com/shakeebM/StoriesApi/stories";

Future<List<Status>> getStatusData()async{
  List<Status> status =  [];

  List<dynamic> response = await get(url);

  List<StatusModel> unsortedStatus =[];

  for(var i in response){
    unsortedStatus.add(StatusModel.fromJson(i));
  }



  List<int> numbers =[];
  for(var i in unsortedStatus){

   if(numbers.contains(i.profile!.id)==false){
     status.add(Status(name: i.profile!.name,userId: i.profile!.id,image: i.profile!.image,statusList: []));

   }
    numbers.add(i.profile!.id??0);
  }








  List<int> temp =[];
  for(var i in status){


    for(var j in unsortedStatus){
      if(j.profile!.id == i.userId&&temp.contains(j.profile!.id)==false){
        i.statusList!.add(StatusList(image: j.image,readStatus:j.readStatus ,id:j.id ,title:j.title));
// unsortedStatus.remove(j);
      }
    }

    temp.add(i.userId??0);


  }


  for(var i in status){

    if(isViewed(i.statusList!)){
      i.shown = true;
    }

  }




    return status;


}

bool isViewed(List<StatusList> list){

  for(var i in list){
    if(i.readStatus==false){
      return false;
    }
  }
  return true;
}




Future <dynamic> get( String url)async{
  var dio = Dio();
  try{

    Response response = await dio.get(
      url
    );
    return response.data;
  }
  catch(e){
    print(e);
  }



}

}