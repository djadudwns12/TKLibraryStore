package com.tn.category.dao;

import java.util.List;

import com.tn.category.model.vo.CategoryVO;

public interface CategoryDAO {

	List<CategoryVO> selectCategoryList(String category) throws Exception;


}
