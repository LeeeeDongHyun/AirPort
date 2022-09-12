package AIR;

public class Manager {

	String UniqueNo; //고유번호
	String RouteName; //노선명
	int SAirNo; //출발공항번호 StartAirNumber
	int AAirNo; //도착공항번호 ArriveAirNumber
	String MgrID; //관리자 아이디 ManagerID
	String password;
	
	public Manager(String MgrID, String password) {
		this.MgrID = MgrID;
		this.password = password;
	}
	// 관리자정보 출력
			public void output() {
				
				System.out.print("관리자아이디: " + MgrID +",");
				System.out.print("비밀번호: " + password +"\n ");
				
			}	
			/*
			 * getter 메소드와 setter 메소드 정의
			 */
			public String getMgrID() {
				return MgrID;
			}
			public void setMgrID(String MgrID) {
				this.MgrID = MgrID;
			}
			public String getPassword() {
				return password;
			}
			public void setPassword(String password) {
				this.password = password;
			}
}
