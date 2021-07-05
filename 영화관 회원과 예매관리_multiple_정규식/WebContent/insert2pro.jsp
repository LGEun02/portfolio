<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbcon.jsp" %>
<%
try{
	String dbpasswd = "";
	String [] mo_name = request.getParameterValues("mo_name");
	

	sql="select me_pass from movie_1 where me_id=?";
	ps = con.prepareStatement(sql);
	ps.setString(1, request.getParameter("me_id"));
	rs=ps.executeQuery();
	
	if(rs.next()){
		dbpasswd = rs.getString(1);
		if(dbpasswd.equals(request.getParameter("me_pass"))){
				for(int i=0;i<mo_name.length;i++){
					sql="insert into movie_2 values(?,?,?,?)";
					ps = con.prepareStatement(sql);
					ps.setString(1, request.getParameter("me_id"));
					ps.setString(2, request.getParameter("me_pass"));
					ps.setString(3, mo_name[i]);
					ps.setString(4, request.getParameter("rm_date"));
					ps.executeUpdate();
					}
					%>
					<script>
						alert("영화 예매가 완료되었습니다.");
						location="insert2.jsp";
					</script>
<%			
		}else {
			%>
		<script>
			alert("비밀번호가 틀렸습니다.");
			history.back();
		</script>
		<%}
	}else{
		%>
	<script>
		alert("아이디가 틀렸습니다.");
		history.back();
	</script>
	<%}
	
	
	
	
}catch(Exception e){
	%>
	<script>
		alert("영화 예매가 완료되지 않았습니다.");
		history.back();
	</script>
	<%
}finally{
	try{
		if(rs != null) rs.close();
		if(ps != null) ps.close();
		if(stmt != null) stmt.close();
		if(con != null) con.close();
	}catch(Exception e){
		e.printStackTrace();
	}
}
%>