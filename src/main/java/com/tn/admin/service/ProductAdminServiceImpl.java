package com.tn.admin.service;

import java.io.InputStream;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.mariadb.jdbc.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.tn.admin.model.vo.*;
import com.tn.admin.dao.ProductAdminDAO;

@Service
public class ProductAdminServiceImpl implements ProductAdminService {

	@Autowired
	private ProductAdminDAO pDao;
	
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
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
			
			// 최초검색이기 때문에 여기에만 searchCount+1 해주는 메서드를 만들었습니다.
			if(sortBy.equals("default")) {
				// 1) 리스트를 불러옵니다
				list = pDao.selectAllBoard(pi, searchCriteria);
				
				// 2) 해당 검색어가 searchWord에 존재하는지 확인 후 존재하면 +1, 없으면 insert
				pDao.insertOrUpdateSearchKeyword(searchCriteria.getSearchWord());
				
				
				System.out.println("sortby default 일때");
			} else {
				list = pDao.selectAllBoard(pi, searchCriteria, sortBy);
				System.out.println("sortby 가 있을때");
			}
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
			System.out.println(pDao.getTotalPostCnt(sc));
		}
			
		pi.setTotalPageCnt();								// 전체 페이지 수 세팅
		pi.setStartRowIndex();							// 현재 페이지에서 보여주기 시작할 rowIndex세팅
		
		//페이징 블럭 만들기
		pi.setPageBlockNoCurPage();
		pi.setStartPageNoCurBlock();
		pi.setEndPageNoCurBlock();
		
		
		return pi;
	}


	@Override
	public int deleteProduct(int[] arr) throws Exception {
				
		int delCount = 0;
		for(int delNo : arr) {
			delCount += pDao.deleteProduct(delNo);
		}
		return delCount;
		
	}


	@Override
	public int soldOutProduct(int[] arr) throws Exception {
		
		int sdCount = 0;
		for(int sdNo : arr) {
			sdCount += pDao.soldOutProduct(sdNo);
		}
		
		System.out.println(sdCount);
		return sdCount;
		
	}


	@Override
	public ProductVO read(int bookNo) throws Exception {
		
		return pDao.readBookInfo(bookNo);
	}


	@Override
	public int saveImgInfo(BoardUpFileVODTO fileInfo, int bookNo) throws Exception {
		
		return pDao.saveImgInfo(fileInfo, bookNo);
	}


	@Override
	public int modifyProduct(ProductVO product) throws Exception {
		
		return pDao.updateProduct(product);
	}


	@Override
	public int registSave(ProductVO product,BoardUpFileVODTO fileInfo) throws Exception {
		
		return pDao.registSave(product, fileInfo);
	}


	@Override
	public List<String> getPopularKeywords(int limit) throws Exception {
		
		return pDao.getPopularKeywords(limit);
	}


	@Override
	public List<String> searchRecommend(String searchWord) throws Exception {
		
		return pDao.searchRecommend(searchWord);
	}


	@Override
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
	public boolean addZzim(String userId, int bookNo) throws Exception {
		boolean result = false;
		// 찜 테이블에 insert
		if(pDao.addZzim(userId, bookNo) > 0) {
			// bookList의 찜 +1
			if(pDao.incrementZzimCount(bookNo) > 0) {
				result = true;
			}
		}
		
		return result;
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
	public boolean removeZzim(String userId, int bookNo) throws Exception {
		boolean result = false;
		// 찜 테이블에 delete
		if(pDao.removeZzim(userId, bookNo) > 0) {
			// bookList의 찜 -1
			if(pDao.decrementZzimCount(bookNo) > 0) {
				result = true;
			}
		}
		
		return result;
	}


	@Override
	public boolean checkZzim(String userId, Long bookNo) throws Exception {
		
		// userId가 bookNo 좋아요를 이미 눌렀다면 true 반환
		boolean result = false;
		System.out.println(pDao.checkZzim(userId, bookNo));
		if( pDao.checkZzim(userId, bookNo) > 0) {
			result = true;
		}
		
		System.out.println(userId + "가"  + bookNo +"번글을 좋아요했는가? " + result );
		return result;
	}


	@Override
	public String getZzimCount(String userId) throws Exception {
		
		return pDao.getZzimCount(userId);
	}


	@Override
	public int insertRestockBook(RestockVO restockBook) throws Exception{
		
		return pDao.insertRestockBook(restockBook);
	}


	@Override
	public Map<String, Object> restockList(PagingInfoDTO dto, SearchCriteriaDTO searchCriteria) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<RestockVO> list = null;
		PagingInfo pi = makeRestockPagingInfo(dto,searchCriteria);
		
		list = pDao.restockList(pi);
		
		resultMap.put("pagingInfo", pi);
		resultMap.put("restockList", list);
		
		return resultMap;
	}
	
	//입고요청페이지 페이징을위해 메서드를 새로 만듦
	private PagingInfo makeRestockPagingInfo(PagingInfoDTO dto, SearchCriteriaDTO sc) throws Exception {
		PagingInfo pi = new PagingInfo(dto);
		
		
		pi.setTotalPostCnt(pDao.getTotalRestockCnt());		// 전체 데이터 수 세팅
		
			
		pi.setTotalPageCnt();								// 전체 페이지 수 세팅
		pi.setStartRowIndex();							// 현재 페이지에서 보여주기 시작할 rowIndex세팅
		
		//페이징 블럭 만들기
		pi.setPageBlockNoCurPage();
		pi.setStartPageNoCurBlock();
		pi.setEndPageNoCurBlock();
		
		
		return pi;
	}

	// 차트 찜기준 탑 5
	@Override
	public List<ProductVO> getTopBooks() throws Exception {
		
		return pDao.getTopBooks();
	}


	@Override
	public List<TopPublisherVO> getTopPublisher() throws Exception {
		
		return pDao.getTopPublisher();
	}


	@Override
	public List<SalesVO> getSales() throws Exception {
		// TODO Auto-generated method stub
		return pDao.getSales();
	}


	@Override
	public void saveExcelData(MultipartFile excelFile) throws Exception {
		 // 엑셀 파일을 읽기 위한 InputStream 생성
        InputStream inputStream = excelFile.getInputStream();
        Workbook workbook = WorkbookFactory.create(inputStream);
        Sheet sheet = workbook.getSheetAt(0); // 첫 번째 시트 사용

        // 시트의 각 행을 반복
        for (Row row : sheet) {
//			  현재의 경우에는 헤더가 없음을 가정하기 때문에 일단 주석
//            if (row.getRowNum() == 0) { 
//                // 첫 번째 행은 보통 헤더이므로 건너뜀
//                continue;
//            }
            
            // 셀 데이터 읽기
        	int bookNo = (int) row.getCell(0).getNumericCellValue();
        	String title = row.getCell(1).getStringCellValue();
            String author = row.getCell(2).getStringCellValue();
            String publisher = row.getCell(3).getStringCellValue();
            
            // Date String으로 변환
            java.util.Date date =  row.getCell(4).getDateCellValue();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  // 원하는 포맷으로 변환
            String pubDate = dateFormat.format(date);  // String으로 변환
            
            int genre = (int)row.getCell(5).getNumericCellValue();
            int price = (int) row.getCell(6).getNumericCellValue();
            int salePrice = (int) row.getCell(7).getNumericCellValue();
            int inven = (int) row.getCell(8).getNumericCellValue(); 
            String thumbNail = row.getCell(9).getStringCellValue(); 
            String introduction = row.getCell(10).getStringCellValue();
            int zzim = (int)row.getCell(11).getNumericCellValue();
            int reviewCnt = (int) row.getCell(12).getNumericCellValue();
            String base64ProfileImg = row.getCell(13).getStringCellValue();
            // 읽은 데이터를 DB에 삽입
            
            //ProductVO excel = new ProductVO(bookNo, title, author, publisher, date, price, salePrice, inven, thumbNail, introduction, zzim, reviewCnt, base64ProfileImg);
            pDao.insertExcelFile(bookNo, title, author, publisher, pubDate, genre, price, salePrice, inven, thumbNail, introduction, zzim, reviewCnt, base64ProfileImg);
        }

        workbook.close();
		
	}


	


	
	

	
	
}
