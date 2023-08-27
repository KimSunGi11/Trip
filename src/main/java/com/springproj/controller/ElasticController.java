package com.springproj.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springproj.spot.repository.SearchService;

@Controller
public class ElasticController {

	@Autowired
	private ElasticService elasticService;
	@Autowired
	SearchService searchService;

	@GetMapping("/displayElastic")
	public String displayElastic(Model model) {
		// Elastic 객체 생성 및 데이터 설정
		Elastic elastic = new Elastic();
		elastic.setSeq(1150);
		elastic.setPlace("더조은");
		elastic.setAddress("종로구");

		elasticService.saveElastic(elastic);

		Elastic retrievedElastic = elasticService.getElasticBySeq(1);
		model.addAttribute("retrievedElastic", retrievedElastic);

		return "elastic";
	}

	@GetMapping(value = "/autocomplete.do")
	public List<String> autocomplete(@RequestParam String prefix) {
		System.out.println("getmapping 성공 ");
		List<String> suggestions = searchService.getRelatedKeywords(prefix); // Adjust size as needed return
		return suggestions;
	}
}
