        // 路径配置
        require.config({
            paths: {
                echarts: 'http://echarts.baidu.com/build/dist'
            }
        });
        
        // 使用
        require(
            [
                'echarts',
                'echarts/chart/bar', // 使用柱状图就加载bar模块，按需加载
                'echarts/chart/line',
                'echarts/chart/pie'
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart1 = ec.init(document.getElementById('main1')); 
                var myChart2 = ec.init(document.getElementById('main2')); 
                var myChart3 = ec.init(document.getElementById('main3')); 
                var myChart4 = ec.init(document.getElementById('main4')); 
                var myChart5 = ec.init(document.getElementById('main5')); 
                
                var option1 = {
                    title : {
                        text: '广告版出示前竞争品牌广告到达状况',
                        subtext: ''
                    },
                    tooltip : {
                        trigger: 'axis'
                    },
                    legend: {
                        data:['2013年', '2014年']
                    },
                    toolbox: {
                        show : true,
                        feature : {
                            mark : {show: true},
                            dataView : {show: true, readOnly: false},
                            magicType: {show: true, type: ['line', 'bar']},
                            restore : {show: true},
                            saveAsImage : {show: true}
                        }
                    },
                    calculable : true,
                    xAxis : [
                        {
                            type : 'value',
                            boundaryGap : [0, 0.01],
                            splitLine: {show:false}
                        }
                    ],
                    yAxis : [
                        {
                            type : 'category',
                            data : ['美林','泰诺林','小葵花','百服宁','好娃娃','托恩','安瑞克','瑞芝清','恬倩','韩美'],
                            splitLine: {show:false}

                        },
                    ],
                    series : [
                        {
                            name:'2013年',
                            type:'bar',
                            itemStyle : { normal: {label : {show: true, position: 'right'}}},
                            data:[36.5,19.5,25.6,10.6,19.2,1.4,5.9,3.0,9.0,3.0]
                        },
                        {
                            name:'2014年',
                            type:'bar',
                            itemStyle : { normal: {label : {show: true, position: 'right'}}},
                            data:[41.5,21.5,17.6,17.6,13.2,3.4,2.9,2.0,1.0,10.5]
                        }
                    ]
                };
                // 为echarts对象加载数据 
                myChart1.setOption(option1); 
                var option2 = {
                    tooltip : {
                        trigger: 'axis',
                        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                        }
                    },
                    legend: {
                        data:['出示广告前','出示广告后']
                    },
                    toolbox: {
                        show : true,
                        orient: 'vertical',
                        x: 'right',
                        y: 'center',
                        feature : {
                            mark : {show: true},
                            dataView : {show: true, readOnly: false},
                            magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                            restore : {show: true},
                            saveAsImage : {show: true}
                        }
                    },
                    calculable : true,
                    xAxis : [
                        {
                            type : 'category',
                            data : ['公交车厢内液晶电视','家中电视','互联网/网络'],
                            splitLine: {show:false}
                        }
                    ],
                    yAxis : [
                        {
                            type : 'value',
                            name : '%',
                            splitLine: {show:false}
                        }
                    ],
                    series : [
                        {
                            name:'出示广告前',
                            type:'bar',
                            itemStyle : { normal: {label : {show: true, position: 'top'}}},
                            data:[29.8, 27.8, 2.4]
                        },
                        {
                            name:'出示广告后',
                            type:'bar',
                            stack: '广告',
                            itemStyle : { normal: {label : {show: true, position: 'top'}}},                            
                            data:[56.6, 53.7, 3.4]
                        }
                       
                    ]
                };
                                    
                myChart2.setOption(option2); 
                var option3 = {
                    tooltip : {
                        trigger: 'axis',
                        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                     }

                    },
                    toolbox: {
                        show : true,
                        orient: 'vertical',
                        feature : {
                            mark : {show: true},
                            dataView : {show: true, readOnly: false},
                            magicType: {show: true, type: ['line', 'bar']},
                            restore : {show: true},
                            saveAsImage : {show: true}
                        }
                    },
                    calculable : true,
                    legend: {
                        data:['每天1次以下','每天1-2次','每天3-5次','每天9-10次','平均次数']
                        
                    },
                    xAxis : [
                        {
                            type : 'category',
                            data : ['Total','孩子4岁以内','孩子4-8岁以内','孩子9-12岁以内','20-30岁','31-35岁','36岁以上'],
                            splitLine: {show:false}
                        }
                    ],
                    yAxis : [
                        {
                            type : 'value',
                            name : '%',
                            axisLabel : {
                                formatter: '{value} %'
                            },
                            splitLine: {show:false}
                        },
                        {
                            type : 'value',
                            name : '次/天',
                            axisLabel : {
                                formatter: '{value} '
                            }
                        }
                    ],
                    series : [

                        {
                            name:'每天1次以下',
                            type:'bar',
                            data:[23.3,19,24,24.4,19.6,30,20]
                        },
                        {
                            name:'每天1-2次',
                            type:'bar',
                            data:[62.1,71.4,54,66.7,63,57.5,66.7]
                        },
                        {
                            name:'每天3-5次',
                            type:'bar',
                            data:[13.8,9.5,22,6.7,17.4,12.5,10]
                            
                        },
                        {
                            name:'每天9-10次',
                            type:'bar',
                            data:[0.9,0,0,2.2,0,0,3.3]
                        },
                        {
                            name:'平均次数',
                            type:'line',
                            yAxisIndex: 1,
                            itemStyle : { normal: {label : {show: true, position: 'top'}}},
                            data:[1.6,1.4,1.8,1.5,1.7,1.4,1.7]
                        }
                    ]
                };
                                    
                myChart3.setOption(option3); 
                var option4 = {
                    title : {
                        text: '  情节',
                        subtext: '100%',
                        x:'center'
                    },
                    tooltip : {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    legend: {
                        x : 'center',
                        y : 'bottom',
                        data:['妈妈转了几个圈变成了消防员','妈妈接到小宝发烧的电话','妈妈着急的样子','温度计的温度升高','美林的包装盒上有个灭火器','妈妈抱着孩子笑','妈妈和孩子玩的很开心','把火扑灭了']
                    },
                    toolbox: {
                        show : true,
                        feature : {
                            mark : {show: true},
                            dataView : {show: true, readOnly: false},
                            magicType : {
                                show: true, 
                                type: ['pie', 'funnel']
                            },
                            restore : {show: true},
                            saveAsImage : {show: true}
                        }
                    },
                    calculable : true,
                    series : [
                        {
                            name:'面积模式',
                            type:'pie',
                            radius : [20, 110],
                            center : ['50%', 200],
                            roseType : 'area',
                            width: '100%',       // for funnel
                            max: 40,            // for funnel
                            itemStyle : {
                                normal : {
                                    label : {
                                        show : false
                                    },
                                    labelLine : {
                                        show : false
                                    }
                                },
                                emphasis : {
                                    label : {
                                        show : true
                                    },
                                    labelLine : {
                                        show : true
                                    }
                                }
                            },
                            data:[
                                {value:67.2 ,name: '妈妈转了几个圈变成了消防员'},
                                {value:52.5 ,name: '妈妈接到小宝发烧的电话'},
                                {value:13.1 ,name: '妈妈着急的样子'},
                                {value:11.5 ,name: '温度计的温度升高'},
                                {value:8.2 ,name: '美林的包装盒上有个灭火器'},
                                {value:8.2 ,name: '妈妈抱着孩子笑'},
                                {value:6.6 ,name: '妈妈和孩子玩的很开心'},
                                {value:4.9 ,name: '把火扑灭了'}
                            ]
                        }
                    ]
                };
                 myChart4.setOption(option4);
                var option5 = {
                    title : {
                        text: '画外音',
                        subtext: '62.3%',
                        x:'center'
                    },
                    tooltip : {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    legend: {
                        x : 'center',
                        y : 'bottom',
                        data:['小宝发烧了','孩子发烧时妈妈都是消防员','用美林']
                    },
                    toolbox: {
                        show : true,
                        feature : {
                            mark : {show: true},
                            dataView : {show: true, readOnly: false},
                            magicType : {
                                show: true, 
                                type: ['pie', 'funnel']
                            },
                            restore : {show: true},
                            saveAsImage : {show: true}
                        }
                    },
                    calculable : true,
                    series : [
                        
                        {
                            name:'半径模式',
                            type:'pie',
                            radius : [30, 110],
                            center : ['50%', 200],
                            roseType : 'radius',
                            x: '50%',               // for funnel
                            max: 40,                // for funnel
                            sort : 'ascending',     // for funnel
                            data:[
                                {value:45.9, name:'小宝发烧了'},
                                {value:19.7, name:'孩子发烧时妈妈都是消防员'},
                                {value:8.2, name:'用美林'}
                            ]
                        }
                    ]
                };
       
                 myChart5.setOption(option5);

            }
        );