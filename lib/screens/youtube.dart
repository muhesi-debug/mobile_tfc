import 'package:apisaissai/apiFile/api.dart';
import 'package:apisaissai/colors/color.dart';
import 'package:apisaissai/models/channel_model.dart';
import 'package:flutter/material.dart';
class YouTubeHome extends StatefulWidget {
  const YouTubeHome({super.key});

  @override
  State<YouTubeHome> createState() => _YouTubeHomeState();
}

class _YouTubeHomeState extends State<YouTubeHome> {
   Channel? _channel;

   getChannel() async{
    Channel channel=await ApiService.instance.fetchChannel("UCpxAN_MF3CwzuK5l44Wy-TQ");
    setState(() {
      _channel=channel;
    });
  }
  @override
  void initState(){
    super.initState();
    getChannel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: redColorTextTitre,
        title: const Text("En direct"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            child: Container(
              height: 100,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(_channel!.profilPictureUrl),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(_channel!.title,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: redColorTextTitre),),
                        Text(_channel!.souscriberCount,style: const TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.grey),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        //   ListView.builder(
        //     shrinkWrap: true,
        // itemBuilder:((context, i){
        //   return null;
        // }))
        ],
      )
    );
  }
}