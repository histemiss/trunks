        // ·������
        require.config({
            paths: {
                echarts: './echarts/build/dist'
            }
        });
        
        // ʹ��
        require(
            [
                'echarts',
                'echarts/chart/force', // ʹ����״ͼ�ͼ���barģ�飬�������
                'echarts/chart/chord'
            ],
            function (ec) {
                // ����׼���õ�dom����ʼ��echartsͼ��
                var myChart = ec.init(document.getElementById('dp_map'));
                var option = {
                title : {
                    text: '���Žṹ�����ݴ�����',
                    x:'right',
                    y:'bottom'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: '{a} : {b}'
                },
                toolbox: {
                    show : true,
                    feature : {
                        restore : {show: true},
                        magicType: {show: true, type: ['force', 'chord']},
                        saveAsImage : {show: true}
                    }
                },

                series : [
                    {
                        type:'force',
                        name : "���Žṹ",
                        ribbonType: false,
                        categories : [
                            {
                                name: '����'
                            }
                        ],
                        itemStyle: {
                            normal: {
                                label: {
                                    show: true,
                                    textStyle: {
                                        color: '#333'
                                    }
                                },
                                nodeStyle : {
                                    brushType : 'both',
                                    borderColor : 'rgba(255,215,0,0.4)',
                                    borderWidth : 1
                                },
                                linkStyle: {
                                    type: 'curve'
                                }
                            },
                            emphasis: {
                                label: {
                                    show: false
                                    // textStyle: null      // Ĭ��ʹ��ȫ���ı���ʽ�����TEXTSTYLE
                                },
                                nodeStyle : {
                                    //r: 30
                                },
                                linkStyle : {}
                            }
                        },
                        useWorker: false,
                        minRadius : 15,
                        maxRadius : 25,
                        gravity: 1.1,
                        scaling: 1.1,
                        roam: 'move',
                        nodes:[
                            {category:0, name: '����', value : 20, label: '����\n���ܼࣩ',symbol: './images/fy.png',itemStyle:{normal:{label:{position:'right'}}}},
                            {category:1, name: '��־��',value : 15,symbol: './images/lzl.png',itemStyle:{normal:{label:{position:'right'}}}},
                            {category:1, name: '��С��',value : 10,symbol: './images/lxy.png',itemStyle:{normal:{label:{position:'right'}}}},
                            {category:2, name: '��ѩ',value : 10,symbol: './images/wx.png',itemStyle:{normal:{label:{position:'right'}}}},
                            {category:2, name: '��Ө��',value : 10,symbol: './images/cyz.png',itemStyle:{normal:{label:{position:'right'}}}},
                            {category:2, name: '����',value : 10,symbol: './images/zy.png',itemStyle:{normal:{label:{position:'right'}}}},
                            {category:2, name: '���',value : 10,symbol: './images/lh.png',itemStyle:{normal:{label:{position:'right'}}}},
                            {category:3, name: '֣�¸�',value : 5,symbol: './images/zdg.png',itemStyle:{normal:{label:{position:'right'}}}},
                            {category:3, name: '������',value : 5,symbol: './images/hcz.png',itemStyle:{normal:{label:{position:'right'}}}},
                            {category:3, name: '��԰��',value : 5,symbol: './images/wyj.png',itemStyle:{normal:{label:{position:'right'}}}},
                            {category:3, name: '���',value : 5,symbol: './images/lcd.png',itemStyle:{normal:{label:{position:'right'}}}},
                            {category:3, name: '���',value : 5,symbol: './images/lr.png',itemStyle:{normal:{label:{position:'right'}}}},
                            {category:3, name: '���',value : 5,symbol: './images/zh.png',itemStyle:{normal:{label:{position:'right'}}}},
                            {category:3, name: '����',value : 5,symbol: './images/wm.png',itemStyle:{normal:{label:{position:'right'}}}},
                            {category:3, name: '��ֵ',value : 5,symbol: './images/hz.png',itemStyle:{normal:{label:{position:'right'}}}},
                            {category:3, name: '�����',value : 5,symbol: './images/gyh.png',itemStyle:{normal:{label:{position:'right'}}}},
                            {category:3, name: '����',value : 5,symbol: './images/wh.png',itemStyle:{normal:{label:{position:'right'}}}},
                            {category:3, name: '���Ʒ�',value : 5,symbol: './images/lyf.png',itemStyle:{normal:{label:{position:'right'}}}},
                            {category:3, name: '����',value : 5,symbol: './images/xy.png',itemStyle:{normal:{label:{position:'right'}}}},
                            {category:3, name: 'ԬС��',value : 5,symbol: './images/yxh.png',itemStyle:{normal:{label:{position:'right'}}}},
                            {category:3, name: '����',value : 5,symbol: './images/zq.png',itemStyle:{normal:{label:{position:'right'}}}},
                            {category:3, name: '���',value:4,symbol: './images/lr1.png',itemStyle:{normal:{label:{position:'right'}}}},
                            {category:3, name: '��ѧ��',value:4,symbol: './images/zxm.png',itemStyle:{normal:{label:{position:'right'}}}},
                            {category:3, name: '����',value:4,symbol: './images/lr3.png',itemStyle:{normal:{label:{position:'right'}}}},
                            {category:3, name: '�½��',value:4,symbol: './images/cjn.png',itemStyle:{normal:{label:{position:'right'}}}},
                            {category:3, name: '���ľ�',value:4,symbol: './images/lr5.png',itemStyle:{normal:{label:{position:'right'}}}},
                            {category:3, name: '��۾�',value:4,symbol: './images/lhj.png',itemStyle:{normal:{label:{position:'right'}}}},
                            {category:3, name: '���Ƽ',value:4,symbol: './images/rcp.png',itemStyle:{normal:{label:{position:'right'}}}},
                            {category:3, name: '������',value:4,symbol: './images/xlj.png',itemStyle:{normal:{label:{position:'right'}}}},
                            {category:3, name: '����',value:4,symbol: './images/jy.png',itemStyle:{normal:{label:{position:'right'}}}},
                            {category:3, name: '������',value:4,symbol: './images/lr4.png',itemStyle:{normal:{label:{position:'right'}}}}

                        ],
                        links : [
                            {source : '��־��', target : '����', weight : 4, name: '����'},
                            {source : '��С��', target : '����', weight : 4, name: '����'},
                            {source : '��ѩ', target : '��־��', weight :3, name: '����'},
                            {source : '��Ө��', target : '��־��', weight : 3, name: '����'},
                            {source : '����', target : '��־��', weight : 3, name: '����'},
                            {source : '���', target : '��־��', weight : 3, name: '����'},
                            {source : '֣�¸�', target : '��ѩ', weight : 2},
                            {source : '��԰��', target : '��ѩ', weight : 2},
                            {source : '������', target : '��ѩ', weight : 2},
                            {source : '���', target : '��Ө��', weight : 2},
                            {source : '���', target : '��Ө��', weight : 2},
                            {source : '���', target : '��Ө��', weight : 2},
                            {source : '����', target : '����', weight : 2},
                            {source : '��ֵ', target : '����', weight : 2},
                            {source : '�����', target : '����', weight : 2},
                            {source : '����', target : '����', weight : 2},
                            {source : '���Ʒ�', target : '���', weight : 2},
                            {source : 'ԬС��', target : '���', weight : 2},
                            {source : '����', target : '���', weight : 2},
                            {source : '����', target : '��С��', weight : 2},
                            {source : '���',target : '��С��', weight : 2},
                            {source : '��ѧ��',target : '��С��', weight : 2},
                            {source : '����',target : '��С��', weight : 2},
                            {source : '�½��',target : '��С��', weight : 2},
                            {source : '���ľ�',target : '��С��', weight : 2},
                            {source : '��۾�',target : '��С��', weight : 2},
                            {source : '���Ƽ',target : '��С��', weight : 2},
                            {source : '������',target : '��С��', weight : 2},
                            {source : '����',target : '��С��', weight : 2},
                            {source : '������',target : '��С��', weight : 2}
                        ]
                    }
                ]
            };
            var ecConfig = require('echarts/config');
            function focus(param) {
                var data = param.data;
                var links = option.series[0].links;
                var nodes = option.series[0].nodes;
                if (
                    data.source !== undefined
                    && data.target !== undefined
                ) { //������Ǳ�
                    var sourceNode = nodes.filter(function (n) {return n.name == data.source})[0];
                    var targetNode = nodes.filter(function (n) {return n.name == data.target})[0];
                    console.log("ѡ���˱� " + sourceNode.name + ' -> ' + targetNode.name + ' (' + data.weight + ')');
                } else { // ������ǵ�
                    console.log("ѡ����" + data.name + '(' + data.value + ')');
                }
            }
            myChart.on(ecConfig.EVENT.CLICK, focus)

            myChart.on(ecConfig.EVENT.FORCE_LAYOUT_END, function () {
                console.log(myChart.chart.force.getPosition());
            });
            myChart.setOption(option); 


            }
        );
             