package com.tn.category.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tn.category.model.vo.CategoryVO;


public interface CategoryService {

	List<CategoryVO> getCategoryList(String category) throws Exception;

}
