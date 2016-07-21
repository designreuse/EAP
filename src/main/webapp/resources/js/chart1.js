function showChart(number_a,group_s)
{

var Chart1 = echarts.init(document.getElementById('chart1')); 
        var option1 = {
        		//backgroundColor:'#fff',
        	    title : {
        	    	show:false,
        	        text: '实验动物品系分布',
        	        x:'left'
        	    },
        	    tooltip : {
        	        trigger: 'item',
        	        formatter: "{a}<br/>{b} : {c} 种({d}%)"
        	    },
        	    legend: {
        	    	show:false,
        	        x : 'center',
        	        y : 'bottom',
        	        data:number_a
        	    },
        	    calculable : true,
        	    series : [ 
        	        {
        	            name:'品系占比',
        	            type:'pie',
        	            radius : [25, 135],
        	            roseType : 'area',
        	            data: (function(){        	            	 
                            var res = [];
                            for (var len=0;len<number_a.length;len++) {
                            res.push({
                            name: group_s[len],
                            value: number_a[len]
                            });
                            }
                            return res;
                            })()
        	        }
        	    ]
        };
        // 为echarts对象加载数据
		Chart1.setTheme('macarons'); 
        Chart1.setOption(option1); 
        
		window.onresize = function () {
			Chart1.resize();
			
		}
}