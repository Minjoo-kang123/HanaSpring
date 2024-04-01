<%--
  Created by IntelliJ IDEA.
  User: 하나로H017
  Date: 2024-04-01
  Time: 오전 9:15
  To change this template use File | Settings | File Templates.
--%><%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
    #container{
        width: 400px;
        height: 500px;
        border: 1px solid blueviolet;
    }
</style>
<script>

    let chart1 = {
        init:function (){
            Highcharts.chart('container', {
            chart: {
                type: 'spline'
            },
            title: {
                text: 'Monthly Average Temperature'
            },
            subtitle: {
                text: 'Source: ' +
                    '<a href="https://en.wikipedia.org/wiki/List_of_cities_by_average_temperature" ' +
                    'target="_blank">Wikipedia.com</a>'
            },
            xAxis: {
                categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                accessibility: {
                    description: 'Months of the year'
                }
            },
            yAxis: {
                title: {
                    text: 'Temperature'
                },
                labels: {
                    format: '{value}°'
                }
            },
            tooltip: {
                crosshairs: true,
                shared: true
            },
            plotOptions: {
                spline: {
                    marker: {
                        radius: 4,
                        lineColor: '#666666',
                        lineWidth: 1
                    }
                }
            },
            series: [{
                name: 'Tokyo',
                marker: {
                    symbol: 'square'
                },
                data: [5.2, 5.7, 8.7, 13.9, 18.2, 21.4, 25.0, {
                    y: 26.4,
                    marker: {
                        symbol: 'url(https://www.highcharts.com/samples/graphics/sun.png)'
                    },
                    accessibility: {
                        description: 'Sunny symbol, this is the warmest point in the chart.'
                    }
                }, 22.8, 17.5, 12.1, 7.6]

            }, {
                name: 'Bergen',
                marker: {
                    symbol: 'diamond'
                },
                data: [{
                    y: 1.5,
                    marker: {
                        symbol: 'url(https://www.highcharts.com/samples/graphics/snow.png)'
                    },
                    accessibility: {
                        description: 'Snowy symbol, this is the coldest point in the chart.'
                    }
                }, 1.6, 3.3, 5.9, 10.5, 13.5, 14.5, 14.4, 11.5, 8.7, 4.7, 2.6]
            }, {
                name: 'selout',
                marker: {
                    symbol: 'diamond'
                },
                data: [{
                    y: 1.5,
                    marker: {
                        symbol: 'url(https://www.highcharts.com/samples/graphics/snow.png)'
                    },
                    accessibility: {
                        description: 'Snowy symbol, this is the coldest point in the chart.'
                    }
                }, -1.6, 13.3, 25.9, 15.5, 23.5, 34.5, 24.4, 12.5, 23.7, 12.7, 3.6]
            }]
        });

        }
    }
    $(function(){
        chart1.init();
    })
</script>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div id="container"></div>
</body>
</html>
