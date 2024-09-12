package com.tn.admin.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tn.admin.model.vo.PagingInfo;
import com.tn.admin.model.vo.ProductVO;
import com.tn.admin.model.vo.SearchCriteriaDTO;

@Repository
public interface ProductAdminDAO {

	List<ProductVO> getList(PagingInfo pi) throws Exception;

	int getTotalPostCnt() throws Exception;

	int getTotalPostCnt(SearchCriteriaDTO sc) throws Exception;

	List<ProductVO> getList(PagingInfo pi, String sortBy) throws Exception;


}
