package com.roomio.carret.bean;

public class PageBean {

	//최소 페이지
	private int min;
	//최대 페이지
	private int max;
	//이전 페이지
	private int prevPage;
	//다음 페이지
	private int nextPage;
	//전체 페이지 갯수
	private int pageCnt;
	//현제페이지
	private int page;
	
	//page : 현재페이지 ,goodsCnt : 전체글 갯수, listcnt : 페이지 글 갯수, paginationCnt : 페이지 번호 갯수 
	public PageBean(int page,int goodsCnt,int listCnt,int paginationCnt) {
		this.page = page;
		pageCnt = goodsCnt / listCnt;
		if(goodsCnt % listCnt > 0) {
			pageCnt++;
		}
		
		min = ((page - 1) / paginationCnt) * paginationCnt + 1;
		max = min + paginationCnt - 1;
		if(max > pageCnt) {
			max = pageCnt;
		}
		
		prevPage = min - 1;
		nextPage = max + 1;
		if(nextPage > pageCnt) {
			nextPage = pageCnt;
		}
		
	}

	public int getMin() {
		return min;
	}

	public int getMax() {
		return max;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public int getPage() {
		return page;
	}
	
}
