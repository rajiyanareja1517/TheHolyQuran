import 'package:flutter/material.dart';
import 'package:the_holy_quran/utils/constants.dart';

class BookMarkPage extends StatefulWidget {
  const BookMarkPage({super.key});

  @override
  State<BookMarkPage> createState() => _BookMarkPageState();
}

class _BookMarkPageState extends State<BookMarkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xff687d5d),
            title: Text(
              "Bookmarks",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          actions: [
            Constants.favData.isEmpty
                ?Container():
            IconButton(onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Delete'),
                    content: const Text(
                        'Are you sure you want to delete all Bookmarks?'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('Confirm'),
                        onPressed: () {
                        setState(() {
                        Constants.favProductData.clear();
                        Constants.favData.clear();

                        });
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            }, icon: Icon(Icons.delete),color: Colors.white,)
          ],
        ),
        body: Constants.favData.isEmpty
            ? Center(
                child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.no_sim_outlined,
                      size: 50,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Data not found!",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    )
                  ],
                ),
              ))
            : Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/home_bg.jpg"),
                        fit: BoxFit.fill,
                        opacity: 0.5)),
                child: ListView.builder(
                  padding: EdgeInsets.all(15),
                  itemCount: Constants.favProductData.length,
                  itemBuilder: (context, index) {
                    final surah = Constants.favProductData[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "surah_details");
                        Constants.currentSurahId = surah.id!;
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 15, top: 15, bottom: 15),
                              margin: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                  color: Colors.green.shade900.withOpacity(0.2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        surah.transliteration!,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: 200,
                                        child: Text(
                                          surah.translation!,
                                          style: TextStyle(fontSize: 20),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 15),
                                        child: Text(
                                          surah.name!,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 15),
                                        child: Text(
                                          "Verses ${surah.total_verses}",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                              alignment: Alignment.center,
                              child: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                setState(() {
                                  Constants.favData.remove(Constants.favProductData[index]);
                                  Constants.favProductData.removeAt(index);
                                });
                                },
                              )),
                        ],
                      ),
                    );
                  },
                ),
              ));
  }
}
