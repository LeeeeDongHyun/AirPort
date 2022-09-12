package AIR;

public class Reserve {
   private int reserveId;// 기본키
   private int uniqueNo; // 노선번호
   private String id;// 사용자 아이디
   private int num;// 인원수
   private int totalPrice;// 총구매가격
   public Reserve() {}
   public Reserve(int reserveId, int uniqueNo, String id, int num, int totalPrice) {
      super();
      this.reserveId = reserveId;
      this.uniqueNo = uniqueNo;
      this.id = id;
      this.num = num;
      this.totalPrice = totalPrice;
   }
   public int getReserveId() {
      return reserveId;
   }
   public void setReserveId(int reserveId) {
      this.reserveId = reserveId;
   }
   public int getUniqueNo() {
      return uniqueNo;
   }
   public void setUniqueNo(int uniqueNo) {
      this.uniqueNo = uniqueNo;
   }
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public int getNum() {
      return num;
   }
   public void setNum(int num) {
      this.num = num;
   }
   public int getTotalPrice() {
      return totalPrice;
   }
   public void setTotalPrice(int totalPrice) {
      this.totalPrice = totalPrice;
   }
   
// 고객정보 출력
      public void output() {
         System.out.print("  * 예약번호: " + reserveId +",  ");
         System.out.print("고유번호: " + uniqueNo +",  ");
         System.out.print("아이디: " + id+",  ");
         System.out.print("인원수: " + num+",   ");
         System.out.print("총구매가격: " + totalPrice +",");
         
      }   
 
}