import 'package:flutter/material.dart' hide SearchBar;
import 'package:wallscape/controller/apiOper.dart';
import 'package:wallscape/model/photosModel.dart';
import 'package:wallscape/views/widgets/CateBlock.dart';
import 'package:wallscape/views/widgets/CustomAppBar.dart';
import 'package:wallscape/views/widgets/SearchBar.dart';
import 'package:wallscape/views/screens/fullScreen.dart';



import 'FullScreen.dart' hide FullScreen;

class SearchScreen extends StatefulWidget {
  String query;
  SearchScreen({super.key , required this.query});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  late List<PhotosModel> searchResults;
  bool isLoading = true;

  GetSearchResults() async{
    searchResults = await ApiOperations.searchWallpapers(widget.query);

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetSearchResults();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: CustomAppBar(),
      ),

      body: isLoading ? Center(child: CircularProgressIndicator(),) : SingleChildScrollView(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: SearchBar()),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 400,
                    crossAxisCount: 2,
                    crossAxisSpacing: 13,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: searchResults.length,
                  itemBuilder: ((context , index) => InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FullScreen(
                                  imgUrl:
                                  searchResults[index].imgSrc)));
                    },
                    child: Hero(
                      tag: searchResults[index].imgSrc,
                      child: Container(
                        height: 800,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(20)),

                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                              height: 700,
                              width: 50,
                              fit: BoxFit.cover,
                              searchResults[index].imgSrc),
                        ),
                      ),
                    ),
                  ))),
            )
          ],
        ),
      ),
    );
  }
}
