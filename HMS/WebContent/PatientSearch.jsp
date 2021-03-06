<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.hms.bean.PatientBean" %>
<%@ page import="javax.servlet.jsp.JspWriter" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HMS</title>

  <!-- Bootstrap core CSS -->
  <link href="Resources/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="Resources/styleBase.css">

</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
    <div class="container">
      <a class="navbar-brand" href="#">Admission Desk Executive</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="http://localhost:8080/HMS/PatientController?source=view">View Patients</a>
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="PatientSearch.jsp">Search Patient</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="PatientCreate.jsp">Create Patient</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="PatientUpdate.jsp">Update Patient</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="PatientDelete.jsp">Delete Patient</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="PatientBilling.jsp">Patient Billing</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Login.html">Logout</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center">
        <h1 class="mt-5">Search Patient</h1>
        <br/>
        
        <div class="row justify-content-center">
        	<form class="form-inline" action="http://localhost:8080/HMS/PatientController" method="post">
        		<input type="hidden" name="source" value="search">
				Patient ID : &nbsp;
			  <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search" name="searchValue" maxlength="9" autofocus required>
			  <button class="btn btn-dark btn-sm my-0" type="submit">Search</button>
			</form>
        </div>
        
        <%
			        	PatientBean patient = (PatientBean)request.getAttribute("patientSearch");
			        	if(patient!=null)
			        	{		
		 %>
        
        <br/>
        <div class="row">
        	<table class="table table-hover">
				  <thead class="thead-dark">
				    <tr>
				      <th scope="col">S.No.</th>
				      <th scope="col">ID</th>
				      <th scope="col">SSNID</th>
				      <th scope="col">Name</th>
				      <th scope="col">Age</th>
				      <th scope="col">Date of Admission</th>
				      <th scope="col">Type of Bed</th>
				      <th scope="col">Address</th>
				      <th scope="col">City</th>
				      <th scope="col">State</th>
				      <th scope="col">Status</th>
				    </tr>
				  </thead>
				  
				  
				  
				  <tbody>
				    <tr>
				      <th scope="row">1</th>
				      <td><%= patient.getPatientId() %></td>
				      <td><%= patient.getPatientSsnid() %></td>
				      <td><%= patient.getName() %></td>
				      <td><%= patient.getAge() %></td>
 				      <td><%= patient.getDateOfAdmission() %></td>
				      <td><%= patient.getTypeOfBed() %></td>
				      <td><%= patient.getAddress() %></td>
				      <td><%= patient.getCity() %></td>
				      <td><%= patient.getState() %></td>
				      <% if(patient.getStatus().equals("A")){ %>
				      <td>Active</td>
				      <% } else { %>
				      <td>Discharged</td>
				      <% } %>
				    </tr>
				    <%
			        	}
				    %>
				  </tbody>
			</table>
        </div>
		
        
        <!-- <p class="lead">Complete with pre-defined file paths and responsive navigation!</p>
        <ul class="list-unstyled">
          <li>Bootstrap 4.5.0</li>
          <li>jQuery 3.5.1</li>
        </ul> -->
      </div>
    </div>
  </div>
  

  <div class="footer">
  	<p class="footer-content">Hospital Management System</p>
  </div>

</body>
</html>