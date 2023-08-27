package com.springproj.controller;

import org.elasticsearch.index.query.QueryBuilders;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.data.elasticsearch.core.ElasticsearchRestTemplate;
import org.springframework.data.elasticsearch.core.SearchHit;
import org.springframework.data.elasticsearch.core.SearchHits;
import org.springframework.data.elasticsearch.core.query.NativeSearchQuery;
import org.springframework.data.elasticsearch.core.query.NativeSearchQueryBuilder;

@SpringBootApplication(exclude = DataSourceAutoConfiguration.class)
public class MainAPP {

    public static void main(String[] args) {
        // Spring Boot 애플리케이션을 실행하여 Spring 컨텍스트를 초기화합니다.
        ConfigurableApplicationContext context = SpringApplication.run(MainAPP.class, args);

        // Spring 컨텍스트에서 ElasticService 빈을 가져옵니다.
        ElasticService elasticService = context.getBean(ElasticService.class);

        // Elastic 객체 생성 및 데이터 설정
        Elastic elastic = new Elastic();
        elastic.setSeq(1200);
        elastic.setPlace("더조은");
        elastic.setAddress("종로구");

        // ElasticService를 사용하여 Elastic 데이터 Elasticsearch에 저장
        elasticService.saveElastic(elastic);

        // id가 1200인 Elastic 데이터 가져와서 출력
        Elastic retrievedElastic = elasticService.getElasticBySeq(1200);
        if (retrievedElastic != null) {
            System.out.println("Retrieved Elastic: " + retrievedElastic.getPlace());
            System.out.println("Latitude: " + retrievedElastic.getLatitude());
            System.out.println("Longitude: " + retrievedElastic.getLongitude());
        } else {
            System.out.println("Elastic with id 1200 not found.");
        }
        
     // ElasticsearchRestTemplate을 사용하여 Elasticsearch와 상호작용
        ElasticsearchRestTemplate elasticsearchRestTemplate = context.getBean(ElasticsearchRestTemplate.class);

        // 검색 쿼리 생성
        NativeSearchQuery searchQuery = new NativeSearchQueryBuilder()
                .withQuery(QueryBuilders.geoDistanceQuery("location")
                        .point(retrievedElastic.getLatitude(), retrievedElastic.getLongitude())
                        .distance("30km"))
                .build();

        // 검색 실행
        SearchHits<Elastic> searchHits = elasticsearchRestTemplate.search(searchQuery, Elastic.class);

        // 검색 결과 출력
        for (SearchHit<Elastic> hit : searchHits) {
            Elastic resultElastic = hit.getContent();
            System.out.println("Found Elastic: " + resultElastic.getPlace());
        }
        

        // Spring 컨텍스트를 닫습니다.
        context.close();
    }
}