var options = {
    legend: {
        show: false
    },
    series: {
        lines: {
            show: true
        },
        points: {
            show: true
        }
    },
    grid: {
        hoverable: true,
        clickable: true
    },
    yaxis: {
        show: true,
		tickDecimals: 0,
		min: 0
    },
    xaxis: {
        show: true,
		tickDecimals: 0,
		mode: "time",
		timeformat: "%d %b"
		
    },
    zoom: {
        interactive: true
    },
    selection: {
        mode: "xy"
    }
};


var overviewOptions = {
    legend: {
        show: false
    },
    series: {
        lines: {
            show: true,
            lineWidth: 1
        },
        shadowSize: 0
    },
    xaxis: {
        show: true,
        ticks: 4
    },
    yaxis: {
        ticks: 3
    },
    grid: {
        color: "#999"
    },
    selection: {
        mode: "xy"
    }
};
