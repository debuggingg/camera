package xyz.itwill.dto;

/*
 CREATE TABLE QNA (
    QNA_NO NUMBER CONSTRAINT QNA_NO_PK PRIMARY KEY,
    QNA_TITLE VARCHAR2(1000),
    QNA_CONTENT VARCHAR2(2000),
    QNA_STATUS NUMBER(1),
    QNA_DATE DATE DEFAULT SYSDATE,
    QNA_PROD_NO NUMBER CONSTRAINT QNA_PROD_NO_FK REFERENCES PRODUCT(PROD_NO) 
    QNA_USERS_NO NUMBER CONSTRAINT QNA_USERS_NO_FK REFERENCES USERS(USERS_NO),
    QNA_ANSWER VARCHAR2(2000),
);

CREATE SEQUENCE QNA_SEQ;

DESC QNA;

SELECT * FROM QNA;

 */
public class QnaDTO {
	private int qnaNo;
	private String qnaTitle;
	private String qnaContent;
	private int qnaStatus;//0:삭제글,1:일반글,2:비밀글	
	private String qnaDate;
	private int qnaProdNo;
	private int qnaUsersNo;//로그인 사용자의 회원번호
	private String usersName;//users 테이블의 회원이름 저장하기 위한 필드 - 작성자
	private String qnaAnswer;
	
	public QnaDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public int getQnaStatus() {
		return qnaStatus;
	}

	public void setQnaStatus(int qnaStatus) {
		this.qnaStatus = qnaStatus;
	}

	public String getQnaDate() {
		return qnaDate;
	}

	public void setQnaDate(String qnaDate) {
		this.qnaDate = qnaDate;
	}

	public int getQnaProdNo() {
		return qnaProdNo;
	}

	public void setQnaProdNo(int qnaProdNo) {
		this.qnaProdNo = qnaProdNo;
	}

	public int getQnaUsersNo() {
		return qnaUsersNo;
	}

	public void setQnaUsersNo(int qnaUsersNo) {
		this.qnaUsersNo = qnaUsersNo;
	}

	public String getUsersName() {
		return usersName;
	}

	public void setUsersName(String usersName) {
		this.usersName = usersName;
	}

	public String getQnaAnswer() {
		return qnaAnswer;
	}

	public void setQnaAnswer(String qnaAnswer) {
		this.qnaAnswer = qnaAnswer;
	}
	
}	