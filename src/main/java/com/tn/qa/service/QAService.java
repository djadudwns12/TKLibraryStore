package com.tn.qa.service;

import java.util.List;

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

	QAVO getDetail(int qNo) throws Exception;

}
