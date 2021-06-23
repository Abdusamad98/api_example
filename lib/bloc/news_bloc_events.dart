abstract class NewsListingEvent {}

class InitialNewsEvent extends NewsListingEvent {}

class SearchTextChangedEvent extends NewsListingEvent {
  final String searchTerm;
  SearchTextChangedEvent({required this.searchTerm});
}
