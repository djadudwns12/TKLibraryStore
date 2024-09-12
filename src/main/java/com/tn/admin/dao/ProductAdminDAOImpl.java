package com.tn.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tn.admin.model.vo.PagingInfo;
import com.tn.admin.model.vo.ProductVO;
import com.tn.admin.model.vo.SearchCriteriaDTO;

@Repository
public class ProductAdminDAOImpl implements ProductAdminDAO {

	@Autowired
	private SqlSession ses;
	private static String NS = "com.tn.mapper.ProductAdminMapper";
	@Override
	public List<ProductVO> getList(PagingInfo pi) throws Exception{
		
		return ses.selectList(NS + ".getProduct",pi);
	}
	@Override
	public int getTotalPostCnt() throws Exception{
		
		return ses.selectOne(NS + ".selectTotalCount");
	}
	@Override
	public int getTotalPostCnt(SearchCriteriaDTO sc) throws Exception{
		sc.setSearchWord("%"+sc.getSearchWord()+"%");
		return ses.selectOne(NS + ".selectTotalCountWithSearchCriteria", sc);
	}
	@Override
	public List<ProductVO> getList(PagingInfo pi, String sortBy) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("sortBy", sortBy);
		params.put("startRowIndex",pi.getStartRowIndex());
		params.put("viewPostCntPerPage", pi.getViewPostCntPerPage());
		
		return ses.selectList(NS + ".getProductBySortby",params);
	}
	@Override
	public List<ProductVO> selectAllBoard(PagingInfo pi, SearchCriteriaDTO searchCriteria) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("searchType", searchCriteria.getSearchType());
		params.put("searchWord", "%" +searchCriteria.getSearchWord()+ "%");
		params.put("startRowIndex",pi.getStartRowIndex());
		params.put("viewPostCntPerPage", pi.getViewPostCntPerPage());
		
		return ses.selectList(NS + ".getSearchProductWithPaging", params);
	}
	

}
