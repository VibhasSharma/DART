<%@page import="com.mongodb.BasicDBObject"%>
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
<title>Template</title>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet/less" href="less/sidebar.less">
  <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

<style>
            *{margin:0px}
                    
                    /* Chevron buttons */
			body{text-align:center}
			.btn 
			{ 
                            margin-top: 25px; margin-left:30px; border-top-color:#2874a6; border-bottom-color:#2874a6;
                        }
			.btn-arrow-right 
			{
				position: relative;
				padding-left: 28px;
				padding-right: 18px;
                                background-color:#2874a6;
			}
			.btn-arrow-right:before,
			.btn-arrow-right:after,
			.btn-arrow-left:before,
			.btn-arrow-left:after 
			{ 
				content:"";
				position: absolute;
				top: 5px; 
				width: 22px; 
				height:     22px; 
				background: inherit; 
				border: #2874a6; 
				border-left-color: transparent; 
				border-bottom-color: transparent; 
				border-radius: 0px 4px 0px 0px; 
				-webkit-border-radius: 0px 4px 0px 0px;
			}
			
			.btn-arrow-right:before,.btn-arrow-right:after 
			{
				transform: rotate(45deg); 
				-webkit-transform: rotate(45deg);
			}
			.btn-arrow-left:before,.btn-arrow-left:after 
			{
				transform: rotate(225deg); 
				-webkit-transform: rotate(225deg);
			}
			.btn-arrow-right:before,.btn-arrow-left:before 
			{ 
				left: -11px;
			}
			.btn-arrow-right:after,.btn-arrow-left:after 
			{ 
				right: -11px;
			}
			.btn-arrow-right:after,.btn-arrow-left:before 
			{ 
				z-index: 1;
			}
			.btn-arrow-right:before,.btn-arrow-left:after 
			{ 
				background-color: #0b2a3d;
			}
	
			#table{padding-top:30px; font-size:11px; text-align:justify; color:#666;}
                        #StageGate{padding-bottom:18px; padding-bottom:3px; text-align:center}
			
	/*navigation*/		


body 
{
  margin: 0px;
  padding: 0px;
  background-color:#2e5167;
}

#promotebtn{width:80px; height:34px; border-radius:4px; background-color:#d8dad9; color:black; border-right-color:#898989; border-bottom-color:#898989; font-size:13px}
#navHeading{padding-left:10px; padding-bottom:4px; font-family:verdana; font-size:23px}
#navHeading a{text-decoration:none}

/*Top navigation styling*/
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

    <script>
	function sizeSelect100()
	{
		document.getElementById("demo").innerHTML="Well of size 100 selected";
	}
	
	function sizeSelect50()
	{
		document.getElementById("demo").innerHTML="Well of size 50 selected";
	}
	
	function sizeSelect20()
	{
		document.getElementById("demo").innerHTML="Well of size 20 selected";
	}
	
	function sizeSelect10()
	{
		document.getElementById("demo").innerHTML="Well of size 10 selected";
	}
	
	function backgroundColor(color)
	{
		document.getElementById("click").style.background=color;
	}
	
	function myFunc2()
	{
		document.getElementById("01").style.color="red";
	}
        function myFunc3()
	{
        window.location = "test.jsp";
        }
        
        function toggle(source) 
        {
        checkboxes = document.getElementsByName('values');
        for(var i=0, n=checkboxes.length;i<n;i++) 
            {
                checkboxes[i].checked = source.checked;
            }
        }
        
       function goma()
       {
           window.location = 'DisplayPromoted.jsp';
       }

       function goUN()
       {
           window.location = 'DisplayPromoted1.jsp'; 
       }
       function goHM()
       {
           window.location = 'DisplayPromoted2.jsp'; 
       }
       function goPG()
       {
           window.location = 'DisplayPromoted3.jsp'; 
       }
  </script>
	
	
</head>

<body style="overflow:hidden">
    
    <% long count,count1,count2,count3,count4 = 0;
            long total = 0;
             try 
             {
                MongoClient mongoClient = new MongoClient();
                MongoDatabase database = mongoClient.getDatabase("rig_witsml");
                MongoCollection collection = database.getCollection("well");
                BasicDBObject searchQuery = new BasicDBObject().append("flag", 0);
                BasicDBObject searchQuery1 = new BasicDBObject().append("flag", 2);
                BasicDBObject searchQuery2 = new BasicDBObject().append("flag", 4);
                BasicDBObject searchQuery3 = new BasicDBObject().append("flag", 6);
                BasicDBObject searchQuery4 = new BasicDBObject().append("flag", 8);
                count = collection.count(searchQuery);
                count1 = collection.count(searchQuery1);
                count2 = collection.count(searchQuery2);
                count3 = collection.count(searchQuery3);
                count4 = collection.count(searchQuery4);
                total = collection.count();
        %>
        
        
        
        <div class="row">
      <div class="col-md-12">
            <nav class="navbar" style="background-color:#2e5167">
                <div class="container" style="margin-top:-1px;">
                    <div class="navbar-header" style="margin-left:-64px;">
                        <a class="navbar-brand" href="#" style="font-size:25px; font-family:Verdana; color:white"><span class="fa fa-home" style="font-size:20px; margin-right:10px"></span>DRILLING ANALYTICS</a>
                    </div>
                    
                </div>
                <div>
                        <ul class="nav navbar-nav" style="font-size:15px; margin:-10px 0 -8px 65px; height:59px">
                            <li>
                                <a  id="font" href="#" style="height:50px; background-color:#2e5167">
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
                                    <li><a id="fontDropdown" href="main pattern.jsp">GENERATION</a></li>
                                    <li><a id="fontDropdown" href="#">DETECTION</a></li>
                                </ul>
                            </li> 
                            
                       </ul>
                </div>
            </nav>
      </div>
	  
    </div>   
        
        
        

<div id="StageGate">    
    <button type="button" class="btn btn-info btn-arrow-right" onclick="myFunc3()">Data Loading</button>
    <button id="click" type="button" class="btn btn-info btn-arrow-right" onclick="goma()" >Mnemonic Harmonization</button>
    <button type="button" class="btn btn-info btn-arrow-right" onclick="goUN()" >Unit Normalization</button>
    <button type="button" class="btn btn-info btn-arrow-right" onclick="goHM()">Data Aggregation</button>
    <button type="button" class="btn btn-info btn-arrow-right" onclick="goPG()" style="background-color:#1d79fd">Pattern Generation</button>
</div>	
    
<div class="row" style="padding-bottom:0px; margin-top:0px; color:white">
    <div class="col-sm-1"></div>
    <div class="col-sm-2" style="padding-left:150px"><%out.println(count);%>/ <%out.print(total);%></div>
    <div class="col-sm-2" style="padding-left:90px"><%out.println(count1);%>/ <%out.print(total);%></div>
    <div class="col-sm-2" style="padding-left:70px"><%out.println(count2);%>/ <%out.print(total);%></div>
    <div class="col-sm-2" style="padding-right:45px"><%out.println(count3);%>/ <%out.print(total);%></div>
    <div class="col-sm-2" style="padding-right:110px"><%out.println(count4);%>/ <%out.print(total);%></div>
    
</div>        
    
	
        <div class="row">
             <form method="post">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                <p id="demo" style="padding-top:12px; font-size:11px"></p>
            </div>
            
            <div class="col-sm-4"> 
                 <div class="btn-sm">
                    
                     <button type="button" class="btn-sm dropdown-toggle" data-toggle="dropdown" style="background-color:#d8dad9; color:black; font-size:13px">Well Size
			<span class="caret"></span>
                    </button>
                     <ul class="dropdown-menu" role="menu">
			<li class="dropdown-header">Select the well size</li>
			<li class="divider"></li>
			<li><a href="#" onClick="sizeSelect100()">100</a></li>
			<li><a href="#" onClick="sizeSelect50()">50</a></li>
			<li><a href="#" onClick="sizeSelect20()">20</a></li>
			<li><a href="#" onClick="sizeSelect10()">10</a></li>
                    </ul>
                  
                    <button id="promotebtn" type="submit" class="btn-sm" name="promote">Promote</button>
                    <button type="submit" class="btn-sm" name="demote" formaction="Demote3.jsp" style="background-color:#d8dad9; color:black; font-size:13px">Demote</button> 
                    <button type="button" class="btn-sm glyphicon glyphicon-refresh" onClick="window.location.reload();" style="background-color:#d8dad9; color:black; font-size:13px"></button>   
                    <button type="button" class="btn-sm" onclick="window.location = 'v5.jsp';" style="background-color:#d8dad9; color:black; font-size:13px">View All</button>					
					
                 </div>       
	</div>
</div>
</div>
      
        <div class="row" id="table" style="margin-top:0px; padding-top:10px">

        
        <%

           FindIterable<Document> mydatabaserecords = database.getCollection("well").find();
            MongoCursor<Document> iterator = mydatabaserecords.iterator();
           
       %>
       
        
        <div class="col-sm-12" style="margin-top:0px; padding-top:0px">
            
        <div class="container-fluid">    
        <table class="table table-bordered table-condensed" style="margin-top:0px; font-size:12px; background-color:#3383b8; opacity:0.9">
            <tr style="background-color:#22597d; color:white">
                <th width= "3%" style="padding-left:14px"><input type="checkbox" onClick="toggle(this)"></input></th>
                <th class="col-sm-2"><a href="#" style="color:#e4e4e4">Well Name</a></th>
                <th class="col-sm-1">Country</th>
                <th class="col-sm-1">State</th>
                <th class="col-sm-2">Operator</th>
                <th class="col-sm-1">Region</th>
                <th class="col-sm-1">Status</th>
                <th class="col-sm-3">Purpose</th>
            </tr>
            
        <%
        while (iterator.hasNext()) {
            Document doc = iterator.next();
            String country = doc.getString("country");
            String state = doc.getString("state");
            String Operator = doc.getString("operator");
            String name = doc.getString("nameWell");
            String region = doc.getString("region");
            String statusWell = doc.getString("statusWell");
            String purposeWell = doc.getString("purposeWell");
            Integer flag = doc.getInteger("flag");
            if(flag == 8){
        %>
            <tr class = "default" style="color:#e4e4e4">
                
                <td width="3%" align="center">  
               <input type="checkbox" name="values" value=<%=name%> />
                 </td>
               <td class="col-sm-2"><% out.println(name);%></td>
                <td class="col-sm-1"><% out.println(country);%></td>
                <td class="col-sm-1"><% out.println(state);%></td>
                <td class="col-sm-2"><% out.println(Operator);%></td>
                <td class="col-sm-1"><% out.println(region);%></td>
                <td class="col-sm-1"><% out.println(statusWell);%></td>
                <td class="col-sm-3"><% out.println(purposeWell);%></td>
            </tr> <%
}
    }
%>
         
    
            </table>
        </div>
        </div>
    </div>
            <%
}
catch (Exception e1) {
    // TODO Auto-generated catch block
    e1.printStackTrace();
}
%>
</form>	
</form>
</body>
</html>
