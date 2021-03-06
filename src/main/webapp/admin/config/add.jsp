<%@page import="com.santiagolizardo.jerba.managers.ConfigManager"%>
<%@page import="com.santiagolizardo.jerba.model.Article"%>
<%@page import="java.util.List"%>
<%
final String[] configTypes = {
	"string",
	"int",
	"date",
	"boolean",
};
pageContext.setAttribute("configTypes", configTypes);
pageContext.setAttribute("configNames", ConfigManager.NAMES);
%>
<%@ include file="../includes/header.jsp" %>

<script type="text/javascript">
$(document).ready(function() {
	$('#names').change(function() {
		$('#name').val($(this).val());
	});
});
</script>

<form action="/AddConfig" method="post">

<legend>Add configuration value</legend>

<div class="form-group">
    <label for="name">Name</label>
    <input class="form-control" type="text" name="name" id="name" required="required" />
    <select id="names">
    <option class="form-control" value="">(reset)</option>
    <c:forEach var="name" items="${configNames}">
    	<option value="${name}">${name}</option>
    </c:forEach>
    </select>
</div>

<div class="form-group">
    <label for="type">Type</label>
    <select class="form-control" name="type" id="type">
    <c:forEach var="type" items="${configTypes}">
    	<option value="${type}">${type}</option>
    </c:forEach>
    </select>
</div>

<div class="form-group">
    <label for="value">Value</label>
    <input type="text" class="form-control" name="value" id="value" />
</div>

<div class="form-actions">
	<input class="btn" type="button" value="Cancel" onclick="window.history.go(-1);" />
	<div class="pull-right"><input class="btn btn-primary" type="submit" value="Add" /></div>
</div>

</form>

<%@ include file="../includes/footer.jsp" %>
