package net.fullstack7.file;

public class MyFileDTO {
    private int idx; // 인덱스
	private int bbsIdx; // 참조 포스트 인덱스
    private String title;  // 제목
    private String cate;   // 카테고리
    private String ofile;  // 원본 파일명
    private String sfile;  // 저장된 파일명
    private String postdate; // 등록 날짜

    public int getIdx() { 
        return idx;
    }
    public void setIdx(int idx) { 
        this.idx = idx;
    }
    public int getBbsIdx() {
		return bbsIdx;
	}
	public void setBbsIdx(int bbsIdx) {
		this.bbsIdx = bbsIdx;
	}
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getCate() {
        return cate;
    }
    public void setCate(String cate) {
        this.cate = cate;
    }
    public String getOfile() {
        return ofile;
    }
    public void setOfile(String ofile) {
        this.ofile = ofile;
    }
    public String getSfile() {
        return sfile;
    }
    public void setSfile(String sfile) {
        this.sfile = sfile;
    }
    public String getPostdate() {
        return postdate;
    }
    public void setPostdate(String postdate) {
        this.postdate = postdate;
    }
}