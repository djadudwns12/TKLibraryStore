package com.tn.category.service;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tn.category.dao.CategoryDAO;
import com.tn.category.model.vo.CategoryVO;

/**
 * Handles requests for the application home page.
 */
@Service
public class CategoryServiecimpl implements CategoryService {
	
	@Autowired
	CategoryDAO cDao;
	
	@Override
	public List<CategoryVO> getCategoryList(String category) throws Exception {
		// TODO Auto-generated method stub
		// 처음꺼 가지고 오기
		List<CategoryVO> categoryList = cDao.selectCategoryList(category);
		//  자식 가지고 오기
		// 자식을 가지고 올경우 너무 불필요한 쿼리문을 타므로 안가져옴
//		if(cDao.selectCategoryList(category) != null) {
//			for(CategoryVO c : cDao.selectCategoryList(category)) {
//				categoryList.addAll(cDao.selectCategoryList(c.getGenreCode()));
//			}
//		}
		// 가지고 온것 찍기
		for (int i = 0; i < categoryList.size(); i++) {
			System.out.println(categoryList.get(i));
		}
		
		return categoryList;
	}
	
}
