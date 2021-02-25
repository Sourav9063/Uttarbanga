import 'package:Uttarbanga/Backend/Data/UserData.dart';
import 'package:Uttarbanga/Backend/Firestore/firestore.dart';
import 'package:Uttarbanga/Components/Widgets/CompoundWidget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:url_launcher/url_launcher.dart';

import '../GlobalVar.dart';

class UserList extends StatefulWidget {
  UserList({Key key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("সদস্যবৃন্দ"),
      ),
      body: FutureBuilder<List<UserData>>(
        future: UttarbangaFirestoreReq().getUserList(),
        builder: (context, AsyncSnapshot<List<UserData>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("কিছু যান্ত্রিক ত্রুটি হচ্ছে। আবার চেষ্টা করুন।"),
            );
          }
          if (snapshot.hasData) {
            return AnimationLimiter(
              child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 500),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: Card(
                          shape: RoundedRectangleBorder(
                              // side: new BorderSide(color: Color(0xFF2A8068)),
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(14))),
                          color: Colors.teal.withOpacity(.5),
                          child: ListTile(
                            isThreeLine: true,
                            subtitle: Text(snapshot.data[index].department +
                                "\n" +
                                snapshot.data[index].designation),
                            title: Text(snapshot.data[index].name),
                            trailing: Material(
                              borderRadius: BorderRadius.circular(400),
                              color: Colors.white54,
                              child: IconButton(
                                color: Colors.green.shade900,
                                icon: Icon(
                                  Icons.phone,
                                  size: kscw * .08,
                                  // color: Colors.green,
                                ),
                                onPressed: () async {
                                  String url =
                                      'tel:' + snapshot.data[index].phoneNumber;
                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  }
                                },
                              ),
                            ),
                            leading: IconAccount(
                              // id: snapshot.data[index].uid,
                              radious: kscw * .15,
                              padding: 2,
                              imglink: snapshot.data[index].imageLink,
                            ),
                            // contentPadding: EdgeInsets.all(4),

                            // leading: ClipOval(
                            //   child: CachedNetworkImage(
                            //     fit: BoxFit.contain,
                            //     imageUrl: snapshot.data[index].imageLink,
                            //     errorWidget: (context, error, stackTrace) {
                            //       return Center(
                            //         child: Icon(
                            //           Icons.error,
                            //           color: Colors.red,
                            //           size: kscw * .2,
                            //         ),
                            //       );
                            //     },
                            //     progressIndicatorBuilder:
                            //         (context, url, downloadProgress) => Center(
                            //       child: CircularProgressIndicator(
                            //           value: downloadProgress.progress),
                            //     ),
                            //   ),
                            // ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
