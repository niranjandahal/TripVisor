import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tripvisor/Components/customtext.dart';
import 'package:tripvisor/Widgets/shimmereffect.dart';
import 'package:tripvisor/provider/tagprovider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TagDisplay extends StatefulWidget {
  const TagDisplay({super.key});

  @override
  State<TagDisplay> createState() => _TagDisplayState();
}

class _TagDisplayState extends State<TagDisplay> {
  //call future function getadsimglist() from tagprovider.dart

  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<tagprovider>(context, listen: false).getadsimg();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          child: Consumer<tagprovider>(
            builder: (context, tagProvider, child) {
              //beautiful horizontal scrollable list with card and shadow effect
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tagProvider.tags.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        tagProvider.selecttags(tagProvider.tags[index]);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: tagProvider.tagcolor(tagProvider.tags[index]),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: customText(
                            tagProvider.tags[index],
                            15,
                            color: Colors.black,
                            weight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        ////////////////////////////////
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.7,
          margin: EdgeInsets.all(10),
          child: Consumer<tagprovider>(
            builder: (context, tagProvider, child) {
              if (tagProvider.selectedtags == '') {
                //show all images from adsimglist in carousel slider
                return CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.80,
                    initialPage: 0,
                    enableInfiniteScroll: false,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 1500),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    // onPageChanged: callbackFunction,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: tagProvider.adsimglist.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(),
                          child: Image.network(
                            i,
                            fit: BoxFit.fill,
                          ),
                        );
                      },
                    );
                  }).toList(),
                );
              } else {
                //call the future with selectedtag as parameter
                return FutureBuilder(
                    future:
                        tagProvider.getselectedtagimg(tagProvider.selectedtags),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.85,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            itemCount: tagProvider.selectedtagimg.length,
                            itemBuilder: (context, index) {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.85,
                                width: MediaQuery.of(context).size.width * 0.4,
                                margin: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        tagProvider.selectedtagimg[index]),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return tagsloadshimmereffect();
                      }
                    });
              }
            },
          ),
        ),
      ],
    );
  }
}
