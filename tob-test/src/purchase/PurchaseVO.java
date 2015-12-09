package purchase;

import java.io.Serializable;

public class PurchaseVO implements Serializable{
	private static final long serialVersionUID = 1L;
	private String purNum;
	private int sum;
	private String accountNum;
	private String userid;
	
	public PurchaseVO(){}
	
	public PurchaseVO(String purNum, int sum, String accountNum, String userid){
		this.purNum = purNum;
		this.sum = sum;
		this.accountNum = accountNum;
		this.userid = userid;
	}
	
	
	public String getPurNum() {
		return purNum;
	}
	public void setPurNum(String purNum) {
		this.purNum = purNum;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public String getAccountNum() {
		return accountNum;
	}
	public void setAccountNum(String accountNum) {
		this.accountNum = accountNum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "PurchaseVO [purNum=" + purNum + ", sum=" + sum + ", accountNum=" + accountNum + ", userid=" + userid
				+ "]";
	}
	
	
	
}
