package net.fullstack7.utils;

import java.util.Map;

public class CommonBbsUtils {
	public CommonBbsUtils() {
	}

	public CommonBbsUtils(int total_count, int page_no, int page_size, int page_block_size) {
		this.total_count = total_count;
		this.page_no = page_no;
		this.page_size = page_size;
		this.page_block_size = page_block_size;
		
		setTotal_page();	// 전체 페이지 설정
		setFirtst_page(1);			// 첫 페이지 설정
		setPage_block_start();		// 페이지 블럭 스타트 설정
		setPage_block_end();		// 페이지 블럭 종료 설정
		setPrev_page_block_flag();	// 이전 페이지 설정
		setNext_page_block_flag();	// 다음 페이지 설정
		setLast_page();				// 마지막 페이지 설정
	}

	private int total_count;
	private int page_no;
	private int page_size;
	private int total_page;
	private int page_skip_count;
	private int page_block_size;
	private int page_block_start;
	private int page_block_end;
	private boolean prev_page_block_flag;
	private boolean next_page_block_flag;
	private int firtst_page;
	private int last_page;
	
	private String page_separator;
	private String page_separator_css;
	private String current_page_css;
	private String current_page_css_on;
	private String current_page_css_off;
	private String firtst_page_css;
	private String firtst_page_css_on;
	private String firtst_page_css_off;
	private String prev_page_css;
	private String prev_page_css_on;
	private String prev_page_css_off;
	private String page_block_css;
	private String page_block_css_on;
	private String page_block_css_off;
	private String next_page_css;
	private String next_page_css_on;
	private String next_page_css_off;
	private String last_page_css;
	private String last_page_css_on;
	private String last_page_css_off;

	public int getTotal_count() {
		return total_count;
	}

	public void setTotal_count(int total_count) {
		this.total_count = total_count;
	}

	public int getPage_no() {
		return page_no;
	}

	public void setPage_no(int page_no) {
		this.page_no = page_no;
	}

	public int getPage_size() {
		return page_size;
	}

	public void setPage_size(int page_size) {
		this.page_size = page_size;
	}

	public int getTotal_page() {
		return total_page;
	}

	public void setTotal_page() {
		System.out.println("===================================");
		System.out.println("setTotal_page()");
		try {
			this.total_page = (int)Math.ceil(this.total_count/(double)this.page_size);
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}

		System.out.println("this.total_page : "+ this.total_page +"");
		System.out.println("===================================");
	}
	public void setTotal_page(int total_count, int page_size) {
		System.out.println("===================================");
		System.out.println("setTotal_page("+ total_count +", "+ page_size +")");
		try {
			this.total_page = (int)Math.ceil(total_count/(double)page_size);
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}

		System.out.println("this.total_page : "+ this.total_page +"");
		System.out.println("===================================");
	}

	public int getPage_skip_count() {
		return (this.page_no-1)*this.page_size;
	}

	public void setPage_skip_count(int page_skip_count) {
		this.page_skip_count = page_skip_count;
	}
	
	public int getPage_block_size() {
		return page_block_size;
	}

	public void setPage_block_size(int page_block_size) {
		this.page_block_size = page_block_size;
	}

	public int getPage_block_start() {
		return page_block_start;
	}

	public void setPage_block_start() {
		this.page_block_start = (int)(Math.floor(this.page_no/(double)this.page_block_size)*this.page_block_size)+1;
	}
	public void setPage_block_start(int page_no, int page_block_size) {
		this.page_block_start = (int)(Math.floor(page_no/(double)page_block_size)*page_block_size)+1;
	}

	public int getPage_block_end() {
		return page_block_end;
	}

	public void setPage_block_end() {
		this.page_block_end = (int)(Math.floor(this.page_no/(double)this.page_block_size)*this.page_block_size)+this.page_block_size;
		this.page_block_end = (this.page_block_end > this.total_page) ? this.total_page : this.page_block_end;
	}
	public void setPage_block_end(int total_page, int page_no, int page_block_size) {
		int block_end = (int)(Math.floor(page_no/(double)page_block_size)*page_block_size)+page_block_size;
		this.page_block_end = (block_end > total_page) ? total_page : block_end;
	}

	public boolean getPrev_page_block_flag() {
		return prev_page_block_flag;
	}

	public void setPrev_page_block_flag() {
		this.prev_page_block_flag = (this.page_block_start>1);
	}
	public void setPrev_page_block_flag(int page_block_start) {
		this.prev_page_block_flag = (page_block_start>1);
	}

	public boolean getNext_page_block_flag() {
		return next_page_block_flag;
	}

	public void setNext_page_block_flag() {
		this.next_page_block_flag = (this.total_page > this.page_block_end);
	}
	public void setNext_page_block_flag(int total_page, int page_block_end) {
		this.next_page_block_flag = (total_page > page_block_end);
	}

	public int getFirtst_page() {
		return firtst_page;
	}

	public void setFirtst_page(int firtst_page) {
		this.firtst_page = firtst_page;
	}

	public int getLast_page() {
		return last_page;
	}

	public void setLast_page() {
		this.last_page = this.getTotal_page();
	}
	public void setLast_page(int total_count, int page_size) {
		this.setTotal_page(total_count, page_size);
		this.last_page = getTotal_page();
	}

	public String getPage_separator() {
		return this.page_separator;
	}

	public void setPage_separator(String separator) {
		this.page_separator = separator;
	}

	public String getPage_separator_css() {
		return this.page_separator_css;
	}

	public void setPage_separator_css(String separator_css) {
		this.page_separator_css = separator_css;
	}

	public String getCurrent_page_css() {
		return current_page_css;
	}

	public void setCurrent_page_css(String current_page_css) {
		this.current_page_css = current_page_css;
	}

	public String getCurrent_page_css_on() {
		return current_page_css_on;
	}

	public void setCurrent_page_css_on(String current_page_css_on) {
		this.current_page_css_on = current_page_css_on;
	}

	public String getCurrent_page_css_off() {
		return current_page_css_off;
	}

	public void setCurrent_page_css_off(String current_page_css_off) {
		this.current_page_css_off = current_page_css_off;
	}

	public String getFirtst_page_css() {
		return firtst_page_css;
	}

	public void setFirtst_page_css(String firtst_page_css) {
		this.firtst_page_css = firtst_page_css;
	}

	public String getFirtst_page_css_on() {
		return firtst_page_css_on;
	}

	public void setFirtst_page_css_on(String firtst_page_css_on) {
		this.firtst_page_css_on = firtst_page_css_on;
	}

	public String getFirtst_page_css_off() {
		return firtst_page_css_off;
	}

	public void setFirtst_page_css_off(String firtst_page_css_off) {
		this.firtst_page_css_off = firtst_page_css_off;
	}

	public String getPrev_page_css() {
		return prev_page_css;
	}

	public void setPrev_page_css(String prev_page_css) {
		this.prev_page_css = prev_page_css;
	}

	public String getPrev_page_css_on() {
		return prev_page_css_on;
	}

	public void setPrev_page_css_on(String prev_page_css_on) {
		this.prev_page_css_on = prev_page_css_on;
	}

	public String getPrev_page_css_off() {
		return prev_page_css_off;
	}

	public void setPrev_page_css_off(String prev_page_css_off) {
		this.prev_page_css_off = prev_page_css_off;
	}

	public String getPage_block_css() {
		return page_block_css;
	}

	public void setPage_block_css(String page_block_css) {
		this.page_block_css = page_block_css;
	}

	public String getPage_block_css_on() {
		return page_block_css_on;
	}

	public void setPage_block_css_on(String page_block_css_on) {
		this.page_block_css_on = page_block_css_on;
	}

	public String getPage_block_css_off() {
		return page_block_css_off;
	}

	public void setPage_block_css_off(String page_block_css_off) {
		this.page_block_css_off = page_block_css_off;
	}

	public String getNext_page_css() {
		return next_page_css;
	}

	public void setNext_page_css(String next_page_css) {
		this.next_page_css = next_page_css;
	}

	public String getNext_page_css_on() {
		return next_page_css_on;
	}

	public void setNext_page_css_on(String next_page_css_on) {
		this.next_page_css_on = next_page_css_on;
	}

	public String getNext_page_css_off() {
		return next_page_css_off;
	}

	public void setNext_page_css_off(String next_page_css_off) {
		this.next_page_css_off = next_page_css_off;
	}

	public String getLast_page_css() {
		return last_page_css;
	}

	public void setLast_page_css(String last_page_css) {
		this.last_page_css = last_page_css;
	}

	public String getLast_page_css_on() {
		return last_page_css_on;
	}

	public void setLast_page_css_on(String last_page_css_on) {
		this.last_page_css_on = last_page_css_on;
	}

	public String getLast_page_css_off() {
		return last_page_css_off;
	}

	public void setLast_page_css_off(String last_page_css_off) {
		this.last_page_css_off = last_page_css_off;
	}

	public String getDisplayPagingArea(Map pMap) {
		pMap.get("page_no");
		return "";
	}
	public String getDisplayPagingArea(int total_page, int page_no, int page_size, int page_block_size, int page_block_start, int page_block_end, boolean prev_flag, boolean next_flag, String queryString) {
		//StringBuilder queryString = new StringBuilder(); 
		//queryString.append("page_size="+page_size+"&page_block_size="+ page_block_size);
		
		StringBuilder sb = new StringBuilder();

		if ( this.getPage_no() > 1 ) {
			sb.append("<a class='"+ this.firtst_page_css_on +"' href='?page_no=1"+ queryString +"'><<</a>");
		} else {
			sb.append("<a class='"+ this.firtst_page_css_off +"' href='#'><<</a>");
		}

		if ( prev_flag ) {
			sb.append("<a class='"+ this.prev_page_css_on +"' href='?page_no="+ (page_block_start - page_block_size) + queryString +"'> <</a>");
		} else {
			sb.append("<a class='"+ this.prev_page_css_off +"' href='#'> <</a>");
		}
		
		System.out.println("page_block_start : "+ page_block_start);
		//<< 1 | 2 | 3 >>
		for(int i=page_block_start; i<=page_block_end; i++) {
			if ( this.getPage_no() == i ) {
				sb.append("<a class='"+ this.page_block_css_off +"' href='#'> "+ (i<page_block_end ? i + " |" : i ) +"</a>");
			} else {
				sb.append("<a class='"+ this.page_block_css_on +"' href='?page_no="+ i + queryString +"'> "+ (i<page_block_end ? i + " |" : i ) +"</a>");
			}
		}

		if ( next_flag ) {
			sb.append("<a class='"+ this.next_page_css_on +"' href='?page_no="+ (page_block_end + 1) + queryString +"'> ></a>");
		} else {
			sb.append("<a class='"+ this.next_page_css_off +"' href='#'> ></a>");
		}

		if ( page_no < total_page ) {
			sb.append("<a class='"+ this.last_page_css_on +"' href='?page_no="+ total_page + queryString +"'> >></a>");
		} else {
			sb.append("<a class='"+ this.last_page_css_off +"' href='#'> >></a>");
		}

		return sb.toString();
	}

}
