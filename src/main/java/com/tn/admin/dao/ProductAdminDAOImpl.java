package com.tn.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tn.admin.model.vo.BoardUpFileVODTO;
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
	public int deleteProduct(int delNo) throws Exception {
		
		return  ses.delete(NS + ".deleteProduct", delNo);
	}
	@Override
	public int soldOutProduct(int sdNo) throws Exception {
		
		return ses.update(NS + ".soldOutProduct",sdNo);
	}
	@Override
	public ProductVO readBookInfo(int bookNo) throws Exception {
		
		return ses.selectOne(NS +".readBookInfo",bookNo);
	}
	@Override
	public int saveImgInfo(BoardUpFileVODTO fileInfo,int bookNo) {
		
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("fileName", "/resources/bookImgs/" + fileInfo.getFileName());
		params.put("base64Img", fileInfo.getBase64Img());
		params.put("bookNo", bookNo);
		
		return ses.update(NS + ".saveImgInfo",params);
	}
	@Override
	public int updateProduct(ProductVO product) throws Exception {
		
		return ses.update(NS + ".updateProduct", product);
	}
	@Override
	public int registSave(ProductVO product, BoardUpFileVODTO fileInfo) throws Exception {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("fileName", "/resources/bookImgs/" + fileInfo.getFileName());
		params.put("base64ProfileImg", fileInfo.getBase64Img());
		params.put("title", product.getTitle());
		params.put("author", product.getAuthor());
		params.put("publisher", product.getPublisher());
		params.put("pubDate", product.getPubDate());
		params.put("genre", product.getGenre());
		params.put("price", product.getPrice());
		params.put("salePrice", product.getSalePrice());
		params.put("inven", product.getInven());
		params.put("introduction", product.getIntroduction());
		
		return ses.insert(NS + ".registSave", params);
	}
	

}
