<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	var idVal = $('#id').val();
	
	$("#id").keyup(function() {
		$.ajax({
			url : "id_check.do",
			type : "post",
			data : $("form").serialize(),
			dataType : 'text',
			success : function(data) {
				$("#idResult").html(data);
			},
			error : function(error) {
				alert(error.statusText);
			}
		});

		return false;
	});
});

</script>
</head>
<body>
	<div id="content">
            <div class="container background-white">
                <div class="row margin-vert-30">
                    <!-- Register Box -->
                    <div class="col-md-6 col-md-offset-3 col-sm-offset-3">
                     <h2 class="margin-bottom-20">회원가입</h2>
		<form:form action="join_ok.do" commandName="memberVO">
		<table>
			<tr>
				<td>아이디</td>
				<td><form:input path="id" maxlength="16" id="id"/>
					<span id="idResult"></span>
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><form:input path="name" maxlength="16" /></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><form:password path="pwd" maxlength="16"/></td>
			</tr>
<%-- 			<tr>
				<td>패스워드 확인</td>
				<td><form:input path="confirmpwd"/></td>
			</tr> --%>
			<tr>
				<td>E메일</td>
				<td><form:input path="email"/></td>
			</tr>
			<tr>
				<td>휴대폰 번호</td>
				<td><form:input path="phone" maxlength="12"/></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><%-- <form:radiobuttons items="${gender }"  path="gender"/> --%>
					<input type="radio" name="gender" value="1" checked="checked">남
					<input type="radio" name="gender" value="2">여
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="가입하기"></td>
			</tr>
		
		</table>
		</form:form>
	</div>
	</div>
	</div>
	</div>

</body>
</html>