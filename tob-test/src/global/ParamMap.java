package global;

import javax.servlet.http.HttpServletRequest;

public class ParamMap {
   public static String getValueBy(HttpServletRequest request,String param){
      return ((String[])request.getParameterMap().get(param))[0];
   }
   public static StringBuffer getValuesBy(HttpServletRequest request,String param){
      String[] arr = (String[])request.getParameterMap().get(param);
      StringBuffer buff = new StringBuffer();
      for (int i = 0; i < arr.length; i++) {
         buff = buff.append(arr[i]+",");
      }
      return buff;
   }

}
