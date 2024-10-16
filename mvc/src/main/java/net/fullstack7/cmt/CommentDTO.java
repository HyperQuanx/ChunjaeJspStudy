package net.fullstack7.cmt;

import java.util.Date;

public class CommentDTO {
	private int idx;             // 댓글 인덱스
    private int bbsIdx;          // 게시글 인덱스
    private String memberId;     // 작성자 아이디
    private String content;      // 댓글 내용
    private Integer parentIdx;   // 부모 댓글 인덱스 (대댓글일 경우)
    private Date regDate;        // 댓글 작성일

    // 기본 생성자
    public CommentDTO() {}

    // 생성자
    public CommentDTO(int idx, int bbsIdx, String memberId, String content, Integer parentIdx, Date regDate) {
        this.idx = idx;
        this.bbsIdx = bbsIdx;
        this.memberId = memberId;
        this.content = content;
        this.parentIdx = parentIdx;
        this.regDate = regDate;
    }

    // Getter 및 Setter 메서드
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

    public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getParentIdx() {
        return parentIdx;
    }

    public void setParentIdx(Integer parentIdx) {
        this.parentIdx = parentIdx;
    }

    public Date getRegDate() {
        return regDate;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

}
