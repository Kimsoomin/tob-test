package global;

public class OracleTable {
	public static String make(String table, String column, String pk){
		return "create table "+table+"("
				+ column
				+ ",constraint "+table+"_pk"+" primary key("+pk+"))";
	} // C : 테이블 생성
	public static String show(String name){
		return "desc "+name;
	} // R : 테이블 조회
	public static String change(String oldName, String newName){
		return "rename "+oldName+" to"+newName;
	} // U : 테이블 수정
	public static String empty(String table){
		return "truncate table "+table;
	} // D : 테이블 유지, 데이터 삭제
	public static String remove(String table){
		return "drop table "+table;
	} // D : 테이블 삭제
}
