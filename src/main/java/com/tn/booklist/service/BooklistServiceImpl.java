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
import com.tn.booklist.model.vo.BookDetailInfo;
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


	@Override
	@Transactional(readOnly = true, rollbackFor = Exception.class)
	public List<BookDetailInfo> read(int bookNo, String ipAddr) throws Exception {
		
		List<BookDetailInfo> bookInfo = bDao.selectAllByBookNo(bookNo);
				
		return bookInfo;
	}

//	====================================================엄영준=============================================================
	@Override
	public List<BooklistVO> getCategoryBooklist(String category) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		
		PagingInfo pi = makePagingInfo(PagingInfoDTO.builder().pageNo(1).PagingSize(10).build());
		
		params.put("pi", pi);
		params.put("category", category);
		
		
		List<BooklistVO> lst = bDao.selectCategoryBooklist(pi,category);
		
		return lst;
	}
//	====================================================엄영준 END=============================================================
}
