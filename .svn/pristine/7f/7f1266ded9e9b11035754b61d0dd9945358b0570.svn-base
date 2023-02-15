package common.util.renderer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import common.util.JSONUtil;
import common.util.StringUtil;

public class TreeRenderer {

    /**
     * <pre>
     * 1. MethodName : renderTree
     * 2. ClassName  : MakeTreeHtmlUtil.java
     * 3. Comment    : 관리자 카테고리 html 생성 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2016. 9. 8.
     * </pre>
     *
     * @param list
     * @param level
     * @param idx
     * @param name
     * @param leaf
     * @return
     */
    public static String renderTree(List<Map<String, Object>> list, String level, String idx, String name, String leaf) {
        // 카테고리 html구성
        StringBuilder returnString = new StringBuilder();

        String treeName = ""; // 카테고리 Name
        String leafValue = "";
        Map<String, Object> treeMap = new HashMap<String, Object>(); // 카테고리 정보
        Map<String, Object> firstTreeMap = new HashMap<String, Object>();

        firstTreeMap = (HashMap<String, Object>) list.get(0);
        int firstTreeLevel = StringUtil.getInt(firstTreeMap.get(level));
        int prevLevel = firstTreeLevel; // 이전 카테고리 level (기본값 설정)
        int currLevel = firstTreeLevel; // 현재 카테고리 level (기본값 설정)
        
        for (int i = 0; i < list.size(); i++) {
            treeMap = (HashMap<String, Object>) list.get(i);
            currLevel = StringUtil.getInt(treeMap.get(level));
            treeName = StringUtil.getString(treeMap.get(name));
            leafValue = StringUtil.getString(treeMap.get(leaf));
            if (i == 0) { // 카테고리 시작
                returnString.append("<li class=\"open\">");
            }

            if (prevLevel == currLevel && i != 0) { // 동일 level
                returnString.append("</li><li class=\"open\">");
            } else if (prevLevel > currLevel) { // 상위 level
                returnString.append("</li>");
                for (int j = 0; j < prevLevel - currLevel; j++) {
                    returnString.append("</ul></li>");
                }

                returnString.append("<li class=\"open\">");
            } else if (prevLevel < currLevel) { // 하위 level
                returnString.append("<ul><li class=\"open\">");
            }
            String data = JSONUtil.convJSONObjectToString(JSONUtil.convMapToJSONObject(treeMap));
            returnString.append("<span class=\"folder\" leaf=\"" + leafValue + "\" data-tree_data='" + data + "'>" + treeName + "</span>");
            
            if ((i + 1) == list.size()) { // 카테고리 종료
                returnString.append("</li>");

                for (int j = 0; j < currLevel - 1; j++) {
                    returnString.append("</ul></li>");
                }
            }

            prevLevel = currLevel;
            treeMap.clear();
        }

        return returnString.toString();
    }
}
