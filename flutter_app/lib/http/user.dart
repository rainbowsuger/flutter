class MoviesList {
  final int count;
  final int start;
  final int total;
  final List<dynamic> subjects;
  final String title;

  MoviesList(this.count, this.start, this.total, this.subjects,this.title);

  MoviesList.fromJson(Map<String, dynamic> json)
      : count = json['count'],
        start = json['start'],
        total = json['total'],
        subjects = json['subjects'],
        title = json['title'];

  Map<String, dynamic> toJson() =>
    {
      'count': count,
      'start': start,
      'total': total,
      'subjects': subjects,
      'title': title,
    };
}
