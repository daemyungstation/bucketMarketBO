<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
</head>
<body class="popup page-popup" data-menu_group="product" data-menu_subclass="productQnA">
    <div class="modal">
        <div class="modal-wrapper">
            <div class="modal-inner">
                <div class="push-guide instant">
                    <i class="icon"></i>
                    <h2 class="title">
                        <span>거절사유보기 </span>
                    </h2>
                </div>
                <form id="frm" name="frm">
                    <table cellspacing="0" class="table-col table-b">
                        <!-- table -->
                        <colgroup>
                            <col style="width: 15%;" />
                            <col style="width: auto;" />
                            <col style="width: 15%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>승인요청일</th>
                                <th>지원혜택명</th>
                                <th>모델명</th>
                                <th>공급가</th>
                                <th>상태</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <ui:formatDate value="${info.PRD_MST_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss" />
                                </td>
                                <td>
                                    <c:out value="${info.PRD_MST_SPL_NM }" />
                                </td>
                                <td>
                                    <c:out value="${info.PRD_MST_MD }" />
                                </td>
                                <td>
                                    <fmt:formatNumber value="${info.PRD_MST_SPL_PRC }" type="number" />
                                </td>
                                <td>
                                    <c:out value="${Product.STATES[info.PRD_MST_APV_STATE] }" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <table cellspacing="0" class="table-row table-a">
                        <colgroup>
                            <col style="width: 15%;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>승인거절 사유</span>
                                    </label>
                                </th>
                                <td>
                                    <c:out value="${info.PRD_MST_RFS_RSN }" />
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>처리자</span>
                                    </label>
                                </th>
                                <td>
                                    <c:out value="${info.PRD_MST_APV_NM }" />
                                    (
                                    <c:out value="${info.PRD_MST_APV_ID }" />
                                    )/
                                    <ui:formatDate value="${info.PRD_MST_APV_DT }" pattern="yyyy.MM.dd HH:mm:ss" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
                <div class="grid section-button-search">
                    <a href="javascript:self.close();" class="button small">
                        <span>닫기</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/jsp/bo/include/script.jsp"%>
</body>
</html>
