package common.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.commons.lang3.StringUtils;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

public class JSONUtil {

    /**
     * <pre>
     * 1. MethodName : isJSON
     * 2. ClassName  : JSONUtil.java
     * 3. Comment    : JSON 유효성 검증
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 20.
     * </pre>
     *
     * @param str
     * @return
     */
    public static boolean isJSON(String str) {
        boolean isValid = false;
        try {
            JSONSerializer.toJSON(str);
            isValid = true;
        } catch (Exception e) {
            isValid = false;
        }
        return isValid;
    }

    /**
     * <pre>
     * 1. MethodName : convStringToJSONObject
     * 2. ClassName  : FormatUtil.java
     * 3. Comment    : JSON 형태의 문자열 값을 JSONObject로 변환
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 9.
     * </pre>
     *
     * @param str
     * @return
     */
    public static JSONObject convStringToJSONObject(String str) {
        if (StringUtils.isNotEmpty(str)) {
            str = StringEscapeUtils.unescapeHtml4(str);
        }
        if (isJSON(str)) {
            return JSONObject.fromObject(str);
        } else {
            return new JSONObject();
        }
    }

    /**
     * <pre>
     * 1. MethodName : convStringToJSONArray
     * 2. ClassName  : JSONUtil.java
     * 3. Comment    : JSON 형태의 문자열 값을 JSONArray로 반환
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 20.
     * </pre>
     *
     * @param str
     * @return
     */
    public static JSONArray convStringToJSONArray(String str) {
        if (StringUtils.isNotEmpty(str)) {
            str = StringEscapeUtils.unescapeHtml4(str);
        }
        if (isJSON(str)) {
            return JSONArray.fromObject(str);
        } else {
            return new JSONArray();
        }
    }

    /**
     * <pre>
     * 1. MethodName : convJSONArrayToListMap
     * 2. ClassName  : JSONUtil.java
     * 3. Comment    : JSONArray를 List<Map<String, Object>> 로 반환
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 20.
     * </pre>
     *
     * @param jsonArray
     * @return
     */
    public static List<Map<String, Object>> convJSONArrayToListMap(JSONArray jsonArray) {
        List<Map<String, Object>> list = new ArrayList<>();
        for (Object object : jsonArray) {
            list.add(convJSONObjectToMap((JSONObject) object));
        }
        return list;
    }

    /**
     * <pre>
     * 1. MethodName : convJSONArrayToListString
     * 2. ClassName  : JSONUtil.java
     * 3. Comment    : JSONArray를 List<String> 로 반환
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 20.
     * </pre>
     *
     * @param jsonArray
     * @return
     */
    public static List<String> convJSONArrayToListString(JSONArray jsonArray) {
        List<String> list = new ArrayList<>();
        for (Object object : jsonArray) {
            list.add(StringUtil.getString(object));
        }
        return list;
    }

    /**
     * <pre>
     * 1. MethodName : convJSONObjectToMap
     * 2. ClassName  : FormatUtil.java
     * 3. Comment    : JSONObject 객체를 Map 객체로 변환
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 9.
     * </pre>
     *
     * @param jsonObject
     * @return
     */
    public static Map<String, Object> convJSONObjectToMap(JSONObject jsonObject) {
        Map<String, Object> map = new HashMap<>();
        Iterator<?> keys = jsonObject.keys();
        while (keys.hasNext()) {
            String key = (String) keys.next();
            map.put(key, jsonObject.getString(key));
        }
        return map;
    }
    
    /**
     * <pre>
     * 1. MethodName : convMapToJSONObject
     * 2. ClassName  : JSONUtil.java
     * 3. Comment    : Map 객체를 JSONObject 객체로 반환
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 25.
     * </pre>
     *
     * @param map
     * @return
     */
    public static JSONObject convMapToJSONObject(Map<String, Object> map) {
        return JSONObject.fromObject(map);
    }


    /**
     * <pre>
     * 1. MethodName : convMapToJSONObject
     * 2. ClassName  : JSONUtil.java
     * 3. Comment    : Map 객체를 JSONObject 객체로 반환
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 25.
     * </pre>
     *
     * @param map
     * @return
     */
    public static JSONArray convListMapToJSONArray(List<Map<String, Object>> map) {
        return JSONArray.fromObject(map);
    }


    /**
     * <pre>
     * 1. MethodName : convJSONObjectToString
     * 2. ClassName  : JSONUtil.java
     * 3. Comment    : JSONObject 객체를 문자열로 반환
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 25.
     * </pre>
     *
     * @param jsonObject
     * @return
     */
    public static String convJSONObjectToString(JSONObject jsonObject) {
        return jsonObject.toString();
    }

}
