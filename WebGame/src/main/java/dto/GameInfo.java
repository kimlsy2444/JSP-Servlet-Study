package dto;

import java.io.Serializable;

public class GameInfo implements Serializable {
	private static final long serialVersionUID = 5172686590827527118L;
	
	private String gameTitle;
	private String gameTrailer;
	
	private String gameDescription;
	private String gameTitleImage;
	private String gameImage1;
	private String gameImage2;
	private String gameImage3;
	private String gameurl;
	private String gameTeamname;
	private String gameMembers;
	
	


	public String getGameTeamname() {
		return gameTeamname;
	}

	public void setGameTeamname(String gameTeamname) {
		this.gameTeamname = gameTeamname;
	}

	public String getGameMembers() {
		return gameMembers;
	}

	public void setGameMembers(String gameMembers) {
		this.gameMembers = gameMembers;
	}

	public GameInfo() {
		super();
		
	}
	
	public GameInfo(String gameTitle, String gameTrailer) {
		super();
		this.gameTitle = gameTitle;
		this.gameTrailer = gameTrailer;
	}


	public String getGameTitleImage() {
		return gameTitleImage;
	}

	public void setGameTitleImage(String gameTitleImage) {
		this.gameTitleImage = gameTitleImage;
	}

	public String getGameTitle() {
		return gameTitle;
	}


	public void setGameTitle(String gameTitle) {
		this.gameTitle = gameTitle;
	}


	public String getGameTrailer() {
		return gameTrailer;
	}


	public void setGameTrailer(String gameTrailer) {
		this.gameTrailer = gameTrailer;
	}


	public String getGameDescription() {
		return gameDescription;
	}


	public void setGameDescription(String gameDescription) {
		this.gameDescription = gameDescription;
	}






	public String getGameImage1() {
		return gameImage1;
	}

	public void setGameImage1(String gameImage1) {
		this.gameImage1 = gameImage1;
	}

	public String getGameImage2() {
		return gameImage2;
	}

	public void setGameImage2(String gameImage2) {
		this.gameImage2 = gameImage2;
	}

	public String getGameImage3() {
		return gameImage3;
	}

	public void setGameImage3(String gameImage3) {
		this.gameImage3 = gameImage3;
	}

	public String getGameurl() {
		return gameurl;
	}



	public void setGameurl(String gameurl) {
		this.gameurl = gameurl;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	
}