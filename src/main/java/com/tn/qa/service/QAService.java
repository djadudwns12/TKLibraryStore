package com.tn.qa.service;

import java.util.List;
import java.util.Map;

import com.tn.admin.model.vo.PagingInfoDTO;
import com.tn.admin.model.vo.SearchCriteriaDTO;
import com.tn.qa.model.vo.QAVO;

public interface QAService {
	
	/**
	 * @작성자 : 엄영준
	 * @작성일 : 2024. 9. 19. 
	 * @클래스명 : tnbookstore
	 * @메서드명 : getQAList
	 * @param
	 * @param
	 * @return : List<QAVO>
	 * @throws 
	 * @description : 로그인한 회원이 작성한 
	 *
	 */
	List<QAVO> getQAList(String userId) throws Exception;

	/**
	 * @작성자 : 엄영준
	 * @작성일 : 2024. 9. 25. 
	 * @클래스명 : tnbookstore
	 * @메서드명 : getDetail
	 * @param
	 * @param
	 * @return : QAVO
	 * @throws 
	 * @description : List 클릭시 클릭한 QA의 상세정보가지고 오기
	 *
	 */
	QAVO getDetail(int qNo) throws Exception;

	/**
	 * @param sortBy 
	 * @param searchCriteria 
	 * @param dto 
	 * @작성자 : 엄영준
	 * @작성일 : 2024. 9. 25. 
	 * @클래스명 : tnbookstore
	 * @메서드명 : getAllQAList
	 * @param
	 * @param
	 * @return : List<QAVO>
	 * @throws 
	 * @description : 모든 Q&A 목록 불러오기
	 *
	 */
	Map<String, Object> getAllQAList(PagingInfoDTO dto, SearchCriteriaDTO searchCriteria, String sortBy) throws Exception;

	int qaSave(QAVO qa) throws Exception;

	int qaAnswerSave(QAVO qa) throws Exception;

}
