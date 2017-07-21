<%@page import="com.mongodb.client.DistinctIterable"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.client.FindIterable"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page import="com.mongodb.MongoClientURI"%>
<%@page import="com.mongodb.ServerAddress"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
<%@page import="com.mongodb.client.MongoCollection"%>
<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.MongoCursor"%>
<%@page import="static com.mongodb.client.model.Filters.*"%>
<%@page import="com.mongodb.client.result.DeleteResult"%>
<%@page import="static com.mongodb.client.model.Updates.*"%>
<%@page import="com.mongodb.client.result.UpdateResult"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>index</title>

  <meta charset="utf-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>

        #font{font-family:Verdana; border-bottom:solid 1px #0; color:white;}
        #font:hover {color:#5b9bc7; border-bottom:solid 1px #5b9bc7; background-color:transparent;}        
		#fontDropdown{font-size:13px; font-family:Verdana; color:#707b7c;-webkit-transition-duration: 0.5s}
        #fontDropdown:hover{font-size:13px; font-family:Verdana; color:#ecf0f1; background-color:#707b7c; -webkit-transition-duration: 0.5s}

body{overflow-y:scroll; overflow-x:hidden; background-color:#0b2a3d}
.scrollbar{ 
   
    max-height: 200px;
    overflow-x:hidden;
    overflow-y:scroll; 
    min-width: 135px;
    
   }
  #ex4::-webkit-scrollbar { width:8px;background-color:#2c546d;} 
  #ex4::-webkit-scrollbar-thumb { background-color:#abb2b9; border-radius:10px; }
  #ex4::-webkit-scrollbar-thumb:hover { background-color:#aeb6bf; border:1px solid #808b96; }
  #ex4::-webkit-scrollbar-thumb:active { background-color:#aeb6bf; border:1px solid #808b96; }
  
  
  
  
</style>
	
</head>

<body class="scrollbar" id="ex4">
  
<div class="wrapper">
    <div class="row">
      <div class="col-md-12">
            <nav class="navbar" style="background-color:#2e5167">
                <div class="container" style="margin-top:-1px;">
                    <div class="navbar-header" style="margin-left:-60px;">
                        <a class="navbar-brand" href="#" style="font-size:25px; font-family:Verdana; color:white"><span class="fa fa-home" style="font-size:20px; margin-right:10px"></span>DRILLING ANALYTICS</a>
                    </div>
                    
                </div>
                <div>
                        <ul class="nav navbar-nav" style="font-size:15px; margin:-10px 0 -8px 65px; height:59px">
                            <li>
                                <a  id="font" href="test.jsp" style="height:50px; background-color:#2e5167">
                                    <i class="fa fa-bar-chart"></i>
                                    <span> DASHBOARD</span>
                                </a>
                            </li>
                            <li class="dropdown">
                                <a  style="background-color:#2e5167; height:50px" id="font" class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-line-chart"></i>
                                    <span> PATTERNS</span>
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a id="fontDropdown" href="Dashboard.html">GENERATION</a></li>
                                    <li><a id="fontDropdown" href="#">DETECTION</a></li>
                                </ul>
                            </li> 
                            
                       </ul>
                </div>
            </nav>
      </div>
	  
    </div> 

		
    <form method="post">
	<% 
                              
            MongoClient mongoClient = new MongoClient();
            MongoDatabase database = mongoClient.getDatabase("rig_witsml");
            MongoCollection collection = database.getCollection("well");
DistinctIterable<String> documents = collection.distinct("field", String.class).filter(eq("fieldchecked", "no"));                    
        %>
		
    <div class="container-fluid" style="margin:0px 0 0 4px">
      <div class="row">
        <div class="col-md-3">
              <div class="panel" style="background-color:#2c546d; opacity:0.9; width:400px">
                    <div class="panel-heading" style="background-color:#0b1829; height:30px">
                        <h4 class="panel-title" style="margin-top:-3px">
                            <a data-toggle="collapse" href="#collapse1" style="text-decoration:none; color:#f8f9f9; font-size:13px; font-family:Verdana;">FIELDS<span class="fa fa-angle-down pull-right" style="font-size:13px"></span></a>
                        </h4>
                    </div>
                    <div id="collapse1" class="panel-collapse collapse in">
                        <div class="panel-body scrollable-menu scrollbar" id="ex4" style="height:125px; background-color:#2c546d; overflow-y:scroll; opacity:0.7">
                            <ul style="list-style-type:none; color:white; padding-left:0px">
				<%
                                    for (String document : documents) {
                                %>
                                    <li style="font-size:13px"><input type="checkbox"> <% out.println(document); %></li>
                                <%} %>
			</ul>
			</div>
                    </div>
                                               
                    <div class="panel-heading" style="background-color:#0b1829; height:30px">
                        <h4 class="panel-title" style="margin-top:-3px">
                            <a data-toggle="collapse" href="#collapse2" style="text-decoration:none; color:#f8f9f9; font-size:13px; font-family:Verdana;">WELLS<span class="fa fa-angle-down pull-right"></span></a>
                        </h4>
                    </div>
                               
			<div id="collapse2" class="panel-collapse collapse in">
                        <div class="panel-body scrollable-menu scrollbar" id="ex4" style="height:127px; overflow-y:scroll; background-color:#2c546d; opacity:0.7">
                                <%
                                             try{
                                     FindIterable<Document> thedatabaserecords = database.getCollection("well").find();
                                     MongoCursor<Document> welliterator = thedatabaserecords.iterator();
                                      while (welliterator.hasNext()) {
                                           Document doc = welliterator.next();
                                           String wells = doc.getString("nameWell");
                                           String checked = doc.getString("fieldchecked");
                                           if(checked.equals("no") && wells !=null ){    
                                %>	
                                        
                                            <ul style="list-style-type:none; color:white; padding-left:0px">
                                                <li style="font-size:13px"><input type="checkbox" name="welllist" value="<%=wells%>"> <% out.println(wells); %></li>
                                            </ul>
                                            
                                                <%
                                                    }  
                                                }
                    }
                        catch(Exception e){

}
                                                    %>
					</div>
					
				</div>
			

			
		    <div class="panel-heading" style="background-color:#0b1829; height:30px">
                        <h4 class="panel-title" style="margin-top:-3px">
                            <a data-toggle="collapse" href="#collapse3" style="text-decoration:none; color:#f8f9f9; font-size:13px; font-family:Verdana;">HOLE SIZE<span class="fa fa-angle-down pull-right"></span></a>
                        </h4>
                    </div>
				
                                <div id="collapse3" class="panel-collapse collapse in">
                        <div class="panel-body scrollable-menu scrollbar" id="ex4" style="height:127px; overflow-y:scroll; background-color:#2c546d; opacity:0.7">
                                            <%
                                                try{
                                     FindIterable<Document> databaserecords = database.getCollection("data").find();
                                     MongoCursor<Document> dataiterator = databaserecords.iterator();
                                      while (dataiterator.hasNext()) {
                                           Document newdoc = dataiterator.next();
                                           String hole = newdoc.getString("holeSize");
                                           String wchecked = newdoc.getString("holeSelected");
                                           if(wchecked.equals("no") && hole != null){ %>   
                                	
                                            <ul style="list-style-type:none; color:white; padding-left:0px">
                                                <li style="font-size:13px"><input type="checkbox" name="holes" value="<%=hole%>"> <% out.println(hole); %></li>
                                            </ul>
                                             <% 
                                                    }  
                                                }
}
catch(Exception e){

}
                                                    %>
				</div>
				</div>
                </div> 
                                                
                       

            </div>
            
<!--Double arrow left / right-->

        <div class="col-md-1">
          <ul style="list-style-type: none; margin:170px 0 0 38px">
            <li>
              <a href="#" style="list-style-type: none; color:white;"><div class="fa fa-angle-double-right" style="font-size:30px"></div></a>
            </li>
            <br><br>
            <li>
              <a href="#" style="list-style-type: none; color:white;"><div class="fa fa-angle-double-left" style="font-size:30px"></div></a>
            </li>
          </ul>  
        </div>
            
            <div class="col-md-3">
                <div class="panel" style="background-color:#2c546d; opacity:0.9; width:410px">
                    <div class="panel-heading" style="background-color:#0b1829; height:30px">
                        <h4 class="panel-title" style="margin-top:-3px">
                            <a data-toggle="collapse" href="#collapse4" style="text-decoration:none; color:#f8f9f9; font-size:13px; font-family:Verdana;">INTERMEDIATE   <span class="fa fa-angle-down pull-right" style="font-size:13px"></span></a>
                        </h4>
                    </div>
                    <div id="collapse4" class="panel-collapse collapse in">
                        <div class="panel-body scrollable-menu scrollbar" id="ex4" style="min-height:440px; background-color:#2c546d;; opacity:0.7; overflow-y:scroll">
                            <ul style="list-style-type:none; color:white; padding-left:0px; font-size:15px">
                                    
                                    <div class="panel-body" style="border-bottom:solid 1px #bababa">    
                                        <p><b>Field Name :</b></p>
                                         <%
                                     DistinctIterable<String> fdocuments = collection.distinct("field", String.class).filter(eq("fieldchecked", "yes"));
                                    for (String document : fdocuments) {
                                %>
                                    <li style="font-size:13px"><% out.println(document); %></li>
                                <%} %>           
                                    </div>
                                    <div class="panel-body" style="border-bottom:solid 1px #bababa">
                                        <p><b>Well Name :</b></p>
                                            <%
                                             try{
                                                 FindIterable<Document> Thedatabaserecords = database.getCollection("well").find();
                                     MongoCursor<Document> Welliterator = Thedatabaserecords.iterator();
                                      while (Welliterator.hasNext()) {
                                           Document doc = Welliterator.next();
                                           String wells = doc.getString("uidWell");
                                           String checked = doc.getString("wellischecked");
                                           if(checked.equals("yes") && wells !=null ){    
                                %>	
                                        
                                           
                                <p style="font-size:13px"><% out.println(wells); %></p></<br>
                                           
                                             <% 
                                                    }  
                                                }
}
catch(Exception e){

}
                                                    %>
                                    </div>    
                                    <div class="panel-body">    
                                        <p style="font-size:16px; font-weight:bold">Hole Size :</p>
                                          <%
                                             try{
                                                 FindIterable<Document> Ddatabaserecords = database.getCollection("data").find();
                                     MongoCursor<Document> Dataiterator = Ddatabaserecords.iterator();
                                      while (Dataiterator.hasNext()) {
                                           Document doc = Dataiterator.next();
                                           String holes = doc.getString("holeSize");
                                           String checked = doc.getString("holeSelected");
                                           if(checked.equals("yes") && holes !=null ){    
                                %>	
                                        
                                           
                                <p style="font-size:13px"><% out.println(holes); %></p></<br>
                                           
                                             <% 
                                                    }  
                                                }
}
catch(Exception e){

}
                                                    %>
                                        
                                    </div>    
                                        
                                   
                            </ul>
                        </div>
                    </div>
    
                </div>
     
            </div>
            
<!--Double right arrow-->

        <div class="col-md-1" style="margin-right:0px">
          <ul style="list-style-type: none; margin:199px 0 0 39px">
            <li>
              <button type="submit" style="list-style-type: none; color:white; background-color:transparent; outline:none; border:none"  formaction="mnemonicsupdate.jsp"><div class="fa fa-angle-double-right" style="font-size:30px"></div></button>
            </li>
        </div> 

            <div class="col-md-4" style="padding-left:15px">
              <div class="panel" style="background-color:#2c546d; opacity:0.9; width:410px">
                    <div class="panel-heading" style="background-color:#0b1829; height:30px">
                        <h4 class="panel-title" style="margin-top:-3px">
                            <a data-toggle="collapse" href="#collapse5" style="text-decoration:none; color:#f8f9f9; font-size:13px; font-family:Verdana;">MNEMONICS  <span class="fa fa-angle-down pull-right" style="font-size:13px"></span></a>
                        </h4>
                    </div>
                    <div id="collapse5" class="panel-collapse collapse in">
                        <div class="panel-body scrollable-menu scrollbar" id="ex4" style="min-height:440px; background-color:#2c546d; opacity:0.7; overflow-y:scroll">
                            <ul style="list-style-type:none; color:white">
                                
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            
            </div>
        </div>
    
        <div class="row">
      <div class="col-md-4" style="text-align:center">
          <button class="btn btn-sm" style="background-color:#d8dad9; color:black; font-size:13px" formaction="Panelupdate.jsp">Next</button>&nbsp&nbsp&nbsp&nbsp&nbsp
          <button type="submit" style="color:white; font-size:19px; background-color:transparent; outline:none; border:none" class="fa fa-refresh" formaction="refresh.jsp"></button>
      </div>
      <div class="col-md-4" style="text-align:center">
          <button class="btn btn-sm" disabled="disabled" style="background-color:#d8dad9; color:black; font-size:13px">Generate</button>
      </div>
      <div class="col-md-4"></div>
    </div> 
                                                                                                    
          
 </div>    
   
                                              
</form>
        
</body>
</html>
