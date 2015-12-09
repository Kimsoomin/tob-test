package global;
 	// 오라클 타입은 4가지가 있다 => varchar(10), char(10), number, date.
public class OracleColumn {
	public static String makeString(String table, String column, String size){
		return "alter table "+table+" add("+column+" varchar2("+size+"))";
	} // C : varchar2 컬럼 생성
	public static String makeNumber(String table, String column){
		return "alter table "+table+" add("+column+" number)";
	} // C : number 컬럼 생성
	public static String makeDate(String table, String column){
		return "alter table "+table+" add("+column+" date)";
	} // C : date 컬럼 생성
	  // R : 컬럼 조회(x)
	public static String changeName(String table, String oldColumn, String newColumn){
		return "alter table "+table+" rename column "+oldColumn+" to "+newColumn;
	} // U : 컬럼 이름 수정
	public static String changeType(String table, String column, String newType){
		return "alter table "+table+" modify("+column+" "+newType+")";
	} // U : 컬럼 타입 수정
	public static String remove(String table, String column){
		return "alter table "+table+" drop column "+column;
	} // D : 컬럼 삭제
	

	
}
