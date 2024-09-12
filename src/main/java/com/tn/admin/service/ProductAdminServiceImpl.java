package com.tn.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mariadb.jdbc.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tn.admin.model.vo.*;
import com.tn.admin.model.vo.PagingInfo;
import com.tn.admin.model.vo.PagingInfoDTO;
import com.tn.admin.model.vo.SearchCriteriaDTO;
import com.tn.admin.dao.ProductAdminDAO;
import com.tn.admin.model.vo.ProductVO;

@Service
public class ProductAdminServiceImpl implements ProductAdminService {

	@Autowired
	private ProductAdminDAO pDao;
	
	@Override
	public Map<String, Object> listAll(PagingInfoDTO dto, SearchCriteriaDTO searchCriteria, String sortBy) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<ProductVO> list = null;
		PagingInfo pi = makePagingInfo(dto, searchCriteria);
		
		// 강사님이 풀어주신 예제에 있던 StringUtils.isNullOrEmpty가 mariadb에는 없습니다.
		if(searchCriteria.getSearchType() == null || searchCriteria.getSearchWord() == null || 
			searchCriteria.getSearchType() == "" || searchCriteria.getSearchWord() == "") {
			if(sortBy.equals("default")) {
				
				list = pDao.getList(pi);
				//System.out.println("설마 여기도 타는것인가");
			} else {
				
				list = pDao.getList(pi,sortBy);
				System.out.println(list.get(0).getTitle());
			}
						
		} else {
			
			//list = pDao.selectAllBoard(pi, searchCriteria);
		}
		
		resultMap.put("pagingInfo", pi);
		resultMap.put("productList", list);
		
		
		return resultMap;
	}

	
	private PagingInfo makePagingInfo(PagingInfoDTO dto, SearchCriteriaDTO sc) throws Exception {
		PagingInfo pi = new PagingInfo(dto);
		
		// 검색어가 없을 때는 전체 데이터 수를 얻어오는 것 부터 페이징 시작
		if(sc.getSearchType() == null || sc.getSearchWord() == null || 
				sc.getSearchType() == "" || sc.getSearchWord() == "") {
			// 검색어가 있을 때는 검색한 글의 데이터 수를 얻어오는 것부터 페이징 시작
			pi.setTotalPostCnt(pDao.getTotalPostCnt());		// 전체 데이터 수 세팅
		} else { 
			pi.setTotalPostCnt(pDao.getTotalPostCnt(sc)); 	
		}
			
		pi.setTotalPageCnt();								// 전체 페이지 수 세팅
		pi.setStartRowIndex();							// 현재 페이지에서 보여주기 시작할 rowIndex세팅
		
		//페이징 블럭 만들기
		pi.setPageBlockNoCurPage();
		pi.setStartPageNoCurBlock();
		pi.setEndPageNoCurBlock();
		
		System.out.println(pi.toString());
		
		return pi;
	}
	
	

	
	
}
