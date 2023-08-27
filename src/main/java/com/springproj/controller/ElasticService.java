package com.springproj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ElasticService {

    @Autowired
    private ElasticRepository elasticRepository;

    public void saveElastic(Elastic elastic) {
        elasticRepository.save(elastic);
    }

    public void deleteElastic(Elastic elastic) {
        elasticRepository.delete(elastic);
    }

    public Iterable<Elastic> getAllElastics() {
        return elasticRepository.findAll();
    }

    public Elastic getElasticBySeq(int seq) {
        return elasticRepository.findById(seq).orElse(null);
    }

    public void deleteElasticBySeq(int seq) {
        elasticRepository.deleteById(seq);
    }
}
