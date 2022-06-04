package dto;

import java.io.Serializable;

public class GameReply implements Serializable {
	private static final long serialVersionUID = 5172686590827527118L;
	
	
	private String Replynum;
	private String gameCode;
	private String replyId;
	private String replyPw;
	private String replyComment;


	

	public GameReply() {
		super();
		
	}
	

	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	
	
	public String getReplynum() {
		return Replynum;
	}


	public void setReplynum(String replynum) {
		Replynum = replynum;
	}


	public String getGameCode() {
		return gameCode;
	}


	public void setGameCode(String gameCode) {
		this.gameCode = gameCode;
	}


	public String getReplyId() {
		return replyId;
	}


	public void setReplyId(String replyId) {
		this.replyId = replyId;
	}


	public String getReplyPw() {
		return replyPw;
	}


	public void setReplyPw(String replyPw) {
		this.replyPw = replyPw;
	}


	public String getReplyComment() {
		return replyComment;
	}


	public void setReplyComment(String replyComment) {
		this.replyComment = replyComment;
	}

	
	

	
	
	
	
	
	
}