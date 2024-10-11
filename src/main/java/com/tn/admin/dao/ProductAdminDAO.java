package com.tn.admin.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tn.admin.model.vo.BoardUpFileVODTO;
import com.tn.admin.model.vo.PagingInfo;
import com.tn.admin.model.vo.ProductVO;
import com.tn.admin.model.vo.RestockVO;
import com.tn.admin.model.vo.SearchCriteriaDTO;
import com.tn.booklist.model.vo.BooklistVO;
import com.tn.member.model.dto.MemberDTO;

@Repository
public interface ProductAdminDAO {

	// 기본 목록 호출
	List<ProductVO> getList(PagingInfo pi) throws Exception;

	int getTotalPostCnt() throws Exception;

	int getTotalPostCnt(SearchCriteriaDTO sc) throws Exception;
	
	// 기본 정렬기준에 따른 목록
	List<ProductVO> getList(PagingInfo pi, String sortBy) throws Exception;

	//검색어만 있을 때 목록 
	List<ProductVO> selectAllBoard(PagingInfo pi, SearchCriteriaDTO searchCriteria) throws Exception;
	// 검색했을 때 정렬기준 설정
	List<ProductVO> selectAllBoard(PagingInfo pi, SearchCriteriaDTO searchCriteria, String sortBy) throws Exception;

	int deleteProduct(int delNo) throws Exception;

	int soldOutProduct(int sdNo) throws Exception;

	ProductVO readBookInfo(int bookNo) throws Exception;

	int saveImgInfo(BoardUpFileVODTO fileInfo, int bookNo) throws Exception;

	int updateProduct(ProductVO product)throws Exception;

	int registSave(ProductVO product, BoardUpFileVODTO fileInfo) throws Exception;

	void insertOrUpdateSearchKeyword(String searchWord) throws Exception;

	List<String> getPopularKeywords(int limit)throws Exception;

	List<String> searchRecommend(String searchWord)throws Exception;

	int addZzim(String userId, int bookNo) throws Exception;

	int incrementZzimCount(int bookNo) throws Exception;

	int checkZzim(String userId, Long bookNo) throws Exception;

	int removeZzim(String userId, int bookNo) throws Exception;

	int decrementZzimCount(int bookNo) throws Exception;

	String getZzimCount(String userId) throws Exception;

	int insertRestockBook(RestockVO restockBook) throws Exception;

	List<RestockVO> restockList(PagingInfo pi) throws Exception;

	int getTotalRestockCnt() throws Exception;

	List<BooklistVO> selectZzimList(MemberDTO loginMember) throws Exception;

	


}
