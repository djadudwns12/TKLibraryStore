package com.tn.admin.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tn.admin.model.vo.PagingInfo;
import com.tn.admin.model.vo.ProductVO;
import com.tn.admin.model.vo.SearchCriteriaDTO;

@Repository
public interface ProductAdminDAO {

	// 기본 목록 호출
	List<ProductVO> getList(PagingInfo pi) throws Exception;

	int getTotalPostCnt() throws Exception;

	int getTotalPostCnt(SearchCriteriaDTO sc) throws Exception;
	
	// 기본 정렬기준에 따른 목록
	List<ProductVO> getList(PagingInfo pi, String sortBy) throws Exception;

	//검색어만 있을 때 목록 
	List<ProductVO> selectAllBoard(PagingInfo pi, SearchCriteriaDTO searchCriteria);
	// 검색했을 때 정렬기준 설정
	List<ProductVO> selectAllBoard(PagingInfo pi, SearchCriteriaDTO searchCriteria, String sortBy);

	int deleteProduct(int delNo) throws Exception;

	int soldOutProduct(int sdNo) throws Exception;

	ProductVO readBookInfo(int bookNo) throws Exception;


}
