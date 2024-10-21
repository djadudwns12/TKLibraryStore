package com.tn.category.dao;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.tn.category.model.vo.CategoryVO;

/**
 * Handles requests for the application home page.
 */
@Repository
public class CategoryDAOImpl implements CategoryDAO{

	@Autowired
	SqlSession sess;
	
	private static final String NS = "com.tn.mapper.categoryMapper";
	
	@Override
	public List<CategoryVO> selectCategoryList(String category) throws Exception {
		// TODO Auto-generated method stub
		return sess.selectList(NS+".selectCategory", category);
	}
		
}
