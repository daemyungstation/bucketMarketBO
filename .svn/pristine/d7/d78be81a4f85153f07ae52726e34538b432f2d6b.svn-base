package common.util.renderer;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import common.model.Request;
import common.util.StringUtil;

@Component
public class MenuRenderer {
    
    @Value("#{resource['server.ssl.domain']}")
    private String serverDomain;
    
    public JSONObject renderMenu(List<Map<String, Object>> menuList) {
        
        HttpServletRequest request = Request.getCurrentRequest();
        
        JSONObject jsonReturnObj = new JSONObject();

        JSONObject json1DepthObj = new JSONObject(); // 1depth 메뉴 정보
        JSONObject json2DepthObj = null; // 2depth 메뉴 정보
        JSONObject json3DepthObj = null; // 3depth 메뉴 정보

        JSONArray Json1DepthArray = new JSONArray(); // 1depth 메뉴 목록
        JSONArray Json2DepthArray = null; // 2depth 메뉴 목록
        JSONArray Json3DepthArray = null; // 3depth 메뉴 목록

        // 메뉴목록 json 생성
        /*
         * ADM_MNU_NM : 메뉴명 ADM_MNU_URL : URL ADM_MNU_LEVEL : Level
         * NEXT_ADM_MNU_LEVEL : next Level PREV_ADM_MNU_LEVEL : prev Level
         */
        String requestUri = request.getRequestURI().toString();
        int navi1Depth = 0; // 1depth 위치
        int navi2Depth = 0; // 2depth 위치
        int navi3Depth = 0; // 3depth 위치
        int RANK = 0; // depth별 rank
        String ADM_MNU_IDX = "";
        String ADM_MNU_NM = "";
        String ADM_MNU_URL = "";
        String ADM_MNU_AUTH_URL = "";
        int ADM_MNU_LEVEL = 0;
        int NEXT_ADM_MNU_LEVEL = 0;
        int PREV_ADM_MNU_LEVEL = 0;
        // 초기 메뉴 값
        jsonReturnObj.append("name", "");
        jsonReturnObj.append("src", "");
        // 대시보드 추가
        json1DepthObj.put("icon_class", "gnbmenu-code-0");
        json1DepthObj.put("name", "대시보드");
        json1DepthObj.put("src", serverDomain);
        Json1DepthArray.put(json1DepthObj);
        for (Map<String, Object> dataMap : menuList) {
            ADM_MNU_IDX = StringUtil.getString(dataMap.get("ADM_MNU_IDX"));
            ADM_MNU_NM = StringUtil.getString(dataMap.get("ADM_MNU_NM"));
            ADM_MNU_URL = StringUtil.getString(dataMap.get("ADM_MNU_URL"));
            ADM_MNU_AUTH_URL = StringUtil.getString(dataMap.get("ADM_MNU_AUTH_URL")); // 권한체크 URL
            ADM_MNU_LEVEL = StringUtil.getInt(dataMap.get("ADM_MNU_LEVEL"));
            NEXT_ADM_MNU_LEVEL = StringUtil.getInt(dataMap.get("NEXT_ADM_MNU_LEVEL"));
            PREV_ADM_MNU_LEVEL = StringUtil.getInt(dataMap.get("PREV_ADM_MNU_LEVEL"));
            RANK = StringUtil.getInt(dataMap.get("RANK"));
            
            String [] menuArry = ADM_MNU_URL.split("/");
            String [] pages = {"List.do", "Form.do", "Edit.do", "View.do", "Popup.do"};
            String mappingPage = "";
            for (String page : pages) {
                if (menuArry[3].contains(page)) {
                    mappingPage = page.replaceAll(".do", "").toLowerCase();
                    menuArry[3] = menuArry[3].replaceAll(page, "");
                    break;
                }
            }
            
            switch (ADM_MNU_LEVEL) {
            case 0: // 1depth
                json1DepthObj = new JSONObject();
                json1DepthObj.put("icon_class", "gnbmenu-code-" + ADM_MNU_IDX);
                json1DepthObj.put("name", ADM_MNU_NM);
                json1DepthObj.put("src", "javascript:;");
                json1DepthObj.put("onclick", "$.requestPage(this, '" + mappingPage + "')");
                json1DepthObj.put("menu_group", menuArry[2]);
                json1DepthObj.put("menu_subclass", menuArry[3]);
                navi1Depth = RANK; // 해당 1depth RANK를 navi1Depth 변수에 저장
                if (requestUri.indexOf(ADM_MNU_AUTH_URL) > -1) { // click한 uri에 권한 체크 url이 들어있는지 여부 판단
                    request.setAttribute("navi1Depth", navi1Depth);
                    request.setAttribute("navi2Depth", "0");
                    request.setAttribute("navi3Depth", "0");
                }
                if (NEXT_ADM_MNU_LEVEL == 0) {
                    Json1DepthArray.put(json1DepthObj);
                }
                break;
            case 1: // 2depth
                json2DepthObj = new JSONObject();
                if (PREV_ADM_MNU_LEVEL == 0) {
                    Json2DepthArray = new JSONArray();
                }
                json2DepthObj.put("icon_class", "gnbmenu-code-" + ADM_MNU_IDX);
                json2DepthObj.put("name", ADM_MNU_NM);
                json2DepthObj.put("src", "javascript:;");
                json2DepthObj.put("onclick", "$.requestPage(this, '" + mappingPage + "')");
                json2DepthObj.put("menu_group", menuArry[2]);
                json2DepthObj.put("menu_subclass", menuArry[3]);
                navi2Depth = RANK; // 해당 2depth RANK를 navi2Depth 변수에 저장
                if (requestUri.indexOf(ADM_MNU_AUTH_URL) > -1) {
                    request.setAttribute("navi1Depth", navi1Depth);
                    request.setAttribute("navi2Depth", navi2Depth - 1);
                    request.setAttribute("navi3Depth", "0");
                }
                if (NEXT_ADM_MNU_LEVEL == 0 || NEXT_ADM_MNU_LEVEL == 1) {
                    Json2DepthArray.put(json2DepthObj);
                }
                if (NEXT_ADM_MNU_LEVEL == 0) {
                    json1DepthObj.put("child", Json2DepthArray);
                    Json1DepthArray.put(json1DepthObj);
                }
                break;
            case 2: // 3depth
                json3DepthObj = new JSONObject();
                if (PREV_ADM_MNU_LEVEL == 1) {
                    Json3DepthArray = new JSONArray();
                }
                json3DepthObj.put("icon_class", "gnbmenu-code-" + ADM_MNU_IDX);
                json3DepthObj.put("name", ADM_MNU_NM);
                json3DepthObj.put("src", "javascript:;");
                json3DepthObj.put("onclick", "$.requestPage(this, '" + mappingPage + "')");
                json3DepthObj.put("menu_group", menuArry[2]);
                json3DepthObj.put("menu_subclass", menuArry[3]);
                navi3Depth = RANK; // 해당 3depth RANK를 navi3Depth 변수에 저장
                if (requestUri.indexOf(ADM_MNU_AUTH_URL) > -1) {
                    request.setAttribute("navi1Depth", navi1Depth);
                    request.setAttribute("navi2Depth", navi2Depth - 1);
                    request.setAttribute("navi3Depth", navi3Depth - 1);
                }
                Json3DepthArray.put(json3DepthObj);
                if (NEXT_ADM_MNU_LEVEL == 1) {
                    json2DepthObj.put("child", Json3DepthArray);
                    Json2DepthArray.put(json2DepthObj);
                }
                if (NEXT_ADM_MNU_LEVEL == 0) {
                    json2DepthObj.put("child", Json3DepthArray);
                    Json2DepthArray.put(json2DepthObj);
                    json1DepthObj.put("child", Json2DepthArray);
                    Json1DepthArray.put(json1DepthObj);
                }
                break;
            }
        }
        jsonReturnObj.put("child", Json1DepthArray);
        return jsonReturnObj;
    }
    
}
