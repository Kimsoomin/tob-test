package global;

public class DQL {
	public static String searchAll(String table){
		return "select * from "+table;
	}
	public static String searchSome(String table, String column, String keyword){
		return "select * from "+table+" where "+column+" = "+keyword;
	}
	public static String searchOne(String table, String column, String keyword){
		return "select * from "+table+" where "+column+" = "+keyword;
	}
	public static String count(String table){
		return "select count(*) as count from "+table;
	}
	public static String searchTwo(String table, String column1, String keyword1, String column2, String keyword2){
		//System.out.println("select * from "+table+" where "+column1+"='"+keyword1+"' and "+column2+"='"+keyword2+"'");
		return "select * from "+table+" where "+column1+"='"+keyword1+"' and "+column2+"='"+keyword2+"'";
	}
}

