package common.util;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import lombok.extern.log4j.Log4j2;
import net.sf.json.JSONObject;

@Log4j2
public class HttpConnectionUtil {

    // Request 메소드 정의
    public enum HttpMethod {
        GET, POST
    }
    
    /**
     * <pre>
     * 1. MethodName : splitQuery
     * 2. ClassName  : HttpConnectionUtil.java
     * 3. Comment    : URL Query String 을 Map으로 치환 후 반환
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 6.
     * </pre>
     *
     * @param url
     * @param method
     * @param parameter
     * @param headers
     * @param streamCharset
     * @return
     */
    private static Map<String, Object> splitQuery(String query) throws UnsupportedEncodingException {
        Map<String, Object> query_pairs = new LinkedHashMap<>();
        String[] pairs = query.split("&");
        for (String pair : pairs) {
            int idx = pair.indexOf("=");
            query_pairs.put(URLDecoder.decode(pair.substring(0, idx), "UTF-8"), URLDecoder.decode(pair.substring(idx + 1), "UTF-8"));
        }
        return query_pairs;
    }

    /**
     * <pre>
     * 1. MethodName : getUrlQuery
     * 2. ClassName  : HttpConnectionUtil.java
     * 3. Comment    : Url Query String 반환
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 6.
     * </pre>
     *
     * @param parameter
     * @return
     */
    private static String getUrlQuery (Map<String, Object> parameter) throws Exception {
        String param = null;
        log.debug("=================== REQUEST BODYS ===================");
        // 파라미터가 있을 경우, 파라미터키=파라미터값&파라미터키=파라미터값&파라미터키=파라미터값 의 형태로 만든다.
        if (parameter != null) {
            StringBuffer sb = new StringBuffer();
            for (String key : parameter.keySet()) {
                log.debug("[{}] : [{}]", key, StringUtil.getString(parameter, key));
                if (sb.length() > 0) {
                    sb.append("&");
                }
                sb.append(URLEncoder.encode(key, "UTF-8"));
                sb.append("=");
                sb.append(URLEncoder.encode(StringUtil.getString(parameter, key), "UTF-8"));
            }
            param = sb.toString();
        } else {
            param = "";
        }
        log.debug("======================================================");
        return param;
    }
    
    /**
     * <pre>
     * 1. MethodName : setHeaders
     * 2. ClassName  : HttpConnectionUtil.java
     * 3. Comment    : Request Header 정보 설정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 6.
     * </pre>
     *
     * @param connection
     * @param headers
     * @param method
     */
    private static void setHeaders (HttpURLConnection connection, Map<String, Object> headers, HttpMethod method) throws Exception {
        log.debug("=================== REQUEST HEAERS ===================");
        log.debug("METHOD : [{}]", method.toString());
        // 해더의 메소드를 정의한다.
        connection.setRequestMethod(method.toString());
        for (String key : headers.keySet()) {
            log.debug("[{}] : [{}]", key, StringUtil.getString(headers, key));
            connection.setRequestProperty(key, StringUtil.getString(headers, key));
        }
        log.debug("======================================================");
    }
    
    /**
     * <pre>
     * 1. MethodName : setHeaders
     * 2. ClassName  : HttpConnectionUtil.java
     * 3. Comment    : Request Header 정보 설정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 6.
     * </pre>
     *
     * @param connection
     * @param method
     */
    private static void setHeaders (HttpURLConnection connection, HttpMethod method) throws Exception {
        log.debug("=================== REQUEST HEAERS ===================");
        log.debug("METHOD : [{}]", method.toString());
        log.debug("[ContentType] : [application/x-www-form-urlencoded;charset=utf-8]");
        log.debug("======================================================");
        // 해더의 메소드를 정의한다.
        connection.setRequestMethod(method.toString());
        // 해더의 ContentType를 정의한다.
        connection.setRequestProperty("ContentType", "application/x-www-form-urlencoded;charset=utf-8");
    }
    
    /**
     * <pre>
     * 1. MethodName : setBody
     * 2. ClassName  : HttpConnectionUtil.java
     * 3. Comment    : Request Body 정보 설정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 6.
     * </pre>
     *
     * @param connection
     * @param method
     * @param queryString
     */
    private static void setBody (HttpURLConnection connection, HttpMethod method, String queryString) throws Exception {
        // Http method가 POST 방식의 경우, 해더 아래에
        if (HttpMethod.POST.equals(method)) {
            // 커넥션의 header 밑의 stream을 사용한다. (Get의 경우는 필요가 없다.)
            connection.setDoOutput(true);
            connection.setDoInput(true);
            try (DataOutputStream output = new DataOutputStream(connection.getOutputStream())) {
                log.debug("queryString : [{}]", queryString);
                output.writeBytes(queryString);
                output.flush();
            }
        }
    }
    
    /**
     * <pre>
     * 1. MethodName : getConnection
     * 2. ClassName  : HttpConnectionUtil.java
     * 3. Comment    : URL CONNECTION 인스턴스 반환
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 6.
     * </pre>
     *
     * @param url
     * @param method
     * @param queryString
     * @return
     */
    private static HttpURLConnection getConnection (String url, HttpMethod method, String queryString) throws Exception {
        log.debug("==================== REQUEST  URL ====================");
        log.debug("url : [{}]", url);
        log.debug("======================================================");
        // Http method가 GET 방식의 경우 파라미터를 url 주소 뒤에 붙인다.
        if (HttpMethod.GET.equals(method)) {
            if (url.contains("?")) {
                url += "&" + queryString;
            } else {
                url += "?" + queryString;
            }
        }
        return (HttpURLConnection) new URL(url).openConnection();
    }
    
    /**
     * <pre>
     * 1. MethodName : getResult
     * 2. ClassName  : HttpConnectionUtil.java
     * 3. Comment    : 결과 반환
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 6.
     * </pre>
     *
     * @param connection
     * @param clazz
     * @return
     */
    private static Map<String, Object> getResult (HttpURLConnection connection, Class<?> clazz) throws Exception {
        // 스트림으로 반환 결과값을 받는다.
        try (BufferedReader input = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
            String line;
            StringBuffer buffer = new StringBuffer();
            while ((line = input.readLine()) != null) {
                buffer.append(line);
            }
            log.debug(buffer.toString());
            Map<String, Object> resultMap = new HashMap<>();
            if (clazz.equals(JSONObject.class)) {
                resultMap = JSONUtil.convJSONObjectToMap(JSONUtil.convStringToJSONObject(buffer.toString()));
            } else if (clazz.equals(String.class)) {
                resultMap = splitQuery(buffer.toString());
            }
            resultMap.put("responseCode", connection.getResponseCode());
            resultMap.put("responseMessage", connection.getResponseMessage());
            if (log.isDebugEnabled()) {
                log.debug("=================== RESPONSE BODYS ===================");
                for (String key : resultMap.keySet()) {
                    log.debug("[{}] : [{}]", key, StringUtil.getString(resultMap, key));
                }
                log.debug("======================================================");
            }
            return resultMap;
        }
    }
    
    /**
     * <pre>
     * 1. MethodName : getResult
     * 2. ClassName  : HttpConnectionUtil.java
     * 3. Comment    : 결과 반환
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 6.
     * </pre>
     *
     * @param connection
     * @params streamCharset
     * @param clazz
     * @return
     */
    private static Map<String, Object> getResult (HttpURLConnection connection, String streamCharset, Class<?> clazz) throws Exception {
        // 스트림으로 반환 결과값을 받는다.
        try (BufferedReader input = new BufferedReader(new InputStreamReader(connection.getInputStream(), streamCharset))) {
            String line;
            StringBuffer buffer = new StringBuffer();
            while ((line = input.readLine()) != null) {
                buffer.append(line);
            }
            log.debug(buffer.toString());
            Map<String, Object> resultMap = new HashMap<>();
            if (clazz.equals(JSONObject.class)) {
                resultMap = JSONUtil.convJSONObjectToMap(JSONUtil.convStringToJSONObject(buffer.toString()));
            } else if (clazz.equals(String.class)) {
                resultMap = splitQuery(buffer.toString());
            }
            resultMap.put("responseCode", connection.getResponseCode());
            resultMap.put("responseMessage", connection.getResponseMessage());
            if (log.isDebugEnabled()) {
                log.debug("=================== RESPONSE BODYS ===================");
                for (String key : resultMap.keySet()) {
                    log.debug("[{}] : [{}]", key, StringUtil.getString(resultMap, key));
                }
                log.debug("======================================================");
            }
            return resultMap;
        }
    }
    
    /**
     * <pre>
     * 1. MethodName : excute
     * 2. ClassName  : HttpConnectionUtil.java
     * 3. Comment    : HttpURLConnection를 실행하는 함수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 6.
     * </pre>
     *
     * @param url
     * @param method
     * @param parameter
     * @param clazz
     * @return
     */
    public static Map<String, Object> excute(String url, HttpMethod method, Map<String, Object> parameter, Class<?> clazz) {
        Map<String, Object> returnMap = new HashMap<>();
        try {
            String queryString = getUrlQuery(parameter);
            HttpURLConnection connection = getConnection(url, method, queryString);
            setHeaders(connection, method);
            setBody(connection, method, queryString);
            returnMap = getResult(connection, clazz);
        } catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return returnMap;
    }
    
    /**
     * <pre>
     * 1. MethodName : excute
     * 2. ClassName  : HttpConnectionUtil.java
     * 3. Comment    : HttpURLConnection를 실행하는 함수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 6.
     * </pre>
     *
     * @param url
     * @param method
     * @param headers
     * @param parameter
     * @param streamCharset
     * @param clazz
     * @return
     */
    public static Map<String, Object> excute(String url, HttpMethod method, Map<String, Object> headers, Map<String, Object> parameter, String streamCharset, Class<?> clazz) {
        Map<String, Object> returnMap = new HashMap<>();
        try {
            String queryString = getUrlQuery(parameter);
            HttpURLConnection connection = getConnection(url, method, queryString);
            setHeaders(connection, headers, method);
            setBody(connection, method, queryString);
            returnMap = getResult(connection, streamCharset, clazz);
        } catch (Throwable e) {
            if (log.isDebugEnabled()) {
                e.printStackTrace();
            }
            throw new RuntimeException(e);
        }
        return returnMap;
        
    }
}
