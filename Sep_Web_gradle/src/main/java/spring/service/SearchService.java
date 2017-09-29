package spring.service;
import org.springframework.stereotype.Component;

@Component
public class SearchService {
	public SearchResult search(SearchCommand command) {
		return new SearchResult();
	}
}
