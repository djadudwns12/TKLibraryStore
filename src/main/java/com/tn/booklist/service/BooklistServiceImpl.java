package com.tn.booklist.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.tn.booklist.dao.BooklistDAO;
import com.tn.booklist.model.dto.PagingInfo;
import com.tn.booklist.model.dto.PagingInfoDTO;
import com.tn.booklist.model.vo.BooklistVO;

@Service
public class BooklistServiceImpl implements BooklistService {
	
	@Autowired
	private BooklistDAO bDao;

	private static Logger logger = LoggerFactory.getLogger(BooklistServiceImpl.class);
	
	@Override
	@Transactional(readOnly = true)
	public List<BooklistVO> getAllBooklist(PagingInfoDTO dto) throws Exception {
		
		PagingInfo pi = makePagingInfo(dto);
		
		List<BooklistVO> lst = bDao.selectAllBook(pi);
		
		return lst;
	}
	
	
	private PagingInfo makePagingInfo(PagingInfoDTO dto) throws Exception {
		PagingInfo pi = new PagingInfo(dto);
		
		bDao.getTotalPostCnt();
		
		pi.setTotalPageCnt();	//전체 페이지 수 세팅
		pi.setStartRowIndex();	// 현재 페이지에서 보여주기 시작할 rowIndex 세팅
		
		
		// 페이징 블럭 만들기
		pi.setPageBlockNoCurPage();
		pi.setStartPageNoCurBlock();
		pi.setEndPageNoCurBlock();
		
		
		System.out.println(pi.toString());
		return pi;
	}

}
