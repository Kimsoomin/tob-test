package global;

public class OracleData {
	public static String make(String table, String value){
		return "insert into "+table+"("+value+")";
	} // C : 데이터 추가
	public static String searchAll(String table){
		return "select * from "+table;
	}
	public static String searchSome(String table, String column, String keyword){
		return "select * from "+table+" where "+column+" = "+keyword;
	} // R : 데이터 조회
	public static String searchOne(String table, String column, String keyword){
		return "select * from "+table+" where "+column+" = "+keyword;
	} // R : 데이터 조회
	public static String change(String table, String values, String column, String keyword){
		return "update "+table+" set "+values+" where "+column+" = "+keyword;
	} // U : 데이터 수정
	public static String remove(String table, String column, String keyword){
		return "delete from "+table+" where "+column+" = "+keyword;
	}
	// D : 데이터 삭제
	
}
