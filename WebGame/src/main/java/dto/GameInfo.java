package dto;

import java.io.Serializable;

public class GameInfo implements Serializable {
	private static final long serialVersionUID = 5172686590827527118L;
	
	private String gameTitle;
	private String gameTrailer;
	
	private String gameDescription;
	private String gameTitleImage;
	private String gameImage;
	private String gameurl;
	
	
	
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


	public String getGameImage() {
		return gameImage;
	}


	public void setGameImage(String gameImage) {
		this.gameImage = gameImage;
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