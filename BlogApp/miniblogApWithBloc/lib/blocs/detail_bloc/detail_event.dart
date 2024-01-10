abstract class DetailEvent {}

class FetchArticleByID extends DetailEvent {
  final String id;

  FetchArticleByID({required this.id});
}