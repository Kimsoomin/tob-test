package global;

public class DML { //insert, update, delete는 DML
	public static String insert(String table, String value){
		return "insert into "+table+"("+value+")";
	}
	public static String update(String table, String values, String column, String keyword){
		return "update "+table+" set "+values+" where "+column+" = "+keyword;
	}
	public static String delete(String table, String column, String keyword){
		return "delete from "+table+" where "+column+" = "+keyword;
	}
	
}
