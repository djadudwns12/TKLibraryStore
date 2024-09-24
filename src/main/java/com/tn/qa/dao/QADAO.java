package com.tn.qa.dao;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tn.qa.model.vo.QAVO;

/**
 * Handles requests for the application home page.
 */
public interface QADAO {

	/**
	 * @작성자 : 엄영준
	 * @작성일 : 2024. 9. 20. 
	 * @클래스명 : tnbookstore
	 * @메서드명 : selectQAList
	 * @param
	 * @param
	 * @return : List<QAVO>
	 * @throws 
	 * @description : DB에서 Q&A목록을 불러오는 메서드
	 *
	 */
	List<QAVO> selectQAList(String userId) throws Exception;

	QAVO selectQADetail(int qNo) throws Exception;
	
	
}
