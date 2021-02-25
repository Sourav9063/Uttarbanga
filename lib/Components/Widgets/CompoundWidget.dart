import 'package:Uttarbanga/GlobalVar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IconAccount extends StatelessWidget {
  IconAccount({
    @required this.radious,
    Key key,
    this.imglink,
    this.padding,
    this.id,
  }) : super(key: key);
  final double radious;
  final double padding;
  final String imglink;
  final String id;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1000),
        // color: CusCol.dark2
        gradient: RadialGradient(
            colors: [Colors.pinkAccent.shade400, Colors.indigoAccent.shade100]),
      ),
      // color: Colors.black,
      height: radious,

      width: radious,
      child: imglink == null || imglink == ""
          ?
          // Icon(
          //     Icons.account_circle,
          //     size: radious,
          //     color: Colors.white,
          //   )
          Padding(
              padding: EdgeInsets.all(padding ?? 8),
              child: Lottie.asset("assets/lottie/ProfileIcon.json",
                  fit: BoxFit.contain, reverse: true),
            )
          : Padding(
              padding: EdgeInsets.all(padding ?? 8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ImageFull(
                                imgLink: imglink,
                                id: id ?? imglink,
                              )));
                },
                child: ClipOval(
                  child: Hero(
                    tag: id ?? imglink,
                    child: CachedNetworkImage(
                      imageUrl: imglink,
                      height: radious,
                      width: radious,
                      memCacheWidth: 1080,
                      fit: BoxFit.cover,
                      errorWidget: (context, error, stackTrace) {
                        return Center(
                          child: Icon(
                            Icons.error,
                            color: Colors.white,
                            size: kscw * .2,
                          ),
                        );
                      },
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress),
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}

class ImageFull extends StatelessWidget {
  final String imgLink;
  final String id;
  const ImageFull({
    Key key,
    this.imgLink,
    this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: kscw,
        height: ksch,
        child: InteractiveViewer(
            maxScale: 5,
            child: Hero(
              tag: id,
              child: CachedNetworkImage(
                imageUrl: imgLink,
                memCacheWidth: 1080,
                fit: BoxFit.contain,
                errorWidget: (context, error, stackTrace) {
                  return Center(
                    child: Icon(
                      Icons.error,
                      color: Colors.red,
                      size: kscw * .2,
                    ),
                  );
                },
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                  child: CircularProgressIndicator(
                      value: downloadProgress.progress),
                ),
              ),
            )),
      ),
    );
  }
}
