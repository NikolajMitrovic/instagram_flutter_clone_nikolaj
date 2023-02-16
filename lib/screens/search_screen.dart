import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/screens/profile_screen.dart';
import 'package:instagram_flutter/utilities/colors.dart';
import 'package:instagram_flutter/utilities/global_variables.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  bool isShowUsers = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mobileBackgroundColor,
          title: Form(
            child: TextFormField(
              controller: searchController,
              decoration: const InputDecoration(labelText: 'Search for a user'),
              onFieldSubmitted: (String _) {
                setState(() {
                  isLoading = true;

                  isShowUsers = true;
                });
              },
            ),
          ),
        ),
        // body: isLoading
        //     ? const Center(
        //         child: CircularProgressIndicator(),
        //       )
        body: () {
          return isShowUsers ? UserSearch(searchController: searchController) : const PostSearch();
        }());
  }
}

class PostSearch extends StatelessWidget {
  const PostSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection('posts').orderBy('datePublished').get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          // setState(() {
          //   isLoading = false;
          // });
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return StaggeredGridView.countBuilder(
          crossAxisCount: 3,
          itemCount: (snapshot.data! as dynamic).docs.length,
          itemBuilder: (context, index) => Image.network(
            (snapshot.data! as dynamic).docs[index]['postUrl'],
            fit: BoxFit.cover,
          ),
          staggeredTileBuilder: (index) => MediaQuery.of(context).size.width > webScreenSize ? StaggeredTile.count((index % 7 == 0) ? 1 : 1, (index % 7 == 0) ? 1 : 1) : StaggeredTile.count((index % 7 == 0) ? 2 : 1, (index % 7 == 0) ? 2 : 1),
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        );
      },
    );
  }
}

class UserSearch extends StatelessWidget {
  const UserSearch({
    Key? key,
    required this.searchController,
  }) : super(key: key);

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection('users').where('username', isGreaterThanOrEqualTo: searchController.text).get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          // setState(() {
          //   isLoading = false;
          // });
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: (snapshot.data! as dynamic).docs.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(
                    uid: (snapshot.data! as dynamic).docs[index]['uid'],
                  ),
                ),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    (snapshot.data! as dynamic).docs[index]['photoUrl'] ?? '',
                  ),
                  radius: 16,
                ),
                title: Text(
                  (snapshot.data! as dynamic).docs[index]['username'] ?? '',
                ),
              ),
            );
          },
        );
      },
    );
  }
}
