package AIR;

import java.util.*;

public class Customer {
	String id;// 아이디
	String password; //비밀번호
	String name;
	String gender;
	String number;
	int age;
	String passportNo; // 여권번호
	String address; //주소	
	
	public	Customer() {
	}

	public Customer(String id, String password, String name, String gender, String number, int age, String passportNo,
			String address) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.gender = gender;
		this.number = number;
		this.age = age;
		this.passportNo = passportNo;
		this.address = address;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getPassportNo() {
		return passportNo;
	}

	public void setPassportNo(String passportNo) {
		this.passportNo = passportNo;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	
	
	
	// 고객정보 출력
		public void output() {
			System.out.print("  * 아이디: " + id +",  ");
			System.out.print("비밀번호: " + password +",  ");
			System.out.print("이름: " + name+",  ");
			System.out.print("성별: " + gender+",   ");
			System.out.print("전화번호: " + number +",");
			System.out.print("나이: " + age +",   ");
			System.out.print("여권번호: " + passportNo+",   ");
			System.out.print("주소: " + address +"\n");
		}	
	
}