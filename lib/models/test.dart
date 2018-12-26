class Test{
  Test(this.userId, this.id, this.title, this.completed);
  Test.empty(){
    this.userId = 1;
    this.id = 1;
    this.title = "";
    this.completed = false;
  }

  int userId;
  int id;
  String title;
  bool completed;

   Test.fromJson(Map json)
      : this.userId = json['userId'],
        this.id = json['id'],
        this.title = json['title'],
        this.completed = json['completed'];
}