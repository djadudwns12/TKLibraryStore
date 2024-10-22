package com.tn.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tn.admin.model.vo.BoardUpFileVODTO;
import com.tn.admin.model.vo.PagingInfoDTO;
import com.tn.admin.model.vo.ProductVO;
import com.tn.admin.model.vo.RestockVO;
import com.tn.admin.model.vo.SalesVO;
import com.tn.admin.model.vo.SearchCriteriaDTO;
import com.tn.admin.model.vo.TopPublisherVO;
import com.tn.booklist.model.vo.BooklistVO;
import com.tn.member.model.dto.MemberDTO;

@Service
public interface ProductAdminService {

	Map<String, Object> listAll(PagingInfoDTO dto, SearchCriteriaDTO searchCriteria, String sortBy) throws Exception;

	int deleteProduct(int[] arr) throws Exception;

	int soldOutProduct(int[] arr) throws Exception;

	ProductVO read(int bookNo) throws Exception;

	int saveImgInfo(BoardUpFileVODTO fileInfo, int bookNo) throws Exception;

	int modifyProduct(ProductVO product) throws Exception;

	int registSave(ProductVO product, BoardUpFileVODTO fileInfo) throws Exception;

	List<String> getPopularKeywords(int limit) throws Exception;

	List<String> searchRecommend(String searchWord) throws Exception;

	boolean addZzim(String userId, int bookNo) throws Exception;

	boolean checkZzim(String userId, Long bookNo)throws Exception;

	boolean removeZzim(String userId, int bookNo) throws Exception;

	String getZzimCount(String userId) throws Exception;

	int insertRestockBook(RestockVO restockBook)throws Exception;

	Map<String, Object> restockList(PagingInfoDTO dto, SearchCriteriaDTO searchCriteria) throws Exception;

	List<ProductVO> getTopBooks() throws Exception;

	List<TopPublisherVO> getTopPublisher() throws Exception;

	List<SalesVO> getSales() throws Exception;

	void saveExcelData(MultipartFile excelFile) throws Exception;
	List<BooklistVO> getZzimList(MemberDTO loginMember) throws Exception;




}
