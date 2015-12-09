package global;

public class OracleSchema {
	public static String make(String name, String pass){
		return "create user"+name+" identified by "+pass;
	} // C : 스키마 생성
	public static String show(){
		return "show user";
	} // R : 스키마 조회
	  // U : 스키마 수정(x)
	public static String drop(String name){
		return "drop user "+name+" cascade";
	} // D : 스키마 삭제
}
