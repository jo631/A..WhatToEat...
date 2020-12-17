package dto;

public class Comment {
	private int boardNum;
	private String username;
	private int resNum;
	private String comment;
	
	public Comment(int boardNum, String username, int resNum ,String comment) {
		this.boardNum = boardNum;
		this.username = username;
		this.resNum = resNum;
		this.comment = comment;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getBoradNum() {
		return boardNum;
	}

	public void setBoradNum(int boradNum) {
		this.boardNum = boradNum;
	}

	public int getResNum() {
		return resNum;
	}

	public void setResNum(int resNum) {
		this.resNum = resNum;
	}
}
