package admin;

import java.io.Serializable;

public class AdminVO implements Serializable{
	private String id;
	private String password;
	private String account_num;
	private String total;
	
	public String getAccount_num() {
		return account_num;
	}

	public String getTotal() {
		return total;
	}

	public void setAccount_num(String account_num) {
		this.account_num = account_num;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public AdminVO() {
	}
	
	public AdminVO(String id, String password) {
		this.id = id;
		this.password = password;
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

}
