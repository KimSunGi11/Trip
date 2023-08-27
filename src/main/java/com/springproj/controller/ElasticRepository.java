package com.springproj.controller;

import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

public interface ElasticRepository extends ElasticsearchRepository<Elastic, Integer> {

}