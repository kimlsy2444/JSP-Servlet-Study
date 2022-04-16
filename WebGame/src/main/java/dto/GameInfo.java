package dto;

import java.io.Serializable;

public class GameInfo implements Serializable {
	private static final long serialVersionUID = 5172686590827527118L;
	
	
	private String gameTeamname;
	private String gameMember1;
	private String gameMember2;
	private String gameMember3;
	private String gameTitle;
	private String gameDescription;
	private String gameTitleImage;
	private String gameurl;
	private String gameImage1;
	private String gameImage2;
	private String gameImage3;

	
	

	

	public GameInfo() {
		super();
		
	}
	
	public GameInfo(String gameTitle) {
		super();
		this.gameTitle = gameTitle;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getGameTeamname() {
		return gameTeamname;
	}

	public void setGameTeamname(String gameTeamname) {
		this.gameTeamname = gameTeamname;
	}

	public String getGameMember1() {
		return gameMember1;
	}

	public void setGameMember1(String gameMember1) {
		this.gameMember1 = gameMember1;
	}

	public String getGameMember2() {
		return gameMember2;
	}

	public void setGameMember2(String gameMember2) {
		this.gameMember2 = gameMember2;
	}

	public String getGameMember3() {
		return gameMember3;
	}

	public void setGameMember3(String gameMember3) {
		this.gameMember3 = gameMember3;
	}

	public String getGameTitle() {
		return gameTitle;
	}

	public void setGameTitle(String gameTitle) {
		this.gameTitle = gameTitle;
	}

	public String getGameDescription() {
		return gameDescription;
	}

	public void setGameDescription(String gameDescription) {
		this.gameDescription = gameDescription;
	}

	public String getGameTitleImage() {
		return gameTitleImage;
	}

	public void setGameTitleImage(String gameTitleImage) {
		this.gameTitleImage = gameTitleImage;
	}

	public String getGameurl() {
		return gameurl;
	}

	public void setGameurl(String gameurl) {
		this.gameurl = gameurl;
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

	
	
	
	
	
	
}