package AIR;

import java.sql.*;

public class AIRDB {
   
   static  Connection con         = null;
    static Statement stmt         = null;
    static PreparedStatement  prStmt = null;
    static  ResultSet rs           = null ;
    
   static String driver;
   public static String dbms;
   static String URL;
   static String database;
    
   static String driverMySQL = "com.mysql.jdbc.Driver";
   static String URLLocalMySQL = "jdbc:mysql://localhost:3306/";
   static String URLRemoteMySQL = "jdbc:mysql://203.252.21.54:3306/";
    
    static {
      driver = driverMySQL;
      dbms = "MySQL";
      URL = URLLocalMySQL;
      database = "air";
   }
    
 // DEBUG ���� ���� true�̸� debug�� ���� ������ ��µ�
    static boolean DEBUG = false;
    
    static void outputForDebug(String msg) {
       if (DEBUG)
          System.out.println("  << for debug >> " + msg);      
    }
    
    public static void setDBMS(String dbmsTo) {
      outputForDebug("in setSBMS(): DBMS = " + dbmsTo); 
      
      if (dbmsTo.equals("MySQL")){
         driver = driverMySQL;
         dbms = "MySQL";
         URL = URLLocalMySQL;
      }
      else if (dbmsTo.equals("Remote MySQL")){
         driver = driverMySQL;
         dbms = "Remote MySQL";
         URL = URLRemoteMySQL;
      }

      loadConnectAir();
   }
 // JDBC ����̹� �ε� �� ����, ���� �����̸� true, ���и� false ��ȯ�ϴ� �޼ҵ�
    public static boolean loadConnectAir()  {
       return loadConnect("air");
    }
    
    
 // ����̺� �ε� �� �����ϴ� �޼ҵ�
    public static boolean loadConnect(String database)  {
       try {
          // ����̹� �ε�
          Class.forName(driverMySQL);
       } catch ( java.lang.ClassNotFoundException e ) {
          System.err.println("\n  ??? Driver load error in loadConnect(): " + e.getMessage() );
          e.printStackTrace();
       }

       try {
          // �����ϱ� - air �����ͺ��̽��� ����
          con = DriverManager.getConnection(URL + database, "root", "onlyroot");
          outputForDebug("���� ����: " + URL + database + "�� �����");
          
          return true;
       } catch( SQLException ex ) {
          System.err.println("\n  ??? Connection error in loadConnect(): " + ex.getMessage() );
          ex.printStackTrace();
       }
    
       return false;
    }
 // �־��� SQL ���� �����ϴ� �޼ҵ�
     public static void executeAnyQuery(String sql) {
        try {
           Statement stmt = con.createStatement();
           stmt.execute(sql);
        }
        catch(SQLException ex ) {
           System.err.println("\n  ??? SQL exec error in executeAnyQuery(): " + ex.getMessage() );
           ex.printStackTrace();
        }
     }
     public static ResultSet selectQuery(String sql) {
         try {
            // Statement ���� 
            stmt = con.createStatement();
            rs = stmt.executeQuery(sql);  

         } catch( SQLException ex )        {
            System.err.println("** SQL exec error in selectQuery() : " + ex.getMessage() );
         }
            
         return rs;
         
      }
    
 // Customer ��ü�� ����� ���̺� customer�� ���÷� �����ϴ� �޼ҵ�
    public static boolean insertCustomer(Customer customer) {
      try {
         customer.output();
         String sql = "insert into customer values (?, ?, ?, ?, ?, ?, ?, ?);" ;
         prStmt= con.prepareStatement(sql);  
         prStmt.setString(1, customer.getId());
          prStmt.setString(2, customer.getPassword());
          prStmt.setString(3, customer.getName());
          prStmt.setString(4, customer.getGender());
          prStmt.setString(5, customer.getNumber());
          prStmt.setInt(6, customer.getAge());
          prStmt.setString(7, customer.getPassportNo());
          prStmt.setString(8, customer.getAddress());
         prStmt.executeUpdate();
         return true;
      }
      catch(SQLException ex ) {
         System.err.println("\n  ??? SQL exec error in executeAnyQuery(): " + ex.getMessage() );
         ex.printStackTrace();
         return false;
      }
    }
    
    // ȸ������ �� �α��� 
    // ���̵��ߺ��� Ȯ���ϴ� �޼ҵ� �ߺ��� ������ true
public static boolean idDuplication(String id) {
      
       String sql = "select id from Customer where id =? ";
       
       try {
          PreparedStatement pstmt = con.prepareStatement(sql);
          pstmt.setString(1, id);
          ResultSet rs = pstmt.executeQuery();
          
          while(rs.next()) {
             if(rs.getString("id").equals(id)) {
                return false;
             }
          }
       }catch (SQLException e) {
          e.printStackTrace();
       }
       return true;
    }
    
    //���̵� ������� �α��� �Һ��� ��ü ��ȯ(��ġ�ϴ� ȸ������������ null�� ��ȯ)
    public static Customer loginProcess(String id,  String password) {
       try {
         // SQL ���ǹ��� �����Ѵ�.
         String sql = "select * from Customer where id=? and password=?;" ;
         outputForDebug("In getCustomer() SQL : " + sql);
         PreparedStatement prStmt = con.prepareStatement(sql);
         prStmt.setString(1, id);
         prStmt.setString(2, password);

         ResultSet rs = prStmt.executeQuery();  
         if (rs.next())  {
            Customer customer = getCustomerFromRS(rs);
            return customer;
         }
      } catch( SQLException ex ) {
         System.err.println("\n  ??? SQL exec error in getCustomer(): " + ex.getMessage() );
      }
       return null;
    }
    //���̵� ������� �α��� �Һ��� ��ü ��ȯ(��ġ�ϴ� ȸ������������ null�� ��ȯ)
    public static Customer loginManagerProcess(String id,  String password) {
       try {
         // SQL ���ǹ��� �����Ѵ�.
         String sql = "select * from Customer where id=('admin' or 'admin2') and password='03AC674216F3E15C761EE1A5E255F067953623C8B388B4459E13F978D7C846F4';" ;
         outputForDebug("In getCustomer() SQL : " + sql);
         PreparedStatement prStmt = con.prepareStatement(sql);
         prStmt.setString(1, id);
         prStmt.setString(2, password);

         ResultSet rs = prStmt.executeQuery();  
         if (rs.next())  {
            Customer customer = getCustomerFromRS(rs);
            return customer;
         }
      } catch( SQLException ex ) {
         System.err.println("\n  ??? SQL exec error in getCustomer(): " + ex.getMessage() );
      }
       return null;
    }
    public static Customer getCustomerFromRS(ResultSet rs) { 
        Customer cu = new Customer();

        try {
           //if (rs.getRow() ==  0)
           //   return null;
           
           String id = rs.getString("id");  // ID ��Ʈ����Ʈ ���� ����
           String password = rs.getString("password");
           String name = rs.getString("name");
           String gender = rs.getString("gender");
           String number = rs.getString("number");
           int age = rs.getInt("age");
           String passportNo = rs.getString("passportNo");
           String address = rs.getString("address");
           
           cu.setId(id);   // ResultSet�� ��Ʈ����Ʈ ���� get�Ͽ� �ʵ��� ������ ���� 
           cu.setPassword(password);
           cu.setName(name);
           cu.setGender(gender);
           cu.setNumber(number);
           cu.setAge(age);
           cu.setPassportNo(passportNo);
           cu.setAddress(address);
           
        } catch( SQLException ex )        {
           System.err.println("\n  ??? SQL exec error in getCustomerFromRS(): " + ex.getMessage() );
        }

        return cu;
     }
       
 
     public static boolean insertReserve(Reserve reserve) {
       try {
          reserve.output();
          String sql = "insert into reserve values (?, ?, ?, ?, ?);" ;
          prStmt= con.prepareStatement(sql);  
          prStmt.setInt(1, reserve.getReserveId());
           prStmt.setInt(2, reserve.getUniqueNo());
           prStmt.setString(3, reserve.getId());
           prStmt.setInt(4, reserve.getNum());
           prStmt.setInt(5, reserve.getTotalPrice());
           
          prStmt.executeUpdate();
          return true;
       }
       catch(SQLException ex ) {
          System.err.println("\n  ??? SQL exec error in executeAnyQuery(): " + ex.getMessage() );
          ex.printStackTrace();
          return false;
       }
     }
    // �뼱 ��¿� ����
  // �뼱 ��¿� ����
     public static ResultSet getRoute(String date, String routeName) {
         String sql = "select uniqueNo as �뼱��ȣ, routeName as �뼱��, sAirName as ��߰����̸�, aAirName as ���������̸�, sTime as ��߽ð�, aTime as �����ð�, price as �ݾ� "
                 + "from Route where routename = '"+routeName+"' and date = '"+date+"';";
         System.out.println("   >> SQL : " + sql + "\n");

         return selectQuery(sql);
      }
    //������Ȳ ���
    public static ResultSet getReserve(int id) {
        String sql = "select reserveId as �����ȣ, uniqueNo as �뼱��ȣ, id as ���̵�, num as �ο���, totalPrice as �� ���� ����"
                + "from Reserve where id = '"+id+"';";
        System.out.println("   >> SQL : " + sql + "\n");

        return selectQuery(sql);
     }
    //���� ������Ȳ ���
    public static ResultSet getCustomerReserve(String id) {
        String sql = "select reserveId as �����ȣ, num as ���ż�, totalPrice as �Ѱ���, routeName as �뼱��, sAirName as ��߰����̸�, aAirName as ���������̸�, sTime as ��߽ð�, aTime as �����ð� "
              + "from Reserve, Route "
              + "where Reserve.uniqueNo = Route.uniqueNo and  id = '"+id+"';";
        System.out.println("   >> SQL : " + sql + "\n");

        return selectQuery(sql);
     }
  //��¥�� ��ü ������Ȳ ���
    public static ResultSet getManagerReserve() {
       String sql = "select id as ���̵�, reserveId as �����ȣ, num as ���ż�, totalPrice as �Ѱ���, routeName as �뼱��, sAirName as ��߰����̸�, aAirName as ���������̸�, sTime as ��߽ð�, aTime as �����ð� "
              + "from Reserve, Route "
              + "where Reserve.uniqueNo = Route.uniqueNo;";
        System.out.println("   >> SQL : " + sql + "\n");

        return selectQuery(sql);
     }
    //��¥�� ��ü �뼱���
        public static ResultSet getManagerRoute(String date) {
            String sql = "select * from Route where date = '"+date+"';";
            System.out.println("   >> SQL : " + sql + "\n");

            return selectQuery(sql);
         }
     // ���� ��� ����
         public static boolean cancelReserve(int reserveId) {
           try {
              
              String sql = "delete from reserve where reserveId =? ";
              prStmt= con.prepareStatement(sql);
              prStmt.setInt(1, reserveId);
               
              prStmt.executeUpdate();
              return true;
           }
           catch(SQLException ex ) {
              System.err.println("\n  ??? SQL exec error in executeAnyQuery(): " + ex.getMessage() );
              ex.printStackTrace();
              return false;
           }
         }
         // Manager�� �뼱 ��� ����
         public static boolean cancelRoute(int uniqueNo) {
           try {
              
              String sql = "delete from Route where uniqueNo =? ";
              prStmt= con.prepareStatement(sql);
              prStmt.setInt(1, uniqueNo);
               
              prStmt.executeUpdate();
              return true;
           }
           catch(SQLException ex ) {
              System.err.println("\n  ??? SQL exec error in executeAnyQuery(): " + ex.getMessage() );
              ex.printStackTrace();
              return false;
           }
         }
      // Route ��ü�� �뼱 ���̺� route�� ���÷� �����ϴ� �޼ҵ�
         public static boolean insertRoute(Route route) {
           try {
              route.output();
              String sql = "insert into route values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);" ;
              prStmt= con.prepareStatement(sql);  
              prStmt.setInt(1, route.getUniqueNo());
               prStmt.setString(2, route.getRouteName());
               prStmt.setInt(3, route.getsAirNo());
               prStmt.setInt(4, route.getaAirNo());
               prStmt.setString(5, route.getsAirName());
               prStmt.setString(6, route.getsTime());
               prStmt.setString(7, route.getaAirName());
               prStmt.setString(8, route.getaTime());
               prStmt.setString(9, route.getDate());
               prStmt.setInt(10, route.getPrice());
               
              prStmt.executeUpdate();
              return true;
           }
           catch(SQLException ex ) {
              System.err.println("\n  ??? SQL exec error in executeAnyQuery(): " + ex.getMessage() );
              ex.printStackTrace();
              return false;
           }
         }
}