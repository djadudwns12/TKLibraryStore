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
		SearchCriteriaDTO sc2 = new SearchCriteriaDTO(sc.getSearchType(),"%" + sc.getSearchWord() + "%");
		return ses.selectOne(NS + ".selectTotalCountWithSearchCriteria", sc2);
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
	@Override
	public List<ProductVO> selectAllBoard(PagingInfo pi, SearchCriteriaDTO searchCriteria, String sortBy) {
		Map<String, Object> params = new HashMap<String, Object>();
		System.out.println("다오까진 잘 옴-=============");
		params.put("sortBy", sortBy);
		params.put("startRowIndex",pi.getStartRowIndex());
		params.put("viewPostCntPerPage", pi.getViewPostCntPerPage());
		params.put("searchType", searchCriteria.getSearchType());
		params.put("searchWord", "%" + searchCriteria.getSearchWord() + "%");
		
		return ses.selectList(NS + ".getProductBySbSc",params);
		
	}
	@Override
	public int deleteProduct(int[] arr) {
		int delCount = 0;
		for(int delNo : arr) {
			delCount += ses.delete(NS + ".deleteProduct", delNo);
				
		}		
		return delCount;
	}
	@Override
	public int soldOutProduct(int[] arr) throws Exception {
		int sdCount = 0;
		for (int sdNo : arr) {
			sdCount += ses.update(NS + ".soldOutProduct",sdNo);
		}
		System.out.println(sdCount);
		return sdCount;
	}
	

}
