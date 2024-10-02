package com.tn.admin.model.vo;

import lombok.Getter;
import lombok.ToString;

// 페이징 처리를 하기위한 모든 정보를 담고 있는 객체
@ToString
@Getter
public class PagingInfo {
	
	//------------------기본 페이징 출력 필요한 변수들 --------------------------------------------------
	private int pageNo;					// 현재 페이지 번호
	private int viewPostCntPerPage;		// 1페이지당 보여줄 글의 갯수
	private int totalPostCnt;			// 전체 글(데이터)의 갯수
	private int totalPageCnt;			// 전체 페이지 수
	private int startRowIndex; 			// 현재 페이지에서 보여주기 시작할 글의 index번호
	
	//-----------------------------------------------------------------------------------------------------
	
	//---------------------페이징 블럭을 만들 때 필요한 변수들 -----------------------------------
	private int pageCntPerBlock = 10;		// 1개의 페이징 블럭에 몇 페이지를 보여줄 것인가.
	private int pageBlockNoCurPage;			// 현재 페이지가 속한 페이징 블럭 번호
	private int startPageNoCurBlock;		// 현재 페이징 블럭에서 출력 시작할 페이지 번호
	private int endPageNoCurBlock;			// 현재 페이징 블럭에서 출력 끝 페이지 번호
	
	
	public PagingInfo(PagingInfoDTO dto) {
		this.pageNo=dto.getPageNo();
		this.viewPostCntPerPage = dto.getPagingSize();
	}
	
	public void setTotalPostCnt(int totalPostCnt) {
		this.totalPostCnt = totalPostCnt;
	}
	
	//전체 페이지 수 : 전체 데이터 수 / 1페이지당 보여줄 글의 갯수 => 나누어 떨어진다면 몫, 나머지가 있다면 +1
	public void setTotalPageCnt() {
		if(this.totalPostCnt % this.viewPostCntPerPage == 0) {
			this.totalPageCnt = this.totalPostCnt / this.viewPostCntPerPage;
		}else {
			this.totalPageCnt = (this.totalPostCnt / this.viewPostCntPerPage) +1;
		}
	}
	
	//(현재페이지 번호 -1) * 1페이지당 보여줄 글의 갯수 => ?번페이지에서 보여주기 시작할 글의 index번호
	public void setStartRowIndex() {
		this.startRowIndex = (this.pageNo -1) * this.viewPostCntPerPage;
	}
	
	public void setPageBlockNoCurPage() {
//		--      현재 페이지번호 / 1개 페이징블럭에서 보여줄 페이지 수
//		--      나누어 떨어지지 않으면 올림
//		-- 		나누어 떨어지면 그 값
		if(this.pageNo % this.pageCntPerBlock == 0) {
			this.pageBlockNoCurPage = this.pageNo / this.pageCntPerBlock;
		} else {
			this.pageBlockNoCurPage = (this.pageNo / this.pageCntPerBlock) +1;
		}
	}
	
	public void setStartPageNoCurBlock() {
		// 1) (페이지번호 / 1개 페이징 블럭에서 보여줄 페이지수 + 1)
		
		this.startPageNoCurBlock = (this.pageBlockNoCurPage -1) * this.pageCntPerBlock +1;
		
	}
	
	public void setEndPageNoCurBlock() {
		//startPageNoCurBlock + (1페이지 블럭에서 보여줄 페이지 수 -1)
		this.endPageNoCurBlock = this.startPageNoCurBlock + (this.pageCntPerBlock -1);
		if(this.totalPageCnt < this.endPageNoCurBlock) {
			this.endPageNoCurBlock = this.totalPageCnt;
		}
	}
}
