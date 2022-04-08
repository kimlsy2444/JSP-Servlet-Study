package dao;

import java.util.ArrayList;

import dto.GameInfo;



public class GameInfoRepository {
	
	private ArrayList<GameInfo> listOfInfo = new ArrayList<>();
	// GameInfoRepository�ν��Ͻ��� �ϳ��� �����ϰԲ� �̱��� ������ �̿��Ѵ�.
	
	
	private static GameInfoRepository instance = new GameInfoRepository();
	
	// �ν��Ͻ��� �����ϴ� getter�޼���
	public static  GameInfoRepository getInstance() {
		return instance;
	}
	
	
	public GameInfoRepository() {
		//  ���� ������ ���� lol �߽���
		GameInfo yasuo = new GameInfo("Yasuo �뼭���� ���� ��" ,"���� ���� �������� 117��° è�Ǿ�");
		
		yasuo.setGameDescription("���� ���Ǹ� ǰ�� ���̿��Ͼ��� �˰� �߽����� ������ �˼��� �ٶ��� ��������\r\n"
				+ "                �ٷ�� �ɷ����� ���� �����߸���. ���� ����, �ںν����� ���� á�� �߽����� ������ ������ ������ ���� �ǰ�,\r\n"
				+ "                ����� ������ ���� ���� ��Ȳ���� �ޱ�ߴ� �ڽ��� ��ȣ�ϱ� ���� ģ������ �������� �̲��� �ȴ�. ������ ������ ������ �ᱹ ����������,\r\n"
				+ "                ���ݵ� �߽����� �ڽ��� ���� �ε��ϴ� �ٶ����� ������ ä ���� ���̿��ϾƸ� ��ȸ�ϰ� �ִ�.\r\n"
				+ "                ������ �ڽ��� ���� �뼭���� ���� ä��.");		
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
	
	
	// listOfInfo�� ����� ��� ���� ��������� ��ȸ�� �ؼ� ���� Ÿ��Ʋ �ϰ� ��ġ�ϴ� ���������� 
	// ������ ���ִ� �޼����̴�.
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
	
	// ���������� �߰��ϴ� ������ �ϴ� �޼���
	public void addGameInfo(GameInfo GameInfo) {
		listOfInfo.add(GameInfo);
	}
	
	
	
	
}
