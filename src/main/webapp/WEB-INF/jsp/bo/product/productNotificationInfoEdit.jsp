<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<form id="frm" name="frm" method="post" >
	<input type="hidden" id="WRITE_MODE"  name="WRITE_MODE"    value="${commandMap.WRITE_MODE}" />
	<input type="hidden" id="PRD_NFI_IDX" name="PRD_NFI_IDX" value="${commandMap.PRD_NFI_IDX}" />
	
	<div class="section-title" style="margin: 0 0 20px;"><!-- section-title -->
	    <h3 class="title"><span>품목정보 (<i class="require"><em>필수입력</em></i> 필수항목)</span></h3>
	</div><!-- // section-title -->

	<c:choose>
	   	<c:when test="${commandMap.WRITE_MODE eq 'D'}">
	   		<table class="core">
				<colgroup>
					<col style="width: auto;" />
				</colgroup>
				<tbody>
					<tr>
						<td style="height:100px;">왼쪽 품목명을 클릭하시면 상세내용을 확인하실 수 있습니다.</td>
				    </tr>
				</tbody>
			</table>
	   	</c:when>
	   	<c:otherwise>
	   		<table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
			    <colgroup>
			        <col style="width: 15%;" />
			        <col style="width: auto;" />
			    </colgroup>
			    <tbody>
				    <tr>
				    	<th><span>품목명 <i class="require"><em>필수입력</em></i></span></th>
				    	<td><input type="text" name="PRD_NFI_NM" id="PRD_NFI_NM" class="text large" value="<c:out value='${row.PRD_NFI_NM }' />" maxlength="100"/></td>
				    </tr>
				    <tr>
				    	<th><span>품목 사용여부</span></th>
				    	<td>
				    		<input type="radio" class="radio" name="PRD_NFI_USE_YN" id="PRD_NFI_USE_YN1" value="Y" <c:if test="${row.PRD_NFI_USE_YN eq 'Y' || commandMap.WRITE_MODE eq 'W' }">checked=true</c:if> />
				       	<label for="PRD_NFI_USE_YN1">사용</label>
				       	<input type="radio" class="radio" name="PRD_NFI_USE_YN" id="PRD_NFI_USE_YN2" value="N" <c:if test="${row.PRD_NFI_USE_YN eq 'N' }">checked=true</c:if> />
				       	<label for="PRD_NFI_USE_YN2">미사용</label><br />
				       	<span>※ 미사용으로 체크하면 상품관리에서 표시되지 않습니다.</span>
				    	</td>
				    </tr>
				    <c:choose>
				    	<c:when test="${commandMap.WRITE_MODE eq 'M' }">
				    		<c:set var="num" value="1" />
				    		<c:choose>
								<c:when test="${not empty rowSub}">
	             					<c:forEach var="rowSub" items="${rowSub}" varStatus="status">
										<tr>
											<th><span>카테고리<c:out value="${num}" /></span></th>
								          	<td>
								          		<input type="text" name="PRD_NFI_INFO" id="PRD_NFI_INFO_<c:out value="${num}" />" class="text xlarge" maxlength="100" value="<c:out value='${rowSub.PRD_NFI_INFO }' />" <c:if test="${rowSub.PRD_NFI_INFO_YN eq 'Y'}">disabled=true</c:if> />
								          	</td>
							         	</tr>
										<c:set var="num" value="${num + 1 }" />
									</c:forEach>
								</c:when>
							</c:choose>
							<c:forEach var="i" begin="${num}" end="14" step="1">
								<tr>
									<th><span>카테고리<c:out value="${i}" /></span></th>
									<td>
						        		<input type="text" name="PRD_NFI_INFO" id="PRD_NFI_INFO_<c:out value="${i}" />" class="text xlarge" maxlength="100"  />
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:forEach var="i" begin="1" end="14" step="1">
								<tr>
									<th><span>카테고리<c:out value="${i}" /></span></th>
									<td>
						        		<input type="text" name="PRD_NFI_INFO" id="PRD_NFI_INFO_<c:out value="${i}" />" class="text xlarge" maxlength="100"  />
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table><!-- // table -->
	   	</c:otherwise>
	</c:choose>
	<c:if test="${commandMap.WRITE_MODE ne 'D' }">
		<div class="col-1-2 text-right">
		    <a href="javascript:goProc();" class="button small primary"><span>저장</span></a>	    
		</div>	
	</c:if>
</form>

<%@ include file="/WEB-INF/jsp/bo/include/script.jsp" %>
<script>
$(function(){
	// 폼체크
    $("#frm").validate({
        rules: {
        	PRD_NFI_NM:{required:true} // 품목명
        }
    });

 	// 등록 버튼 클릭 이벤트
    goProc = function () {
		var $frm = $("#frm"); 
        var writeMode = $("#WRITE_MODE").val();
        if($frm.valid()){
            //항목명 등록 전 텍스트박스 활성화
            $("input[name=PRD_NFI_INFO]").each(function(){
                if($(this).attr("disabled")){
                    $(this).attr("disabled",false);
                }
            });
            if (confirm( "저장 하시겠습니까?")) {
                if(writeMode == "W") {
                    $frm.postSubmit($.action.regist());
                } else {
                    $frm.postSubmit($.action.modify());
                }
            }
        }
    };
});
//-->
</script>

