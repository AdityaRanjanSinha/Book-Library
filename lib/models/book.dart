class Book{
  Book({required this.title , required this.author , required this.subjects , required this.coverpage ,required this.languages});
  
  final String title;
  final String author;
  final List<String> subjects;
  final String coverpage;
  final String languages;

  factory Book.fromJson(Map<String, dynamic> json) {
  return Book(
    title: json['title'] ?? 'Unknown',  
    author: json['authors'] != null && json['authors'].isNotEmpty
        ? json['authors'][0]['name'] ?? 'Unknown' 
        : 'Unknown',  
    subjects: List<String>.from(json['subjects'] ?? []), 
    coverpage: json['formats'] != null && json['formats']['image/jpeg'] != null
        ? json['formats']['image/jpeg'] 
        : '',  
    languages: json['languages'] != null 
        ? json['languages'].join(', ') 
        : '',  
  );
}

}