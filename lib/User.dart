class Post {
  final int userId;

  final int id;

  final String title;

  final String body;

  Post({
    this.userId,
    this.id,
    this.title,
    this.body
  });
}


class PostState{
  List<Post> posts;
  bool loading;
  bool error;

  PostState({
    this.posts = const [],
    this.loading = true,
    this.error = false,
  });

  void reset(){
    this.posts = [];
    this.loading = true;
    this.error = false;
  }


  Future<void> getFromApi() async{
    this.posts = [
      new Post(userId: 1, id: 1, title: "Title 1", body: "Content 1"),
      new Post(userId: 1, id: 2, title: "Title 2", body: "Content 2"),
      new Post(userId: 2, id: 3, title: "Title 3", body: "Content 3"),
    ];
    this.loading = false;
    this.error = false;
  }
}