class NoteModel{
  String? title;
  String? desc;
  String? time;

  NoteModel({required this.title, required this.desc, required this.time});
  factory NoteModel.fromDoc(Map<String,dynamic>doc){
    return NoteModel(
        title: doc['title'], desc: doc['desc'], time: doc['time']);
  }

  Map<String,dynamic>toDoc(){
    return {
      'title':title,
      'desc':desc,
      'time':time,
    };
  }
}