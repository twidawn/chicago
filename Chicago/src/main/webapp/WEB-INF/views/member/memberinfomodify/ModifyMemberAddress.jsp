<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta >
<title>Made By ChoDing!!</title>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/mypage_css/memberinfo.css" rel="stylesheet" />

<!-- Theme skin -->
<link href="skins/default.css" rel="stylesheet" />

<script src="js/animate.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/custom.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.fancybox-media.js"></script>
<script src="js/jquery.fancybox.pack.js"></script>
<script src="js/jquery.flexslider.js"></script>
<script src="js/jquery.js"></script>
<script src="js/validate.js"></script>
<script src="js/google-code-prettify/prettify.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script type="text/javascript">
function send(){
	var f=document.frm;
		
	if(f.USER_ID.value=="" && f.USER_ID.value!="${id}"){
		alert("올바른 아이디가 아닙니다!");
		f.USER_ID.focus();
		return;
	}
		
	if(f.USER_PWD.value=="" && f.USER_PWD.value!="${pwd}"){
		alert("올바른 비밀번호가 아닙니다!");
		f.USER_PWD.focus();
		return;
	}
		
	if(f.USER_C_PWD.value==""){
		alert("탈퇴를 위해 올바른 비밀번호를 다시 한번 입력하십시오!");
		f.USER_C_PWD.focus();
		return;
	}
	
	if(f.USER_PWD.value!=f.USER_C_PWD.value){
		alert("비밀번호가 일치하지 않습니다!");
		f.USER_PWD.focus();
		return;
	}
	
	if(f.INPUT_CONFIRM.value!="회원탈퇴"){
		alert("탈퇴확인문장이 일치하지 않습니다!");
		f.INPUT_CONFIRM.focus();
		return;
	}
	
	f.submit();
	
}
</script>

</head>
<body>
	<!-- Modify Member PASSWORD Member -->
	<div class="OutlineForm">
		<div class="MiddlelineSettingForm">
			<div class="HeadlineSettingForm">
				<div class="Headline">
					<spring:message code="memberPasswordModify.header"/>
				</div>
				<div class="Notification">
					<ul class="notcont">
						<li><spring:message code="memberPasswordModify.notFy1"/></li>
						<li><spring:message code="memberPasswordModify.notFy2"/></li>
					</ul>
				</div>
			</div>
			<div class="MemberSettingForm">
				<div class="ModifyMemberPwdHeadlineForm">
					<label class="ModifyMemberPwdHeadline"><spring:message code="memberPasswordModify.modifyPasswordheader"/></label>
				</div>
				<div class="InnerBox">
					<div id="ModifyMemberPassword-Box">
						<%-- <form:form action="modifymemberpwd_ok.do" commandName="MemberVO"> --%>
						<%-- <form:hidden path=""/> --%>
							<fieldset>
								<div class="ModifyMemberPwd">
									<dl class="mmp">
										<!-- Input Current PASSWORD -->
										<dt>
										
													<%-- <td><form:input path="id" maxlength="16"/></td> --%>
			</tr>
			<tr>
				<td>이름</td>
				<%-- <td><form:input path="name" maxlength="16"/></td> --%>
			</tr>
			<tr>
				<td>패스워드</td>
				<%-- <td><form:password path="pwd" maxlength="16"/></td> --%>
			</tr>
										
										
											<label for="USER_PWD"><spring:message code="memberPasswordModify.CurrentPassword"/></label>
										</dt>
										<dd>
											<%-- <form:password path="" maxlength="15"/> --%>
										</dd>
										
										<!-- Input New PASSWORD -->
										<dt>
											<label for="USER_NewPWD"><spring:message code="memberPasswordModify.NewPassword"/></label>
										</dt>
										<dd>
											<%-- <form:password path="" maxlength="15"/> --%>
										</dd>
										
										<!-- Input Confirm New PASSWORD -->
										<dt>
											<label for="USER_C_NewPWD"><spring:message code="memberPasswordModify.ConfirmNewPassword"/></label>
										</dt>
										<dd>
											<%-- <form:password path="" maxlength="15"/> --%>
										</dd>
										
									</dl>
								</div>
								
								<!-- OK, Cancel Button -->
								<div>
									<%-- <form:button ><spring:message code="memberPasswordModify.btOk"/></form:button> --%>
									<%-- <form:button ><spring:message code="memberPasswordModify.btCancel"/></form:button> --%>
								</div>
								
							</fieldset>
						<%-- </form:form> --%>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>