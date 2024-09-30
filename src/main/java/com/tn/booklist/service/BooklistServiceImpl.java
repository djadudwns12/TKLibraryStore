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
	public Map<String, Object> getAllBooklist(PagingInfoDTO dto) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		PagingInfo pi = makePagingInfo(dto);
		
		List<BooklistVO> lst = bDao.selectAllBook(pi);
		
		resultMap.put("pagingInfo", pi);
		resultMap.put("listAll", lst);
		
		return resultMap;
	}
	
	
	private PagingInfo makePagingInfo(PagingInfoDTO dto) throws Exception {
		PagingInfo pi = new PagingInfo(dto);
		
		pi.setTotalPostCnt(bDao.getTotalPostCnt());
		
		pi.setTotalPageCnt();	//전체 페이지 수 세팅
		pi.setStartRowIndex();	// 현재 페이지에서 보여주기 시작할 rowIndex 세팅
		
		
		// 페이징 블럭 만들기
		pi.setPageBlockNoCurPage();
		pi.setStartPageNoCurBlock();
		pi.setEndPageNoCurBlock();
		
		
		System.out.println(pi.toString());
		return pi;
	}

	private PagingInfo makePagingInfo(PagingInfoDTO dto,int totalCount) throws Exception {
		PagingInfo pi = new PagingInfo(dto);
		
		pi.setTotalPostCnt(bDao.getTotalPostCnt());
		
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
	public Map<String, Object> getCategoryBooklist(PagingInfoDTO dto, String category) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		
		int totalCount = bDao.countCategoryBooklist(category);
		
		PagingInfo pi = makePagingInfo(dto,totalCount);
		
		List<BooklistVO> lst = bDao.selectCategoryBooklist(pi,category);
		
		result.put("pi", pi);
		result.put("list", lst);
		
		return result;
	}
//	====================================================엄영준 END=============================================================
}
