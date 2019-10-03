package com.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class PageBar {
	Logger logger = LoggerFactory.getLogger(PageBar.class);
	//전체레코드 갯수
	private int totalRecord;
	//페이지당 레코드 수
	private int numPerPage;
	//블럭당 디폴트 페이지 수 - 여기서는 일단 2개로 정함.
	private int pagePerBlock=10;
	//총페이지 수
	private int totalPage;
	//총블럭 수
	private int totalBlock;
	//현재 내가 바라보는 페이지 수
	private int nowPage;
	//현재 내가 바라보는 블럭 수
	private int nowBlock;
	//적용할 페이지 이름
	private String pagePath;
	
	private String pagination;
	//페이지 네비게이션 초기화
	/*
	 * 화면에서 받아와야 하는 정보에는 어떤 것들이 있을까?
	 * 페이지에 뿌려질 로우의 수 numPerPage
	 * 전체 레코드 수 totalRecord
	 * 현재 내가 바라보는 페이지 번호 nowPage
	 * 내가 처리해야할 페이지 이름 pagePath
	 * 
	 * 공식을 세우는데 필요한 인자는 누구?
	 * 
	 * 세워진 공식들은 어디에서 적용하면 되는 거지?
	 * 
	 * 화면에 내보내 져야 하는 언어는 html 아님 자바 중에서 ?????
	 * html
	 * 내보내지는 정보는 어디에 담으면 될까?
	 * 
	 */
	public PageBar(int numPerPage, int totalRecord, int nowPage, String pagePath) {
		this.numPerPage = numPerPage;
		this.totalRecord = totalRecord;
		this.nowPage = nowPage;
		this.pagePath = pagePath;
		//페이지 바에서 몇개가 나올건지
		this.totalPage = 
				(int)Math.ceil((double)this.totalRecord/this.numPerPage);
		//이전 다음 할때 몇 개가 나오는 건지
		this.totalBlock= 
				(int)Math.ceil((double)this.totalPage/this.pagePerBlock);
		//현재 블럭 0번부터 시작
		this.nowBlock = (int)((double)this.nowPage/this.pagePerBlock);
	}
	public void setPageBar() {
		StringBuilder pageLink = new StringBuilder();
		if(totalRecord>0) {
			logger.info("nowBlock : "+nowBlock);
			
			if(nowBlock > 0 ) {                                  
				pageLink.append("<li class=\"page-item\" style=\"width:130px; text-align: center;\"><a class=\"page-link\" style=\"color:#6C757D; border: thick;\"");
				pageLink.append("href='"+pagePath+"&nowPage="+((nowBlock-1)*pagePerBlock+(pagePerBlock-1))+"'>"+"Previous"+"</a></li>");
			//변경 소지 있음
			}
			
			for(int i=0;i<pagePerBlock;i++) {
				//현재 내가 보고 있는 페이지 블록 일때와
				if(nowBlock*pagePerBlock+i==nowPage) {
					pageLink.append("<li class=\"page-item\" style=\"width:42px; text-align: center;\"><ai class=\"page-link \" style=\"font-weight: 800; color:#6C757D; border: thick;\">"+(nowBlock*pagePerBlock+i+1)+"</ai></li>");
				}else {
					pageLink.append("<li class=\"page-item\" style=\"width:42px; text-align: center;\"><a class=\"page-link \" style=\"color:#6C757D; border: thick;\"");
					pageLink.append("href='"+pagePath+"&nowPage="+((nowBlock*pagePerBlock)+i)+"'>"+((nowBlock*pagePerBlock)+i+1)+"</a></li>");
				}
				if((nowBlock*pagePerBlock)+i+1==totalPage) {
					break;
				}
			}
			if(totalBlock > nowBlock+1) {
				pageLink.append("<li class=\"page-item\" style=\"width:120px; text-align: center;\"><a class=\"page-link \" style=\"color:#6C757D; border: thick;\"");	
				pageLink.append("href='"+pagePath+"&nowPage="+((nowBlock+1)*pagePerBlock)+"'>"+"Next"+"</a></li>");	
			}
		}
		pagination = pageLink.toString();
	}
	public String getPageBar() {
		this.setPageBar();
		return pagination;
	}
}
