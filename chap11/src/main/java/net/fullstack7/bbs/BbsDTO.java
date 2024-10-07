package net.fullstack7.bbs;

import java.time.LocalDateTime;

public class BbsDTO {
	private int idx;              // 인덱스
	private int refIdx;           // 참조글인덱스
	private int levelIdx;         // 글레벨
	private int sortOrder;        // 댓글 정렬 순서
	private String memberId;      // 아이디
	private String title;         // 글제목
	private String content;       // 글내용
	private String displayDate;   // 글노출일자(YYYY-MM-DD)
	private LocalDateTime regDate;   // 등록일
	private LocalDateTime modifyDate; // 수정일
	private int readCnt;          // 조회수
	private String filePath;      // 파일저장경로
	private String fileName;      // 파일명
	private String fileExt;       // 파일확장자
	private int fileSize;         // 파일사이즈
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getRefIdx() {
		return refIdx;
	}
	public void setRefIdx(int refIdx) {
		this.refIdx = refIdx;
	}
	public int getLevelIdx() {
		return levelIdx;
	}
	public void setLevelIdx(int levelIdx) {
		this.levelIdx = levelIdx;
	}
	public int getSortOrder() {
		return sortOrder;
	}
	public void setSortOrder(int sortOrder) {
		this.sortOrder = sortOrder;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDisplayDate() {
		return displayDate;
	}
	public void setDisplayDate(String displayDate) {
		this.displayDate = displayDate;
	}
	public LocalDateTime getRegDate() {
		return regDate;
	}
	public void setRegDate(LocalDateTime regDate) {
		this.regDate = regDate;
	}
	public LocalDateTime getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(LocalDateTime modifyDate) {
		this.modifyDate = modifyDate;
	}
	public int getReadCnt() {
		return readCnt;
	}
	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileExt() {
		return fileExt;
	}
	public void setFileExt(String fileExt) {
		this.fileExt = fileExt;
	}
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}

}
