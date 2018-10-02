var date = new Date(); 
var year = date.getFullYear(); 
var month = new String(date.getMonth()+1); 
var day = new String(date.getDate()); 
// 한자리수일 경우 0을 채워준다. 
if(month.length == 1){ 
  month = "0" + month; 
} 
if(day.length == 1){ 
  day = "0" + day; 
} 

	$(document).ready(function() {
		var code="";
		$('#calendar').fullCalendar({
			defaultDate: date,
			editable: false,
			eventLimit: false, // allow "more" link when too many events
			events: function(start,end,timezone,callback){
		    	  $.ajax({
		        	  type : 'GET',
		        	  url : '/exhibition/performance/getPerformance.do',
		        	  dataType : 'json',
		        	  success : function(data){
		        		  var events = [];
		        		 
		        		  $.each(data.list,function(index,item){
		        			  code = item.code;
		        			  if(code==1){
		        				  events.push({title : "박람회"+"("+code+")", 
		        				  			start : item.start1,
		        				  			end : item.end1,
		        				   			url : "/exhibition/main/index.do"
		        			  		    });
		        			  }else if(code==2){
		        				  events.push({title : "연극"+"("+code+")", 
	        				  			start : item.start1,
	        				  			end : item.end1,
	        				   			url : "/exhibition/member/writeForm.do"
	        			  		    });
		        			  }
		       		  	  });
		        		  callback(events);
		        	  }
		        	  
		        	}); 
		      }
			
		});
		
	});
