import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/responsive.dart';
import 'package:video_player/video_player.dart';

import 'Content_model.dart';
import 'assets.dart';
import 'models.dart';
class homescreen extends StatefulWidget {
  const homescreen({Key key}):super(key:key);
  @override
  _homescreenState createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    ScrollController scrollController;
    var scroll=0.0;
    @override
    void initState() {
      scrollController =ScrollController()..addListener(() {
        setState(() {
          scroll=scrollController.offset;
        });
      });
      super.initState();
    }
    @override
    void dispose() {
        scrollController.dispose();
            super.dispose();
    }

    final Size size=MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[850],
        child: Icon(Icons.cast),
        onPressed: (){},
      ),
      appBar: PreferredSize(
        preferredSize: Size(size.width,50.0),
        child: Appbar(scroll),
      ) ,
        body: CustomScrollView(
        controller: scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: !Responsive.isDesktop(context)? ContentheaderMob() : Contentheaderdesktop(),
    ),
            SliverPadding(
                padding: EdgeInsets.only(top: 20.0),
              sliver:SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        "Previews",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                    ,previewlist()
                  ],
                ),
              ),
            )
            ,
            SliverToBoxAdapter(
                child: Contactlist("My List", myList, false,PageStorageKey('My List')),
            ),
            SliverToBoxAdapter(
              child: Contactlist("Originals", originals, true,PageStorageKey('Originals')),
            ),
            SliverPadding(
              padding: EdgeInsets.only(bottom: 20.0),
              sliver: SliverToBoxAdapter(
                child: Contactlist("Trending", trending, false,PageStorageKey('Trending')),
              ),
            ),
    ]
    )
    );
  }
  Padding Contactlist(title,list,bool original,key) {
    return Padding(
      key:key ,
      padding: EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Text(
      title,
      style: TextStyle(
      color: Colors.white,
      fontSize: 20.0,fontWeight: FontWeight.bold
      ),
      ),
      ),
    Container(
    height: original?500.0:220.0,
    child: ListView.builder(

    padding: EdgeInsets.symmetric(vertical: 14,horizontal: 16),
    scrollDirection: Axis.horizontal,
    itemCount: list.length,
    itemBuilder: (context, index) {
    Content content2=list[index];
    return GestureDetector(
    onTap: (){},
    child: Stack(
    alignment: Alignment.center,
    children:[ Container(
    margin: EdgeInsets.symmetric(horizontal: 16.0),
    height: original?400.0:200.0,
    width: original?200.0:130.0,
    decoration: BoxDecoration(
    image: DecorationImage(image: AssetImage(content2.imageUrl
    ),fit: BoxFit.cover),
    ),
    ),
    ]
    )
    );
    }
    )
    ),
      ]
      ),
    );
  }
  Container previewlist() {
    return Container(
                    height: 165,
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 14,horizontal: 8),
                      scrollDirection: Axis.horizontal,
                        itemCount: previews.length,
                        itemBuilder: (context, index) {
                          Content content2=previews[index];
                          return GestureDetector(
                            onTap: (){},
                            child: Stack(
                              alignment: Alignment.center,
                              children:[ Container(
                                margin: EdgeInsets.symmetric(horizontal: 16.0),
                                height: 130.0,
                                width: 130.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage(content2.imageUrl
                                  ),fit: BoxFit.cover),
                                  shape: BoxShape.circle
                                    ,border: Border.all(
                                  color: content2.color,
                                  width: 4.0
                                )
                                ),
                              ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                                  height: 130.0,
                                  width: 130.0,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient
                                        (
                                          colors: [Colors.black87,Colors.black45,Colors.transparent]
                                          ,stops: [0,0.25,1]
                                          ,begin: Alignment.bottomCenter
                                          ,end : Alignment.topCenter
                                      ),
                                      shape: BoxShape.circle
                                      ,border: Border.all(
                                      color: content2.color,
                                      width: 4.0
                                  )
                                  ),
                                ),
                                Positioned(
                                    child:SizedBox(
                                      height: 60.0,
                                      child: Image.asset(content2.titleImageUrl),
                                    )
                                )
                              ]
                            ),
                          );
                        },),
                  );
  }

  Stack ContentheaderMob() {
    return Stack(
              alignment: Alignment.center,
              children:[
                Container(
                  height: 500.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          gotContent.imageUrl
                      )
                        , fit: BoxFit.cover
                    )
                  ),
              ),
                Container(
                  height: 500.0,
                  decoration: BoxDecoration(
                      gradient: LinearGradient
                        (
                        colors: [Colors.black,Colors.transparent]
                            ,begin: Alignment.bottomCenter
                          ,end : Alignment.topCenter
                      ),
                  )
                ),
                Positioned(
                    bottom: 110,child:
                SizedBox(
                  width: 250.0,
                  child: Image.asset(gotContent.titleImageUrl),
                ))
                ,Positioned(left: 0,
                    right: 0,
                    bottom: 40.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: (){},
                          child: Column(
                            children: [
                              Icon(Icons.add,color: Colors.white,),
                              SizedBox(width: 2.0,),
                              Text("List",style:TextStyle(color:Colors.white,fontWeight: FontWeight.w600),)
                            ],
                          ),
                        ) ,
                        FlatButton.icon(onPressed: (){},
                             color: Colors.white,
                              icon: Icon(Icons.play_arrow,size: 30.0,),
                              label: const Text(
                                "Play",style: TextStyle( fontWeight: FontWeight.w600,fontSize: 16.0),
                              ),
                        )
                        ,
                        GestureDetector(
                            onTap: (){},
                            child: Column(
                              children: [
                                Icon(Icons.info,color: Colors.white,),
                                SizedBox(width: 2.0,),
                                Text("Info",style:TextStyle(color:Colors.white,fontWeight: FontWeight.w600),)
                      ],
                    )
                )
              ]
            ),
          )
        ],
  );
  }
  Stack Contentheaderdesktop() {
   // VideoPlayerController videoPlayerController;
    /*bool isMuted=true;
    @override
    void initState() {
super.initState();
videoPlayerController=VideoPlayerController.network(Assets.gotVideoUrl)..initialize().then((_) => setState((){

}))..setVolume(0)..play() ;
  @override
   void dispose()
      {
        super.dispose();
        videoPlayerController.dispose();
      }
    }*/
    return Stack(
        alignment: Alignment.bottomLeft,
        children: [
          AspectRatio(
            aspectRatio: 2.344,
            child: Image.asset(gotContent.imageUrl, fit: BoxFit.cover)
            ),
          Container(
              height: 500.0,
              decoration: BoxDecoration(
                gradient: LinearGradient
                  (
                    colors: [Colors.black, Colors.transparent]
                    , begin: Alignment.bottomCenter
                    , end: Alignment.topCenter
                ),
              )
          ),
         Positioned(left: 60.0,
             right: 60.0,
             bottom: 150.0,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SizedBox(
                   width: 250.0,
                   child: Image.asset(Assets.gotTitle),
                 ),
               SizedBox(width: 20.0,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     GestureDetector(
                       onTap: (){},
                       child: Column(
                         children: [
                           Icon(Icons.add,color: Colors.white,),
                           SizedBox(width: 2.0,),
                           Text("List",style:TextStyle(color:Colors.white,fontWeight: FontWeight.w600),)
                         ],
                       ),
                     ) ,
                     FlatButton.icon(onPressed: (){},
                       color: Colors.white,
                       icon: Icon(Icons.play_arrow,size: 30.0,),
                       label: const Text(
                         "Play",style: TextStyle( fontWeight: FontWeight.w600,fontSize: 16.0),
                       ),
                     )
                     ,
                     FlatButton.icon(onPressed: (){},
                       color: Colors.white,
                       icon: Icon(Icons.info,color: Colors.white,),
                       label:  Text("Info",style:TextStyle(fontSize: 16.0,color:Colors.white,fontWeight: FontWeight.w600),)
                       ),
                     SizedBox(
                       width: 20.0,
                     )
                           ],
                         )
               ],
             )
         )
        ],
    );
  }



  Container Appbar(double scroll) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal:24 ,vertical:10 ),
        color: Colors.black.withOpacity((scroll/350).clamp(0,1).toDouble()),
        child:!Responsive.isDesktop(context)?mobAppbar():desktopAppbar()
       /* Responsive(
          mobile:mobAppbar(),
          desktop:desktopAppbar(),
        )*/
      );
  }

  SafeArea mobAppbar() {
    return SafeArea(
        child: Row(
          children: <Widget>[
            Image.asset(Assets.netflixLogo0)
            ,Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  item("Tv shows".toUpperCase()),
                  item("Movies".toUpperCase()),
                  item("My list".toUpperCase()),
                ],
              ),
            )
          ],
        ),
      );
  }
  SafeArea desktopAppbar() {
    return SafeArea(
      child: Row(
        children: <Widget>[
          Image.asset(Assets.netflixLogo1)
          ,Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                item("Home".toUpperCase()),
                item("Latest".toUpperCase()),
                item("Tv shows".toUpperCase()),
                item("Movies".toUpperCase()),
                item("My list".toUpperCase()),
              ],
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }

  GestureDetector item(String x) {
    return GestureDetector(
                    onTap: (){},
                    child:
                    Text(x,style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                    ),),
                  );
  }
}
