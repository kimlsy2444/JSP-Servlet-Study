package dao;

import java.util.ArrayList;

import dto.GameInfo;



public class GameInfoRepository {
	
	private ArrayList<GameInfo> listOfInfo = new ArrayList<>();
	// GameInfoRepository인스턴스를 하나만 공유하게끔 싱글톤 패턴을 이용한다.
	
	
	private static GameInfoRepository instance = new GameInfoRepository();
	
	// 인스턴스를 리턴하는 getter메서드
	public static  GameInfoRepository getInstance() {
		return instance;
	}
	
	
	public GameInfoRepository() {
		//  샘플 데이터 더미 lol 야스오
		GameInfo yasuo = new GameInfo("Yasuo 용서받지 못한 자" ,"리그 오브 레전드의 117번째 챔피언");
		
		yasuo.setGameDescription("굳은 결의를 품은 아이오니아의 검객 야스오는 날렵한 검술과 바람을 자유로이\r\n"
				+ "                다루는 능력으로 적을 쓰러뜨린다. 젊은 시절, 자부심으로 가득 찼던 야스오는 스승을 살해한 누명을 쓰게 되고,\r\n"
				+ "                결백을 증명할 길이 없는 상황에서 급기야는 자신을 보호하기 위해 친형까지 죽음으로 이끌게 된다. 스승을 살해한 진범이 결국 밝혀졌지만,\r\n"
				+ "                지금도 야스오는 자신의 검을 인도하는 바람에만 의존한 채 고향 아이오니아를 배회하고 있다.\r\n"
				+ "                과거의 자신을 아직 용서하지 못한 채로.");		
		yasuo.setGameTitleImage("Yasuo.png");
		
		yasuo.setGameImage("Yasuo2.jpg");
		//https://youtu.be/hzyDgpmc3o0
		//https://www.youtube.com/embed/m5KvhWW7ELA
		yasuo.setGameurl("https://www.youtube.com/embed/m5KvhWW7ELA");
		
		listOfInfo.add(yasuo);
	}
	
	public ArrayList<GameInfo> getAllInfo(){
		
		return listOfInfo;
	}
	
	
	// listOfInfo에 저장된 모든 게임 정보목록을 조회를 해서 게임 타이틀 하고 일치하는 게임정보를 
	// 리턴을 해주는 메서드이다.
	public GameInfo getGameInfoById(String gameInfoId) {
		
		GameInfo gameinfoById = null;
		
		for(int i = 0; i<listOfInfo.size();i++) {
			GameInfo gameinfo = listOfInfo.get(i);
			if(gameinfo != null && gameinfo.getGameTitle() != null && 
					gameinfo.getGameTitle(). equals(gameInfoId)) {
				
				gameinfoById = gameinfo;
				break;
			}
		}
		return gameinfoById;
	}
	
	// 게임정보를 추가하는 역할을 하는 메서드
	public void addGameInfo(GameInfo GameInfo) {
		listOfInfo.add(GameInfo);
	}
	
	
	
	
}
