package com.tn.booklist.service;

import java.util.List;

import com.tn.booklist.model.dto.PagingInfoDTO;
import com.tn.booklist.model.vo.BooklistVO;

public interface BooklistService {

	// 책 전체 리스트 가져오기
	public List<BooklistVO> getAllBooklist(PagingInfoDTO dto) throws Exception;
	

	
}
