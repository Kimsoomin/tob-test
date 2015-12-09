package global;

import org.json.simple.JSONObject;

public class JSONTest {
	@SuppressWarnings("unchecked")
	public static void main(String[] args) {
		JSONObject obj = new JSONObject();
		
		obj.put("str", "javaking");
		obj.put("num", new Integer(100));
		obj.put("double", new Double(1000.21));
		obj.put("is_boolean", new Boolean(true));
		
		System.out.println(obj);
		
	}
}
