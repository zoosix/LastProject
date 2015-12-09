
/**
 * Sand-Signika theme for Highcharts JS
 * @author Torstein Honsi
 */

// Load the fonts
Highcharts.createElement('link', {
   href: '//fonts.googleapis.com/css?family=Signika:400,700',
   rel: 'stylesheet',
   type: 'text/css'
}, null, document.getElementsByTagName('head')[0]);

// Add the background image to the container
Highcharts.wrap(Highcharts.Chart.prototype, 'getContainer', function (proceed) {
   proceed.call(this);
   this.container.style.background = 'url(http://www.highcharts.com/samples/graphics/sand.png)';
});


Highcharts.theme = {
   colors: ["#f45b5b", "#8085e9", "#8d4654", "#7798BF", "#aaeeee", "#ff0066", "#eeaaee",
      "#55BF3B", "#DF5353", "#7798BF", "#aaeeee"],
   chart: {
      backgroundColor: null,
      style: {
         fontFamily: "Signika, serif"
      }
   },
   title: {
      style: {
         color: 'black',
         fontSize: '16px',
         fontWeight: 'bold'
      }
   },
   subtitle: {
      style: {
         color: 'black'
      }
   },
   tooltip: {
      borderWidth: 0
   },
   legend: {
      itemStyle: {
         fontWeight: 'bold',
         fontSize: '13px'
      }
   },
   xAxis: {
      labels: {
         style: {
            color: '#6e6e70'
         }
      }
   },
   yAxis: {
      labels: {
         style: {
            color: '#6e6e70'
         }
      }
   },
   plotOptions: {
      series: {
         shadow: true
      },
      candlestick: {
         lineColor: '#404048'
      },
      map: {
         shadow: false
      }
   },

   // Highstock specific
   navigator: {
      xAxis: {
         gridLineColor: '#D0D0D8'
      }
   },
   rangeSelector: {
      buttonTheme: {
         fill: 'white',
         stroke: '#C0C0C8',
         'stroke-width': 1,
         states: {
            select: {
               fill: '#D0D0D8'
            }
         }
      }
   },
   scrollbar: {
      trackBorderColor: '#C0C0C8'
   },

   // General
   background2: '#E0E0E8'
   
};

// Apply the theme
Highcharts.setOptions(Highcharts.theme);

/**
 * Grid-light theme for Highcharts JS
 * @author Torstein Honsi
 */

// Load the fonts
Highcharts.createElement('link', {
   href: '//fonts.googleapis.com/css?family=Dosis:400,600',
   rel: 'stylesheet',
   type: 'text/css'
}, null, document.getElementsByTagName('head')[0]);

Highcharts.theme = {
   colors: ["#7cb5ec", "#f7a35c", "#90ee7e", "#7798BF", "#aaeeee", "#ff0066", "#eeaaee",
      "#55BF3B", "#DF5353", "#7798BF", "#aaeeee"],
   chart: {
      backgroundColor: null,
      style: {
         fontFamily: "Dosis, sans-serif"
      }
   },
   title: {
      style: {
         fontSize: '16px',
         fontWeight: 'bold',
         textTransform: 'uppercase'
      }
   },
   tooltip: {
      borderWidth: 0,
      backgroundColor: 'rgba(219,219,216,0.8)',
      shadow: false
   },
   legend: {
      itemStyle: {
         fontWeight: 'bold',
         fontSize: '13px'
      }
   },
   xAxis: {
      gridLineWidth: 1,
      labels: {
         style: {
            fontSize: '12px'
         }
      }
   },
   yAxis: {
      minorTickInterval: 'auto',
      title: {
         style: {
            textTransform: 'uppercase'
         }
      },
      labels: {
         style: {
            fontSize: '12px'
         }
      }
   },
   plotOptions: {
      candlestick: {
         lineColor: '#404048'
      }
   },


   // General
   background2: '#F0F0EA'
   
};

// Apply the theme
Highcharts.setOptions(Highcharts.theme);
$(function() {
	$(".cname").click(function(e) {
		var cname1=$(".symbol", this).val();
		var cname2=$(this).text().trim();
		
		var now = new Date();
	    var year= now.getFullYear();
	    var month = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
	    var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();

		$(function () {
			$.getJSON("https://query.yahooapis.com/v1/public/yql?q=" + encodeURIComponent("select Date, Open, High, Low, Close, Volume from csv where url='http://real-chart.finance.yahoo.com/table.csv?s="+cname1+"&d="+month+"&e="+day+"&f="+year+"&g=d&a=2&b=27&c=2012&ignore=.csv' and columns='Date,Open,High,Low,Close,Volume,Adj Close'") + "&format=json&callback=?", function (data) {
			
			    console.log(data.query.results);
			    var data = data.query.results.row;
			    data = data.splice(1, data.length);
			    console.log(data);
			
			    var processedData = [],
			    	volumeData=[],
			    	 groupingUnits = [[
			    	                   'week',                         // unit name
			    	                   [1]                             // allowed multiples
			    	               ], [
			    	                   'month',
			    	                   [1, 2, 3, 4, 6]
			    	               ]];
			    $(data).each(function(index, value) {
			       //console.log(Date.parse(value.Date).getTime());
			       //console.log(Date.parse(value.Date));
			        processedData.push([Date.parse(value.Date), parseFloat(value.Open), parseFloat(value.High), parseFloat(value.Low), parseFloat(value.Close)]);
			        volumeData.push([Date.parse(value.Date),parseFloat(value.Volume)]);
			    });
			    processedData = processedData.reverse();
			    volumeData=volumeData.reverse();
			    //console.log(processedData);
			
			    // Create the chart
			    $('#stock_chart').highcharts('StockChart', {
			        rangeSelector : {
			            selected : 1
			        },
			
			        title : {
			            text : cname2+' Stock Price'
			        },
			        
			        yAxis: [{
			            labels: {
			                align: 'right',
			                x: -3
			            },
			            title: {
			                text: 'OHLC'
			            },
			            height: '60%',
			            lineWidth: 2
			        }, {
			            labels: {
			                align: 'right',
			                x: -3
			            },
			            title: {
			                text: 'Volume'
			            },
			            top: '65%',
			            height: '35%',
			            offset: 0,
			            lineWidth: 2
			        }],/*
			        series : [{
			            type : 'candlestick',
			            name : 'GOOG Stock Price',
			            data : processedData,
			            tooltip: {
			                valueDecimals: 2
			            }
			        }]
			        */
			        scrollbar : {
			            enabled : false
			        },
			        series: [{
			            type: 'candlestick',
			            name: cname2,
			            data: processedData,
			            dataGrouping: {
			                units: groupingUnits
			            }
			        }, {
			            type: 'column',
			            name: 'Volume',
			            data: volumeData,
			            yAxis: 1,
			            dataGrouping: {
			                units: groupingUnits
			            }
			        }]
			        
			    });
			});
		});
	});
});

$(function () {
	$(".all").click(function(){
		var val=$(this).attr('id');
		$.ajax({
			type:"GET",
			url:"category.do",
			data:"cate="+val,
			success : function(result){
				$('#updown2').html(result);
			},
			error : function(xhr, status,eror) {
				alert("�����߻�");
			}
		})
	});
	$(".abtn").click(function(){
		var a=$('.abtn').val();
		var no=3;
		alert(a);
		$.ajax({
	           type:"GET",
	           url:"test.do",
	           data:"no="+no,
	           success : function(result) {
	                 // ����� ���������� �̷������ �� �� �Լ��� Ÿ�� �ȴ�.
	                 // TODO
	                 $('.aaa').html(result);
	           },
	           error : function(xhr, status, error) {
	                 alert("�����߻�");
	           }
	     });
	});
	var left_name, right_name;
	$(".cname").mousedown(function(e) {
		var str=$(this).text().trim();
		var cname=str.substr(0,1);
		var lastPrice=$('.lastPrice', this).val();
		var open=$('.open', this).val();
		var marketTotal=$('.marketTotal', this).val();
		var previousClose=$('.previousClose', this).val();
		var dayLow=$('.dayLow', this).val();
		var dayHigh=$('.dayHigh', this).val();
		var week52Low=$('.week52Low', this).val();
		var week52High=$('.week52High', this).val();
		if(cname=="0"){
			cname=str+".KS";
		}else{
			cname=str;
		}
		if(e.which==1){
			left_name=$(".symbol", this).val();
			$("#com1").val(left_name);
			$("#compare1").text(cname);
			$("#com1_more a").attr("href","company.do?cname1="+$(".symbol", this).val()+"&cname2="+cname);
			$("#com1_detail .lastPrice2").text(lastPrice);
			$("#com1_detail .open2").text(open);
			$("#com1_detail .marketTotal2").text(marketTotal);
			$("#com1_detail .previousClose2").text(previousClose);
			$("#com1_detail .dayLow2").text(dayLow);
			$("#com1_detail .dayHigh2").text(dayHigh);
			$("#com1_detail .week52Low2").text(week52Low);
			$("#com1_detail .week52High2").text(week52High);
		}
		if(e.which==3){
			right_name=$(".symbol", this).val();
			$("#com2").val(right_name);
			$("#compare2").text(cname);
			$("#com2_more a").attr("href","company.do?cname1="+$(".symbol", this).val()+"&cname2="+cname);
			$("#com2_detail .lastPrice2").text(lastPrice);
			$("#com2_detail .open2").text(open);
			$("#com2_detail .marketTotal2").text(marketTotal);
			$("#com2_detail .previousClose2").text(previousClose);
			$("#com2_detail .dayLow2").text(dayLow);
			$("#com2_detail .dayHigh2").text(dayHigh);
			$("#com2_detail .week52Low2").text(week52Low);
			$("#com2_detail .week52High2").text(week52High);
		}
	});
	$("#compare_btn").click(function() {
		var left=$("#com1").val()
		//alert(left);
		var right=$("#com2").val()
		//alert(right);
		var seriesOptions = [],
	    seriesCounter = 0,
	    names = [left, right],
	    // names = ['AMZN', 'AAPL', 'MSFT'],

	    // create the chart when all data is loaded
	    createChart = function () {
			$('#stock_compare').highcharts('StockChart', {
				chart: {
					//plotBorderWidth: 1,
					zoomType: 'x',
					backgroundColor: null
				},
		            /* data: {
		                csv: csv
		            }, */
	
	            title: {
	                text: null
	            },
			        
				 
		        rangeSelector : {
		            selected : 4
		        },/* 
			        subtitle: {
			            text: 'Source: WorldClimate.com'
			        }, */
			      
		        xAxis: {
	                tickInterval: 7 * 24 * 3600 * 1000, // one week
	                tickWidth: 0,
	                gridLineWidth: 1,
	                labels: {
	                    align: 'left',
	                    x: 3,
	                    y: -3
	                }
	            },  yAxis: [{ // left y axis
	                title: {
	                    text: null
	                },
	                labels: {
	                    align: 'left',
	                    x: 3,
	                    y: 16,
	                    format: '{value:.,0f}'
	                },
	                showFirstLabel: false
	            }, { // right y axis
	                linkedTo: 0,
	                gridLineWidth: 0,
	                opposite: true,
	                title: {
	                    text: null
	                },
	                labels: {
	                    align: 'right',
	                    x: -3,
	                    y: 16,
	                    format: '{value:.,0f}'
	                },
	                showFirstLabel: false
	            }],
	            legend: {
	                align: 'left',
	                verticalAlign: 'top',
	                y: 20,
	                floating: true,
	                borderWidth: 0
	            },
	
	            tooltip: {
	                shared: true,
	                crosshairs: true
	            },
	
	             plotOptions: {
	                series: {
	                    cursor: 'pointer',
	                    point: {
	                        events: {
	                            click: function (e) {
	                                hs.htmlExpand(null, {
	                                    pageOrigin: {
	                                        x: e.pageX || e.clientX,
	                                        y: e.pageY || e.clientY
	                                    },
	                                    headingText: this.series.name,
	                                    maincontentText: Highcharts.dateFormat('%A, %b %e, %Y', this.x) + ':<br/> ' +
	                                        this.y + ' visits',
	                                    width: 200
	                                });
	                            }
	                        }
	                    },
	                    marker: {
	                        lineWidth: 4
	                        
	                    }
	                }
	            },
				series: seriesOptions 
			});
		};
		
		$.each(names, function (i, name) {
			var now = new Date();
		    var year= now.getFullYear();
		    var month = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
		    var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
			$.getJSON("https://query.yahooapis.com/v1/public/yql?q="+encodeURIComponent("select Date, Open, High, Low, Close, Volume from csv where url='http://real-chart.finance.yahoo.com/table.csv?s="+name+"&d="+month+"&e="+day+"&f="+year+"&g=d&a=2&b=27&c=2015&ignore=.csv' and columns='Date,Open,High,Low,Close,Volume,Adj Close'") + "&format=json&callback=?", function (data) {
		    	//console.log(data.query.results);
		    	var data = data.query.results.row;
		    	data = data.splice(1, data.length);
		    	//console.log(data);
	
		    	var processedData = [];
		    	 
		    	$(data).each(function(index, value) {
		        	processedData.push([Date.parse(value.Date),  parseFloat(value.Close)]);
		    	});
		    	processedData = processedData.reverse();
		    
		    	seriesOptions[i] = {
	               name: name,
	               data: processedData,
	                lineWidth: 4/* ,
	               marker: {
	                   radius: 4
	               }  */
	           };
	           seriesCounter += 1;
	           if (seriesCounter === names.length) {
	               createChart();
	           }
		    
			});
		});
	});
});
