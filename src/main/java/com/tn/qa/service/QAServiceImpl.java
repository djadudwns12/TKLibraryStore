package com.tn.qa.service;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tn.admin.model.vo.SearchCriteriaDTO;
import com.tn.admin.model.vo.PagingInfo;
import com.tn.admin.model.vo.PagingInfoDTO;
import com.tn.admin.model.vo.ProductVO;
import com.tn.admin.service.ProductAdminService;
import com.tn.qa.dao.QADAO;
import com.tn.qa.model.vo.QAVO;

@Service
public class QAServiceImpl implements QAService {

	@Autowired
	private QADAO qaDao;

	@Override
	public List<QAVO> getQAList(String userId) throws Exception {
		// TODO Auto-generated method stub
		return qaDao.selectByUserIdQAList(userId);
	}

	@Override
	public QAVO getDetail(int qNo) throws Exception {
		// TODO Auto-generated method stub
		return qaDao.selectQADetail(qNo);
	}

	@Override
	public Map<String, Object> getAllQAList(PagingInfoDTO dto, SearchCriteriaDTO searchCriteria, String sortBy)
			throws Exception {
		Map<String, Object> resultMap = new HashMap<>();
		List<QAVO> list = null;
		
		// 페이지 번호와 페이지 사이즈를 가지고 페이지 정보를 만들기
		PagingInfo pi = makePagingInfo(dto, searchCriteria);

		// 강사님이 풀어주신 예제에 있던 StringUtils.isNullOrEmpty가 mariadb에는 없습니다.
		// 검색조건이 없을때
		if (searchCriteria.getSearchType() == null || searchCriteria.getSearchWord() == null
				|| searchCriteria.getSearchType() == "" || searchCriteria.getSearchWord() == "") { 
			// 정렬조건이 없을때
			if (sortBy.equals("default")) {
				list = qaDao.selectAllQAList(pi);
			}else { // // 정렬이 존재할때 
				list = qaDao.selectAllQAList(pi, sortBy);
			}
			
		// 검색조건이 존재 할때
		} else {
			// 정렬조건이 없을때
			if (sortBy.equals("default")) { 
				list = qaDao.selectAllBoard(pi, searchCriteria);
				System.out.println("sortby default 일때");
			}else { //  정렬조건이 존재할때 
				list = qaDao.selectAllBoard(pi, searchCriteria, sortBy);
				System.out.println("sortby 가 있을때");
			}
		}
		
		// 페이징 정보넘기기
		resultMap.put("pagingInfo", pi);
		// 페이징 하여 온 데이터 넘기기
		resultMap.put("list", list);

		return resultMap;
	}

	private PagingInfo makePagingInfo(PagingInfoDTO dto, SearchCriteriaDTO sc) throws Exception {
		PagingInfo pi = new PagingInfo(dto);

		// 검색어가 없을 때는 전체 데이터 수를 얻어오는 것 부터 페이징 시작
		if (sc.getSearchType() == null || sc.getSearchWord() == null || sc.getSearchType() == ""
				|| sc.getSearchWord() == "") { // 검색어가 없을 경우
			// 검색어가 있을 때는 검색한 글의 데이터 수를 얻어오는 것부터 페이징 시작
			pi.setTotalPostCnt(qaDao.getTotalPostCnt()); // 전체 데이터 수 세팅
		} else {
			pi.setTotalPostCnt(qaDao.getTotalPostCnt(sc));
			System.out.println(qaDao.getTotalPostCnt(sc));
		}

		pi.setTotalPageCnt(); // 전체 페이지 수 세팅
		pi.setStartRowIndex(); // 현재 페이지에서 보여주기 시작할 rowIndex세팅

		// 페이징 블럭 만들기
		pi.setPageBlockNoCurPage();
		pi.setStartPageNoCurBlock();
		pi.setEndPageNoCurBlock();

		return pi;
	}

	@Override
	public int qaSave(QAVO qa) throws Exception {
		return qaDao.insertQA(qa);
	}

}
