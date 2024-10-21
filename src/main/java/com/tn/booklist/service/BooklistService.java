package com.tn.booklist.service;

import java.util.List;
import java.util.Map;

import com.tn.booklist.model.dto.PagingInfoDTO;
import com.tn.booklist.model.vo.BookDetailInfo;
import com.tn.booklist.model.vo.BooklistVO;

public interface BooklistService {

	// 책 전체 리스트 가져오기
	public Map<String, Object> getAllBooklist(PagingInfoDTO dto) throws Exception;

	public List<BookDetailInfo> read(int bookNo, String ipAddr) throws Exception;
	
//	====================================================엄영준=============================================================
	/**
	 * @param dto 
	 * @작성자 : 엄영준
	 * @작성일 : 2024. 9. 30. 
	 * @클래스명 : tnbookstore
	 * @메서드명 : getCategoryBooklist
	 * @param
	 * @param
	 * @return : List<BooklistVO>
	 * @throws 
	 * @description : 카테고리 선택시 booklist를 불러오는 메서드
	 *
	 */
	public Map<String, Object> getCategoryBooklist(PagingInfoDTO dto, String category) throws Exception;

	public List<BooklistVO> getRecentlyBooks(List<Integer> list) throws Exception;
	
//	====================================================엄영준(end)=============================================================

	
}
