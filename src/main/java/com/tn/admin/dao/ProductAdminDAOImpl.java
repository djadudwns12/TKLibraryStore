package com.tn.admin.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tn.admin.model.vo.BoardUpFileVODTO;
import com.tn.admin.model.vo.PagingInfo;
import com.tn.admin.model.vo.ProductVO;
import com.tn.admin.model.vo.RestockVO;
import com.tn.admin.model.vo.SalesVO;
import com.tn.admin.model.vo.SearchCriteriaDTO;
import com.tn.admin.model.vo.TopPublisherVO;
import com.tn.booklist.model.vo.BooklistVO;
import com.tn.member.model.dto.MemberDTO;

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
	public List<ProductVO> getList(PagingInfo pi, String sortBy) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("sortBy", sortBy);
		params.put("startRowIndex",pi.getStartRowIndex());
		params.put("viewPostCntPerPage", pi.getViewPostCntPerPage());
		
		return ses.selectList(NS + ".getProductBySortby",params);
	}
	
	@Override
	public List<ProductVO> selectAllBoard(PagingInfo pi, SearchCriteriaDTO searchCriteria) throws Exception{
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("searchType", searchCriteria.getSearchType());
		params.put("searchWord", "%" +searchCriteria.getSearchWord()+ "%");
		params.put("startRowIndex",pi.getStartRowIndex());
		params.put("viewPostCntPerPage", pi.getViewPostCntPerPage());
		
		return ses.selectList(NS + ".getSearchProductWithPaging", params);
	}
	@Override
	public List<ProductVO> selectAllBoard(PagingInfo pi, SearchCriteriaDTO searchCriteria, String sortBy) throws Exception {
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
	@Override
	public void insertOrUpdateSearchKeyword(String searchWord) throws Exception {
		ses.insert(NS + ".insertOrUpdateSearchKeyword",searchWord);
		
	}
	@Override
	public List<String> getPopularKeywords(int limit) throws Exception {
		
		return ses.selectList(NS + ".getPopularKeywords", limit);
	}
	@Override
	public List<String> searchRecommend(String searchWord) throws Exception {
		
		String searchKeyword = "%"+searchWord+"%";
		return ses.selectList(NS + ".searchRecommend", searchKeyword);
	}
	@Override
	public int addZzim(String userId, int bookNo) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("userId", userId);
		params.put("bookNo", bookNo);
		
		return ses.insert(NS + ".insertZzim" , params);
	}
	@Override
	public int incrementZzimCount(int bookNo) throws Exception {
		
		
		return ses.update(NS + ".incrementZzimCount" , bookNo);
	}
	
	@Override
	public int removeZzim(String userId, int bookNo) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("userId", userId);
		params.put("bookNo", bookNo);
		
		return ses.delete(NS + ".deleteZzim" , params);
	}
	
	@Override
	public int decrementZzimCount(int bookNo) throws Exception {
		
		return ses.update(NS + ".decrementZzimCount" , bookNo);
	}
	
	@Override
	public int checkZzim(String userId, Long bookNo) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("userId", userId);
		params.put("bookNo", bookNo);
		
		return ses.selectOne(NS + ".checkZzim" , params);
	}
	@Override
	public String getZzimCount(String userId) throws Exception {
		
		return ses.selectOne(NS + ".getZzimCount",userId);
	}
	@Override
	public int insertRestockBook(RestockVO restockBook) throws Exception {
		
		return ses.insert(NS + ".insertRestockBook" , restockBook);
	}
	@Override
	public List<RestockVO> restockList(PagingInfo pi) throws Exception {
		
		return ses.selectList(NS + ".restockList",pi);
	}
	@Override
	public int getTotalRestockCnt() throws Exception {
		
		return ses.selectOne(NS + ".selectTotalRestockCount");
	}
	@Override
	public List<ProductVO> getTopBooks() throws Exception {
		
		return ses.selectList(NS + ".getTopBooks");
	}
	@Override
	public List<TopPublisherVO> getTopPublisher() throws Exception {
		
		return ses.selectList(NS + ".getTopPublisher");
	}
	@Override
	public List<SalesVO> getSales() throws Exception {
		
		return ses.selectList(NS + ".getSales" );
	}
	@Override
	public void insertExcelFile(int bookNo, String title, String author, String publisher, String pubDate, int genre,
			int price, int salePrice, int inven, String thumbNail, String introduction, int zzim, int reviewCnt,
			String base64ProfileImg) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("bookNo", bookNo);
		params.put("title", title);
		params.put("author", author);
		params.put("publisher", publisher);
		params.put("pubDate", pubDate);
		params.put("genre", genre);
		params.put("price", price);
		params.put("salePrice", salePrice);
		params.put("inven", inven);
		params.put("thumbNail", thumbNail);
		params.put("introduction", introduction);
		params.put("zzim", zzim);
		params.put("reviewCnt", reviewCnt);
		params.put("base64ProfileImg", base64ProfileImg);
		
		
		ses.insert(NS + ".insertExcelFile", params);
	}
	
	
	@Override
	public List<BooklistVO> selectZzimList(MemberDTO loginMember) throws Exception {
		// TODO Auto-generated method stub
		return ses.selectList(NS + ".selectZzimList",loginMember);
	}
	
	
	
	
	
	
	

}
