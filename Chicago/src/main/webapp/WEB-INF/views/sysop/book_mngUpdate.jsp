<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function sendBtn() {
		var f = document.form;
		
		/* var category = $('book_category').val();
		if(category==0 || category.trim()=='') {
			alert('오류야');
			return;
		} */
		
		f.submit();
	};
</script>
<style type="text/css">
.button {
		background-color: white;
		color: black;
		border: 2px solid #505050;
		font-size: 11px;
	}
</style>
</head>
<body>
	<div id="content">
		<div class="container background-white">
			<div class="row margin-vert-40">
				ISBN : ${goods.book_code }
				<hr/>
				<form:form action="book_mngUpdateOk.do" id="form" name="form" method="post" acceptCharset="UTF-8" enctype="multipart/form-data" commandName="goods">
				<input type="hidden" value="${goods.book_code }" name="book_code"/>
					<table>
						<tr>
							<td width="10%"  style="font-size:11px; color:#505050;">제목</td>
							<td colspan="3" style="font-size:11px; color:#505050;"><input type="text" size="50" value="${goods.book_name }"  name="book_name" id="book_name"  style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/></td>
						</tr>
						<tr>
							<td width="10%" style="font-size:11px; color:#505050;">카테고리</td>
							<td width="40%"  style="font-size:11px; color:#505050;">
								<c:choose>
									<c:when test="${goods.book_category == 1 }"><spring:message code="book.cate1"/></c:when>
									<c:when test="${goods.book_category == 2 }"><spring:message code="book.cate2"/></c:when>
									<c:when test="${goods.book_category == 3 }"><spring:message code="book.cate3"/></c:when>
									<c:when test="${goods.book_category == 4 }"><spring:message code="book.cate4"/></c:when>
								</c:choose>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<div style="line-height: 11px; vertical-align: bottom;">
								<input type="radio" value="1" name="book_category" id="book_category" checked="checked"/><spring:message code="book.cate1"/>
								&nbsp;<input type="radio" value="2" name="book_category" id="book_category"/><spring:message code="book.cate2"/>
								&nbsp;<input type="radio" value="3" name="book_category" id="book_category"/><spring:message code="book.cate3"/>
								&nbsp;<input type="radio" value="4" name="book_category" id="book_category"/><spring:message code="book.cate4"/>
								</div>							
							</td>
							<td width="10%"  style="font-size:11px; color:#505050;">저자</td>
							<td width="40%"  style="font-size:11px; color:#505050;"><input type="text" size="20" value="${goods.writer }" name="writer" id="writer" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/></td>
						</tr>
						<tr>
							<td width="10%"  style="font-size:11px; color:#505050;">출판사</td>
							<td width="40%"  style="font-size:11px; color:#505050;"><input type="text" size="20" value="${goods.publisher }" name="publisher" id="publisher" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/></td>
							<td width="10%"  style="font-size:11px; color:#505050;">출판일</td>
							<td width="40%"  style="font-size:11px; color:#505050;"><input type="text" size="20" value="<fmt:formatDate value="${goods.publication }" pattern="yyyy/MM/dd"/>" name="publication" id="publication" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/></td>
						</tr>
						<tr>
							<td width="10%"  style="font-size:11px; color:#505050;">수량</td>
							<td width="40%"  style="font-size:11px; color:#505050;"><input type="text" size="20" value="${goods.amount }" name="amount" id="amount" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/></td>
							<td width="10%"  style="font-size:11px; color:#505050;">절판상태</td>
							<td width="40%"  style="font-size:11px; color:#505050;"> 								
								<c:choose>
									<c:when test="${goods.out_of_print == 1 }">출판</c:when>
									<c:when test="${goods.out_of_print == 0 }">절판</c:when>
								</c:choose>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<div style="line-height: 11px; vertical-align: bottom;">
									<input type="radio" value="1" name="out_of_print" id="out_of_print"/>&nbsp;&nbsp;출판&nbsp;
									<input type="radio" value="0" name="out_of_print" id="out_of_print"/>&nbsp;&nbsp;절판&nbsp;
								</div>
								<!-- <input type="button" value="상태변경" onclick="changeBtn()" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/> -->
							</td>
						</tr>
						<tr>
							<td width="10%"  style="font-size:11px; color:#505050;">페이지</td>
							<td width="40%"  style="font-size:11px; color:#505050;"><input type="text" size="20" value="${goods.pages }" name="pages" id="pages" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/></td>
							<td width="10%"  style="font-size:11px; color:#505050;">가격</td>
							<td width="40%"  style="font-size:11px; color:#505050;"><input type="text" size="20" value="<fmt:formatNumber value="${goods.price }" type="number"/>원" name="price" id="price" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/></td>
						</tr>
						<tr>
							<td width="10%" style="font-size:11px; color:#505050;">Img</td>
							<td colspan="3" style="font-size:11px; color:#505050;">${goods.img }<br/><input type="file" name="upload" id="upload" class="btn total"/></td>
						</tr>
						<tr>
							<td width="10%"  style="font-size:11px; color:#505050;">책소개</td>
							<td colspan="3"><textarea cols="160" rows="3" name="book_content" id="book_content" style="font-size:11px; color:#505050;">${goods.book_content }</textarea></td>
						</tr>
					</table>
					<table>
						<tr>
							<td align="right">
								<input type="button" value="수정" onclick="sendBtn();" class="btn total"/>
								<input type="button" value="취소" onclick="javascript:history.back();" class="btn total"/>
							</td>
						</tr>
					</table>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>