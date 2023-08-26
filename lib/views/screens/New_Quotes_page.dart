import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:quotes/helper/pixabay_api_helper.dart';
import 'package:quotes/modal/pixabay_api_modal.dart';

import '../../helper/quotes_api_helper.dart';
import '../../modal/quotes_api_modal.dart';

class New_Quotes extends StatelessWidget {
  const New_Quotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Quotes_api.quotes_api.quotes_get(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<Quotes_api_modal>? quotes = snapshot.data;
            return FutureBuilder(
              future: Pixabay_api_helper.pixabay_api_helper.apicaller(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("${snapshot.error}"),
                  );
                } else if (snapshot.hasData) {
                  List<pixabay_api>? wallpapers = snapshot.data;
                  return MasonryGridView.builder(
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                    ),
                    itemCount: 20,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.all(12),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: (index % 3 == 0) ? 200 : 300,
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 6, bottom: 6),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "${quotes![index].q}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                Text(
                                  "-${quotes![index].a}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "${wallpapers![index].largeImageURL}"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
