<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<link
	href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
	rel="stylesheet" />
    <script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	

<script>
	$(function() {
		$("#datePicker").datepicker();
	});
</script>

<style type="text/css">
body {
	background-image: url("/6010947-background-images-for-websites.jpg");
}
</style>
</head>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<body bgcolor="">
	<form:form action="/Register" method="POST" modelAttribute="ssnCmd"
		id="form" enctype="multipart/form-data">
		<p style="color: red">
			<form:errors path="/*" />
		</p>
		<br>
		<h1 color="red" align="center">Enter Details</h1>
		<center>${success}</center>
		<h4>${Failes}</h4>
		<table border="1" color="blue" align="center" height="50%" width="50%">
			<tr>
				<td>Enter Name</td>
				<td><form:input path="firstName" /></td>
				<%-- <td><form:errors path="firstName"></form:errors> --%>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><form:input path="lastName" /></td>
				<%-- <td><form:errors path="lastName"></form:errors> --%>
			</tr>
			<tr>
				<td>Date of Birth</td>

				<td><form:input path="dob" id="datePicker" /></td>
			</tr>
 			<tr>
				<td>Phone</td>
				<td><form:input path="phoneNo" /></td>
			</tr>
			<tr>
				<td>Select Photo</td>
				<td><form:input path="photo" type="file" /></td>"
			</tr>
			<tr>
				<td>Gender</td>
				<td><td><form:checkboxes items="${genders}" path="gender" ></form:checkboxes></td></td>
			</tr>
			<tr>
				<td>State</td>
				<td><form:select items="${allstate}" path="state"></form:select></td>
			</tr>
			<tr>
				<td align="center"><input type="reset" value="reset">
				<td><input type="submit" value="Register"></td>
			</tr>
			<tr>
				<td bgcolor="red"><a href="/getAll">GET ALL EMPLOYE DETAILS
				</a></td>
			</tr>
		</table>
	</form:form>

	<script>
		$(document).ready(function() {
			$("#form").validate({
				rules : {
					firstName : 'required',
					lastName : 'required',
					gender : 'required',
					state : 'required',
					photo : 'required',
					dob : 'required'
				},
				messages : {

					firstName : 'First Name required',
					lastName : 'Last Name required',
					dob : 'date of birth required',
					state : 'state required',
					photo : 'Photo required',
					gender : 'gender required'
				}
			});
		});
	</script>
	</body>
</html>
