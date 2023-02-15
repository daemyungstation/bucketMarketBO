package common.model;

import java.util.Map;

import common.util.StringUtil;

public class Paging {

    // 페이지 셋팅
    public Paging(int totalCount, Map<String, Object> commandMap) {
        this.setPageSize(StringUtil.getInt(commandMap.get("pageSize"), 20));
        this.setPagingSize(StringUtil.getInt(commandMap.get("pagingSize"), 10));
        this.setTotalRecordCount(totalCount);
        this.setcPage(StringUtil.getInt(commandMap.get("cPage"), 1));
        commandMap.put("startNum", this.getStartNum());
        commandMap.put("endNum", this.getEndNum());
    }

    private int cPage; // 현재페이지번호
    private int pageSize; // 페이지 리스트에 표시할 레코드 개수
    private int totalRecordCount; // 총 개시물 수
    private int totalPageCount; // 총페이지수
    private int firstPageNoOnPageList; // 페이지 리스트의 첫 페이지번호
    private int lastPageNoOnPageList; // 페이지 리스트의 마지막 페이지번호
    private int startNum; // SQL조건에 이용되는 시작 ROW
    private int endNum; // SQL조건에 이용되는 마지막 ROW
    private int listNum; // 해당 페이지의 첫 게시물 번호
    private int pagingSize; // 페이지 영역에 표시할 페이지 개수

    public int getcPage() {
        return cPage;
    }

    public void setcPage(int cPage) {
        this.cPage = cPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalRecordCount() {
        return totalRecordCount;
    }

    public void setTotalRecordCount(int totalRecordCount) {
        this.totalRecordCount = totalRecordCount;
    }

    public int getStartNum() {
        startNum = (getcPage() * getPageSize()) - getPageSize() + 1;
        return startNum;
    }

    public int getEndNum() {
        endNum = getcPage() * getPageSize();
        return endNum;
    }

    public int getTotalPageCount() {
        totalPageCount = ((getTotalRecordCount() - 1) / getPageSize()) + 1;
        return totalPageCount;
    }

    public int getFirstPageNo() {
        return 1;
    }

    public int getLastPageNo() {
        return getTotalPageCount();
    }

    public int getFirstPageNoOnPageList() {
        firstPageNoOnPageList = ((getcPage() - 1) / getPagingSize()) * getPagingSize() + 1;
        return firstPageNoOnPageList;
    }

    public int getLastPageNoOnPageList() {
        lastPageNoOnPageList = 0;
        if (getTotalPageCount() > 0) {
            if (getTotalPageCount() < getPagingSize()) {
                lastPageNoOnPageList = getTotalPageCount();
            } else {
                if (firstPageNoOnPageList + getPagingSize() - 1 > getTotalPageCount()) {
                    lastPageNoOnPageList = getTotalPageCount();
                } else {
                    lastPageNoOnPageList = firstPageNoOnPageList + getPagingSize() - 1;
                }
            }
        }
        return lastPageNoOnPageList;
    }

    public int getListNum() {
        listNum = getTotalRecordCount() - (getcPage() - 1) * getPageSize();
        return listNum;
    }

    public void setListNum(int listNum) {
        this.listNum = listNum;
    }

    public int getPagingSize() {
        return pagingSize;
    }

    public void setPagingSize(int pagingSize) {
        this.pagingSize = pagingSize;
    }
}
