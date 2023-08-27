package com.springproj.spot.repository;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.stream.Collectors;

import org.elasticsearch.ElasticsearchStatusException;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.common.geo.GeoPoint;
import org.elasticsearch.common.unit.DistanceUnit;
import org.elasticsearch.index.query.GeoDistanceQueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.index.query.TermQueryBuilder;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.elasticsearch.search.suggest.SuggestBuilder;
import org.elasticsearch.search.suggest.SuggestBuilders;
import org.elasticsearch.search.suggest.completion.CompletionSuggestion;
import org.elasticsearch.search.suggest.completion.CompletionSuggestionBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//@ComponentScan
@Service
public class SearchService {
	private final RestHighLevelClient elasticsearchClient;

	@Autowired
	public SearchService(RestHighLevelClient elasticsearchClient) {
		this.elasticsearchClient = elasticsearchClient;
	}

	public List<String> getRelatedKeywords(String input) {
		System.out.println("getRelatedKeywords-relatedkeywords:" + input);
		List<String> tokens = extractTokens(input);
		try {
			return generateRelatedKeywords(tokens);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tokens;

	}

	public List<String> extractTokens(String input) {
		List<String> tokens = new ArrayList<>();

		// 입력 문자열을 공백을 기준으로 토큰으로 나누기
		StringTokenizer tokenizer = new StringTokenizer(input);
		while (tokenizer.hasMoreTokens()) {
			tokens.add(tokenizer.nextToken());
		}
		System.out.println("extractTokens-extractTokens:" + tokens);
		return tokens;
	}

	public List<String> generateRelatedKeywords(List<String> tokens) throws IOException {
		List<String> relatedKeywords = new ArrayList<>();
		SearchRequest searchRequest = new SearchRequest("travelspot"); // Elasticsearch index name
		SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();

		for (String token : tokens) {
			CompletionSuggestionBuilder completionSuggestionBuilder = SuggestBuilders
					.completionSuggestion("place_suggest").prefix(token).size(5);

			searchSourceBuilder
					.suggest(new SuggestBuilder().addSuggestion("place_suggest", completionSuggestionBuilder));
		}

		searchRequest.source(searchSourceBuilder);

		try {
			SearchResponse searchResponse = elasticsearchClient.search(searchRequest, RequestOptions.DEFAULT);

			for (String token : tokens) {
				CompletionSuggestion suggest = searchResponse.getSuggest().getSuggestion("place_suggest");

				if (suggest != null) {
					List<String> suggestions = suggest.getEntries().stream()
							.flatMap(entry -> entry.getOptions().stream()).map(option -> option.getText().string())
							.collect(Collectors.toList());

					relatedKeywords.addAll(suggestions);
				}
			}
		} catch (ElasticsearchStatusException e) {
			// Handle Elasticsearch exception
			e.printStackTrace();
		}

		return relatedKeywords;
	}
	
	public List<PlaceInfo> getPlacesNearby(int seq, double distanceInKilometers) {
	    try {
	        SearchRequest searchRequest = new SearchRequest("travelspot"); // Elasticsearch index name
	        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();

	        TermQueryBuilder termQuery = QueryBuilders.termQuery("seq", seq);
	        searchSourceBuilder.query(termQuery);
	        searchRequest.source(searchSourceBuilder);

	        SearchResponse searchResponse = elasticsearchClient.search(searchRequest, RequestOptions.DEFAULT);

	        List<PlaceInfo> nearbyPlaces = new ArrayList<>();
	        double latitude = 0.0;
	        double longitude = 0.0;
	        String placeName = null;
	        int seqn = 0;

	        for (SearchHit hit : searchResponse.getHits().getHits()) {
	            Map<String, Object> sourceAsMap = hit.getSourceAsMap();
	            List<Double> location = (List<Double>) sourceAsMap.get("location");
	            placeName = (String) sourceAsMap.get("place");
	            seqn = (int) sourceAsMap.get("seq");

	            if (location != null && location.size() == 2 && placeName != null & seqn != -1) {
	                latitude = location.get(1);
	                longitude = location.get(0);
	            }
	        }

	        if (latitude != 0.0 && longitude != 0.0) {
	            List<PlaceInfo> nearbyPlacesList = getPlacesNearbyFromCoordinates(latitude, longitude, distanceInKilometers, seq);
	            return nearbyPlacesList;
	        } else {
	            return new ArrayList<>(); // Return an empty list if no valid location found
	        }
	    } catch (IOException e) {
	        // Handle IOException with more appropriate error handling
	        e.printStackTrace();
	        throw new RuntimeException("Error while retrieving nearby places.", e);
	    }
	}

	public List<PlaceInfo> getPlacesNearbyFromCoordinates(double latitude, double longitude, double distanceInKilometers, int exSeq) {
	    try {
	        SearchRequest searchRequest = new SearchRequest("travelspot"); // Elasticsearch index name
	        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();

	        GeoDistanceQueryBuilder geoDistanceQuery = QueryBuilders.geoDistanceQuery("location")
	                .point(latitude, longitude)
	                .distance(distanceInKilometers, DistanceUnit.KILOMETERS);

	        searchSourceBuilder.query(geoDistanceQuery);
	        searchRequest.source(searchSourceBuilder);

	        SearchResponse searchResponse = elasticsearchClient.search(searchRequest, RequestOptions.DEFAULT);

	        List<PlaceInfo> nearbyPlaces = new ArrayList<>();

	        for (SearchHit hit : searchResponse.getHits().getHits()) {
	            Map<String, Object> sourceAsMap = hit.getSourceAsMap();

	            List<Double> location = (List<Double>) sourceAsMap.get("location");
	            String placeName = (String) sourceAsMap.get("place");
	            int seqN = (int) sourceAsMap.get("seq");

	            if (seqN != exSeq && location != null && location.size() == 2 && placeName != null) {
	                double locLatitude = location.get(1);
	                double locLongitude = location.get(0);
	                nearbyPlaces.add(new PlaceInfo(seqN, locLatitude, locLongitude, placeName));
	            }
	        }

	        return nearbyPlaces;
	    } catch (IOException e) {
	        // Handle IOException with more appropriate error handling
	        e.printStackTrace();
	        throw new RuntimeException("Error while retrieving nearby places.", e);
	    }
	}

}
