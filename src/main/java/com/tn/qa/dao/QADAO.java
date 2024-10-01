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

import com.tn.admin.model.vo.PagingInfo;
import com.tn.admin.model.vo.SearchCriteriaDTO;
import com.tn.qa.model.vo.QAVO;

/**
 * Handles requests for the application home page.
 */
public interface QADAO {

	
//	엄영준 =====================================================================================================================================
	/**
	 * @작성자 : 엄영준
	 * @작성일 : 2024. 9. 20. 
	 * @클래스명 : tnbookstore
	 * @메서드명 : selectByUserIdQAList
	 * @param
	 * @param
	 * @return : List<QAVO>
	 * @throws 
	 * @description : DB에서 Q&A목록을 불러오는 메서드
	 *
	 */
	List<QAVO> selectByUserIdQAList(String userId) throws Exception;

	/**
	 * @작성자 : 802-10
	 * @작성일 : 2024. 9. 26. 
	 * @클래스명 : tnbookstore
	 * @메서드명 : selectQADetail
	 * @param
	 * @param
	 * @return : QAVO
	 * @throws 
	 * @description : 상세보기를 불러오는 쿼리문
	 *
	 */
	QAVO selectQADetail(int qNo) throws Exception;

	/**
	 * @param pi 
	 * @작성자 : 802-10
	 * @작성일 : 2024. 9. 26. 
	 * @클래스명 : tnbookstore
	 * @메서드명 : selectAllQAList
	 * @param
	 * @param
	 * @return : List<QAVO>
	 * @throws 
	 * @description : 페이징을 하여 관리자 페이지의 QA게시판에 list를 띄워줄 쿼리문을 부르는 메서드
	 *
	 */
	List<QAVO> selectAllQAList(PagingInfo pi) throws Exception;

	/**
	 * @작성자 : 엄영준
	 * @작성일 : 2024. 9. 26. 
	 * @클래스명 : tnbookstore
	 * @메서드명 : getTotalPostCnt
	 * @param
	 * @param
	 * @return : int
	 * @throws 
	 * @description : 검색없이 페이징시 전체게시물의 개수를 불러오기 위한 쿼리문을 시행하는 메서드
	 *
	 */
	int getTotalPostCnt() throws Exception;

	/**
	 * @작성자 : 802-10
	 * @작성일 : 2024. 9. 26. 
	 * @클래스명 : tnbookstore
	 * @메서드명 : getTotalPostCnt
	 * @param
	 * @param
	 * @return : int
	 * @throws 
	 * @description : 검색어를 입력하여 검색한 것을 바탕으로 개수를 가지고오는 쿼리문을 부르는 메서드
	 *
	 */
	int getTotalPostCnt(SearchCriteriaDTO sc);

	List<QAVO> selectAllQAList(PagingInfo pi, String sortBy);

	List<QAVO> selectAllBoard(PagingInfo pi, SearchCriteriaDTO searchCriteria);

	List<QAVO> selectAllBoard(PagingInfo pi, SearchCriteriaDTO searchCriteria, String sortBy);
	
	/**
	 * @작성자 : 802-10
	 * @작성일 : 2024. 9. 27. 
	 * @클래스명 : tnbookstore
	 * @메서드명 : insertQA
	 * @param
	 * @param
	 * @return : int
	 * @throws 
	 * @description : 로그인 한 회원의 Q&A를 저장하는 쿼리문을 부르는 메서드
	 *
	 */
	int insertQA(QAVO qa);

	/**
	 * @작성자 : 엄영준 
	 * @작성일 : 2024. 10. 1. 
	 * @클래스명 : tnbookstore
	 * @메서드명 : saveQaAnswer
	 * @param
	 * @param
	 * @return : int
	 * @throws 
	 * @description : qa 답변 저장하기
	 *
	 */
	int saveQaAnswer(QAVO qa);
	
	
	
	
//	엄영준 =====================================================================================================================================
	
}
