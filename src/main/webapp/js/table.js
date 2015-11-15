        // ·������
        require.config({
            paths: {
                echarts: 'http://echarts.baidu.com/build/dist'
            }
        });
        
        // ʹ��
        require(
            [
                'echarts',
                'echarts/chart/bar', // ʹ����״ͼ�ͼ���barģ�飬�������
                'echarts/chart/line',
                'echarts/chart/pie'
            ],
            function (ec) {
                // ����׼���õ�dom����ʼ��echartsͼ��
                var myChart1 = ec.init(document.getElementById('main1')); 
                var myChart2 = ec.init(document.getElementById('main2')); 
                var myChart3 = ec.init(document.getElementById('main3')); 
                var myChart4 = ec.init(document.getElementById('main4')); 
                var myChart5 = ec.init(document.getElementById('main5')); 
                
                var option1 = {
                    title : {
                        text: '�����ʾǰ����Ʒ�ƹ�浽��״��',
                        subtext: ''
                    },
                    tooltip : {
                        trigger: 'axis'
                    },
                    legend: {
                        data:['2013��', '2014��']
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
                            data : ['����','̩ŵ��','С����','�ٷ���','������','�ж�','�����','��֥��','��ٻ','����'],
                            splitLine: {show:false}

                        },
                    ],
                    series : [
                        {
                            name:'2013��',
                            type:'bar',
                            itemStyle : { normal: {label : {show: true, position: 'right'}}},
                            data:[36.5,19.5,25.6,10.6,19.2,1.4,5.9,3.0,9.0,3.0]
                        },
                        {
                            name:'2014��',
                            type:'bar',
                            itemStyle : { normal: {label : {show: true, position: 'right'}}},
                            data:[41.5,21.5,17.6,17.6,13.2,3.4,2.9,2.0,1.0,10.5]
                        }
                    ]
                };
                // Ϊecharts����������� 
                myChart1.setOption(option1); 
                var option2 = {
                    tooltip : {
                        trigger: 'axis',
                        axisPointer : {            // ������ָʾ���������ᴥ����Ч
                            type : 'shadow'        // Ĭ��Ϊֱ�ߣ���ѡΪ��'line' | 'shadow'
                        }
                    },
                    legend: {
                        data:['��ʾ���ǰ','��ʾ����']
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
                            data : ['����������Һ������','���е���','������/����'],
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
                            name:'��ʾ���ǰ',
                            type:'bar',
                            itemStyle : { normal: {label : {show: true, position: 'top'}}},
                            data:[29.8, 27.8, 2.4]
                        },
                        {
                            name:'��ʾ����',
                            type:'bar',
                            stack: '���',
                            itemStyle : { normal: {label : {show: true, position: 'top'}}},                            
                            data:[56.6, 53.7, 3.4]
                        }
                       
                    ]
                };
                                    
                myChart2.setOption(option2); 
                var option3 = {
                    tooltip : {
                        trigger: 'axis',
                        axisPointer : {            // ������ָʾ���������ᴥ����Ч
                            type : 'shadow'        // Ĭ��Ϊֱ�ߣ���ѡΪ��'line' | 'shadow'
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
                        data:['ÿ��1������','ÿ��1-2��','ÿ��3-5��','ÿ��9-10��','ƽ������']
                        
                    },
                    xAxis : [
                        {
                            type : 'category',
                            data : ['Total','����4������','����4-8������','����9-12������','20-30��','31-35��','36������'],
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
                            name : '��/��',
                            axisLabel : {
                                formatter: '{value} '
                            }
                        }
                    ],
                    series : [

                        {
                            name:'ÿ��1������',
                            type:'bar',
                            data:[23.3,19,24,24.4,19.6,30,20]
                        },
                        {
                            name:'ÿ��1-2��',
                            type:'bar',
                            data:[62.1,71.4,54,66.7,63,57.5,66.7]
                        },
                        {
                            name:'ÿ��3-5��',
                            type:'bar',
                            data:[13.8,9.5,22,6.7,17.4,12.5,10]
                            
                        },
                        {
                            name:'ÿ��9-10��',
                            type:'bar',
                            data:[0.9,0,0,2.2,0,0,3.3]
                        },
                        {
                            name:'ƽ������',
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
                        text: '  ���',
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
                        data:['����ת�˼���Ȧ���������Ա','����ӵ�С�����յĵ绰','�����ż�������','�¶ȼƵ��¶�����','���ֵİ�װ�����и������','���豧�ź���Ц','����ͺ�����ĺܿ���','�ѻ�������']
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
                            name:'���ģʽ',
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
                                {value:67.2 ,name: '����ת�˼���Ȧ���������Ա'},
                                {value:52.5 ,name: '����ӵ�С�����յĵ绰'},
                                {value:13.1 ,name: '�����ż�������'},
                                {value:11.5 ,name: '�¶ȼƵ��¶�����'},
                                {value:8.2 ,name: '���ֵİ�װ�����и������'},
                                {value:8.2 ,name: '���豧�ź���Ц'},
                                {value:6.6 ,name: '����ͺ�����ĺܿ���'},
                                {value:4.9 ,name: '�ѻ�������'}
                            ]
                        }
                    ]
                };
                 myChart4.setOption(option4);
                var option5 = {
                    title : {
                        text: '������',
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
                        data:['С��������','���ӷ���ʱ���趼������Ա','������']
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
                            name:'�뾶ģʽ',
                            type:'pie',
                            radius : [30, 110],
                            center : ['50%', 200],
                            roseType : 'radius',
                            x: '50%',               // for funnel
                            max: 40,                // for funnel
                            sort : 'ascending',     // for funnel
                            data:[
                                {value:45.9, name:'С��������'},
                                {value:19.7, name:'���ӷ���ʱ���趼������Ա'},
                                {value:8.2, name:'������'}
                            ]
                        }
                    ]
                };
       
                 myChart5.setOption(option5);

            }
        );