<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
    <%@ page import="java.util.*, java.util.Calendar,  java.util.Date, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <style TYPE="text/css">
             body {
             scrollbar-face-color: #F6F6F6;
             scrollbar-highlight-color: #bbbbbb;
             scrollbar-3dlight-color: #FFFFFF;
             scrollbar-shadow-color: #bbbbbb;
             scrollbar-darkshadow-color: #FFFFFF;
             scrollbar-track-color: #FFFFFF;
             scrollbar-arrow-color: #bbbbbb;
             margin-left:"0px"; margin-right:"0px"; margin-top:"0px"; margin-bottom:"0px";
             }
 
             td {font-family: "돋움"; font-size: 9pt; color:#595959;}
             th {font-family: "돋움"; font-size: 9pt; color:#000000;}
             select {font-family: "돋움"; font-size: 9pt; color:#595959;}
 
 
             .divDotText {
             overflow:hidden;
             text-overflow:ellipsis;
             }
 
            A:link { font-size:9pt; font-family:"돋움";color:#000000; text-decoration:none; }
            A:visited { font-size:9pt; font-family:"돋움";color:#000000; text-decoration:none; }
            A:active { font-size:9pt; font-family:"돋움";color:red; text-decoration:none; }
            A:hover { font-size:9pt; font-family:"돋움";color:red;text-decoration:none;}
 
 
       </style>
</head>
<script type="text/javascript">
	
</script>
<body>
<table width="100%" class="table_content" border="0">
			
	<%
//Calendar cal = Calendar.getInstance();
 
/* String strYear = request.getParameter("year");
String strMonth = request.getParameter("month");
 
int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH);
int date = cal.get(Calendar.DATE);
  */
/* if(strYear != null)
{
  year = Integer.parseInt(strYear);
  month = Integer.parseInt(strMonth);
 
}else{
 
} */
//년도/월 셋팅
/* cal.set(year, month, 1);
 
int startDay = cal.getMinimum(java.util.Calendar.DATE);
int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
int newLine = 0;
 
//오늘 날짜 저장.
Calendar todayCal = Calendar.getInstance();
SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");
int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));
 
 */ 
%>

 

<body>
<div class=wrap>

<form name="calendarFrm" id="calendarFrm" action="" method="post">
<DIV id="content" style="width:712px;">
 
<%-- <table width="100%" border="0" cellspacing="1" cellpadding="1">
<tr>
       <td align ="right">
             <input type="button" onclick="javascript:location.href='<c:url value='/CalendarExam2.jsp' />'" value="오늘"/>
       </td>
 
</tr>
</table> --%>
<!--날짜 네비게이션  -->
<table width="100%" border="0" cellspacing="1" cellpadding="1" id="KOO" bgcolor="#F3F9D7" style="border:1px solid #CED99C">
 
<tr>
<td height="60">
 
      <%--  <table width="100%" border="0" cellspacing="0" cellpadding="0">
       <tr>
             <td height="10">
             </td>
       </tr>
      
       <tr>
             <td align="center" >
                    <a href="<c:url value='/event_month.do' />?year=<%=year-1>&amp;month=<%=month>" target="_self">
                           <b>&lt;&lt;</b><!-- 이전해 -->
                    </a>
                    <%if(month > 0 ){ %>
                    <a href="<c:url value='/event_month.do' />?year=<%=year>&amp;month=<%=month-1>" target="_self">
                           <b>&lt;</b><!-- 이전달 -->
                    </a>
                    <%} else {%>
                           <b>&lt;</b>
                    <%} %>
                    &nbsp;&nbsp;
                    <%=year%>년
                   
                    <%=month+1%>월
                    &nbsp;&nbsp;
                    <%if(month < 11 ){ %>
                    <a href="<c:url value='/event_month.do' />?year=<%=year%>&amp;month=<%=month+1%>" target="_self">
                           <!-- 다음달 --><b>&gt;</b>
                    </a>
                    <%}else{%>
                           <b>&gt;</b>
                    <%} %>
                    <a href="<c:url value='/event_month.do' />?year=<%=year+1%>&amp;month=<%=month%>" target="_self">
                           <!-- 다음해 --><b>&gt;&gt;</b>
                    </a>
             </td>
       </tr>
       </table> --%>
        
 	   <table width="100%" border="0" cellspacing="0" cellpadding="0">
       <tr>
             <td height="10">
             </td>
       </tr>
      
       <tr>
             <td align="center" >
                    <a href="<c:url value='/event_month.do' />?year=${year-1}&amp;month=${month}" target="_self">
                           <b>&lt;&lt;</b><!-- 이전해 -->
                    </a>
                    <c:choose>
                    <c:when test="${(month > 0) }">
                    <a href="<c:url value='/event_month.do' />?year=${year}&amp;month=${month-1}" target="_self">
                           <b>&lt;</b><!-- 이전달 -->
                    </a>
                    </c:when>
                    <c:otherwise>
                    <a href="<c:url value='/event_month.do' />?year=${year-1}&amp;month=11" target="_self">
                           <b>&lt;</b>
                    </c:otherwise>
                    </c:choose>
                    
                   <!--  <b>&lt;</b> -->
                    &nbsp;&nbsp;
                    ${year }년
                   
                    ${month+1}월
                    &nbsp;&nbsp;
                    <c:choose>
                    <c:when test="${(month< 11)}" >
                    <a href="<c:url value='/event_month.do' />?year=${year}&amp;month=${month+1 }" target="_self">
                           <!-- 다음달 --><b>&gt;</b>
                    </a>
                    </c:when>
                    <c:otherwise>
                    <a href="<c:url value='/event_month.do' />?year=${year+1}&amp;month=0" target="_self">
                           <b>&gt;</b>
                    </c:otherwise>
                    </c:choose>
                    <a href="<c:url value='/event_month.do' />?year=${year+1 }&amp;month=${month}" target="_self">
                           <!-- 다음해 --><b>&gt;&gt;</b>
                    </a>
             </td>
       </tr>
       </table>
</td>
</tr>
</table>
<br>
<table border="0" cellspacing="1" cellpadding="1" bgcolor="#FFFFFF">
<THEAD>
<TR bgcolor="#CECECE">
       <TD width='100px'>
       <DIV align="center"><font color="red">일</font></DIV>
       </TD>
       <TD width='100px'>
       <DIV align="center">월</DIV>
       </TD>
       <TD width='100px'>
       <DIV align="center">화</DIV>
       </TD>
       <TD width='100px'>
       <DIV align="center">수</DIV>
       </TD>
       <TD width='100px'>
       <DIV align="center">목</DIV>
       </TD>
       <TD width='100px'>
       <DIV align="center">금</DIV>
       </TD>
       <TD width='100px'>
       <DIV align="center"><font color="#529dbc">토</font></DIV>
       </TD>
</TR>
</THEAD>
<TBODY>
<TR>
<%-- <%
 
//처음 빈공란 표시
for(int index = 1; index < start ; index++ )
{
  out.println("<TD >&nbsp;</TD>");
  newLine++;
}
 
for(int index = 1; index <= endDay; index++)
{
       String color = "";
 
       if(newLine == 0){          color = "RED";
       }else if(newLine == 6){    color = "#529dbc";
       }else{                     color = "BLACK"; };
 
       String sUseDate = Integer.toString(year); 
       sUseDate += Integer.toString(month+1).length() == 1 ? "0" + Integer.toString(month+1) : Integer.toString(month+1);
       sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index) : Integer.toString(index);
 
	   int iUseDate = Integer.parseInt(sUseDate);
      
   //	   String iUseDate =  ;
      
       String backColor = "#EFEFEF";
       if(iUseDate == intToday ) {
             backColor = "#c9c9c9";
       }
       out.println("<TD valign='top' align='left' height='92px' bgcolor='"+backColor+"' nowrap>");
       %>
       	
       <font color='<%=color%>'>
             <%=index %>
       </font>
 
       
       <%
      
       out.println("<BR>");
       out.println(iUseDate);
       out.println("<BR>");
      
      
       //기능 제거 
       out.println("</TD>");
       newLine++;
 
       if(newLine == 7)
       {
         out.println("</TR>");
         if(index <= endDay)
         {
           out.println("<TR>");
         }
         newLine=0;
       }
}
//마지막 공란 LOOP
while(newLine > 0 && newLine < 7)
{
  out.println("<TD>&nbsp;</TD>");
  newLine++;
}
%> --%>
<%-- <c:set var="newLine">0</c:set> --%>
<c:forEach begin="1" end="${startD-1}" step="1">
  <TD >&nbsp;</TD>
  <c:set var="newLine" value="${newLine+1}" />
</c:forEach> 

<c:set var="color" value="${color}"/>
<c:forEach begin="1" end="${endDay}" step="1" var="index">
	<%
		String color ="";
		int index =1;
	%>
	<c:choose>
		<c:when test="${newLine==0}">
		<!-- 	color = "RED"; -->
		<c:set var="color" value="red"/>
		</c:when>
		<c:when test="${newLine==6}">
			<!-- color = "#529dbc"; -->
			<c:set var="color" value="#529dbc"/>
		</c:when>
		<c:otherwise>
			<!-- color = "BLACK"; -->
			<c:set var="color" value="BLACK"/>
		</c:otherwise>
	</c:choose>



       <%-- 

       
       ${sUseDate += Integer.toString(month+1).length() == 1 ? "0" + Integer.toString(month+1) : Integer.toString(month+1)};
       ${sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index) : Integer.toString(index)};
	   
 
 --%>	   
	   <%-- <c:set var="sUseDate">${sUseDate += Integer.toString(month+1).length() == 1 ? "0" + Integer.toString(month+1) : Integer.toString(month+1) }</c:set>
	   <c:set var="sUseDate">${sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index) : Integer.toString(index) }</c:set> --%>	
    <!--   
   //	   String iUseDate =  ;
       -->
       <!-- String backColor = "#EFEFEF"; -->
       <c:set var="iUseDate" value="${iUseDate}"/>
       <c:set var="backColor">#EFEFEF</c:set>
       <c:if test="${iUseDate } == ${intToday }">  
             backColor = "#c9c9c9"
       </c:if>
       <TD valign='top' align='left' height='92px' bgcolor=#EFEFEF nowrap >  
       <c:if test="${index<10}">      
       	   <a href="event_day.do?today=${iUseDate}0${index}" >
		   <c:set var="dataUse" value="${iUseDate}0${index }"/>       
       </c:if>
       <c:if test="${index>=10}">
			<a href="event_day.do?today=${iUseDate}${index}" >       
  			<c:set var="dataUse" value="${iUseDate}${index }"/>
  		</c:if>

       <font color='${color }'>
             ${index }
       </font>  
       <BR>
		  	<%-- <c:set var="count"value="0">	 --%>	  
		  		<c:forEach items="${compareDate }" var="vo"> 
			  		<div style="display:none">
			  		<fmt:formatDate value="${vo.start_day }" pattern="yyyyMMdd"/>
			  		<fmt:formatDate value="${vo.end_day}" pattern="yyyyMMdd"/>
			  		<fmt:parseDate var="dataUse2" value="${dataUse}" pattern="yyyyMMdd"/>
			  		<fmt:formatDate value="${dataUse2 }" pattern="yyyyMMdd"/>		  	
			  		</div>
			  		<c:if test="${vo.stday==dataUse2}">		  			
			  			<%-- <c:set target="${count }" value="${count + 1 }"> 
			  				<c:if test="${count<3}"> --%> 
			  					${vo.event_name }<br>
			  				<%-- </c:if>	
			  			</c:set> --%>
			  		<%-- <c:forEach begin="${vo.start_day}" end="${vo.end_day}">
			  		</c:forEach> --%>	
			  		</c:if>
		  		</c:forEach> 
		<%-- 	</c:set>	   --%>
	  		
  		<%-- <c:out value="${vo.start_day.replace('-','')}"/>
  		<c:out value="${vo.start_day}"/> --%>       
       <BR>      
       </a>
       </TD>
      <%--  ${newLine+=1}--%> 		
      <c:set var="newLine" value="${newLine + 1}" />
       <c:if test="${newLine == 7 }">
       	</TR>
         <c:if test="${index <= endDay}">
         	<TR>
         </c:if>
         <%-- ${newLine }=0; --%>
         <c:set var="newLine" value="${newLine=0}"/>
       </c:if>
       <c:set var="index" value="${index + 1}" />
</c:forEach>
	
	<c:forEach begin="1" end="6" var="abc">
		<c:if test="${newLine == abc}">		
			<TD>&nbsp;</TD>
			<%-- ${newLine+=1 } --%>
			<c:set var="newLine" value="${newLine + 1}"/>
		</c:if>
	</c:forEach>


</TR>
 
</TBODY>
</TABLE>
</DIV>
</form>
			


</div>

		

				<div class="clearfix margin-bottom-10"></div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>