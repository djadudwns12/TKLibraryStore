package com.tn.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.tn.admin.model.vo.BoardUpFileVODTO;
import com.tn.admin.model.vo.PagingInfoDTO;
import com.tn.admin.model.vo.ProductVO;
import com.tn.admin.model.vo.SearchCriteriaDTO;

@Service
public interface ProductAdminService {

	Map<String, Object> listAll(PagingInfoDTO dto, SearchCriteriaDTO searchCriteria, String sortBy) throws Exception;

	int deleteProduct(int[] arr) throws Exception;

	int soldOutProduct(int[] arr) throws Exception;

	ProductVO read(int bookNo) throws Exception;

	int saveImgInfo(BoardUpFileVODTO fileInfo, int bookNo) throws Exception;

	int modifyProduct(ProductVO product) throws Exception;

	int registSave(ProductVO product, BoardUpFileVODTO fileInfo) throws Exception;




}
