var stats = {
    type: "GROUP",
name: "All Requests",
path: "",
pathFormatted: "group_missing-name-b06d1",
stats: {
    "name": "All Requests",
    "numberOfRequests": {
        "total": "311",
        "ok": "309",
        "ko": "2"
    },
    "minResponseTime": {
        "total": "739",
        "ok": "739",
        "ko": "777"
    },
    "maxResponseTime": {
        "total": "3793",
        "ok": "3793",
        "ko": "858"
    },
    "meanResponseTime": {
        "total": "880",
        "ok": "880",
        "ko": "818"
    },
    "standardDeviation": {
        "total": "280",
        "ok": "281",
        "ko": "41"
    },
    "percentiles1": {
        "total": "840",
        "ok": "840",
        "ko": "818"
    },
    "percentiles2": {
        "total": "872",
        "ok": "872",
        "ko": "838"
    },
    "percentiles3": {
        "total": "1025",
        "ok": "1025",
        "ko": "854"
    },
    "percentiles4": {
        "total": "2691",
        "ok": "2708",
        "ko": "857"
    },
    "group1": {
    "name": "t < 800 ms",
    "htmlName": "t < 800 ms",
    "count": 96,
    "percentage": 31
},
    "group2": {
    "name": "800 ms <= t < 1200 ms",
    "htmlName": "t >= 800 ms <br> t < 1200 ms",
    "count": 205,
    "percentage": 66
},
    "group3": {
    "name": "t >= 1200 ms",
    "htmlName": "t >= 1200 ms",
    "count": 8,
    "percentage": 3
},
    "group4": {
    "name": "failed",
    "htmlName": "failed",
    "count": 2,
    "percentage": 1
},
    "meanNumberOfRequestsPerSecond": {
        "total": "2.392",
        "ok": "2.377",
        "ko": "0.015"
    }
},
contents: {
"req_post--api-users-7a661": {
        type: "REQUEST",
        name: "POST /api/users/login",
path: "POST /api/users/login",
pathFormatted: "req_post--api-users-7a661",
stats: {
    "name": "POST /api/users/login",
    "numberOfRequests": {
        "total": "1",
        "ok": "1",
        "ko": "0"
    },
    "minResponseTime": {
        "total": "967",
        "ok": "967",
        "ko": "-"
    },
    "maxResponseTime": {
        "total": "967",
        "ok": "967",
        "ko": "-"
    },
    "meanResponseTime": {
        "total": "967",
        "ok": "967",
        "ko": "-"
    },
    "standardDeviation": {
        "total": "0",
        "ok": "0",
        "ko": "-"
    },
    "percentiles1": {
        "total": "967",
        "ok": "967",
        "ko": "-"
    },
    "percentiles2": {
        "total": "967",
        "ok": "967",
        "ko": "-"
    },
    "percentiles3": {
        "total": "967",
        "ok": "967",
        "ko": "-"
    },
    "percentiles4": {
        "total": "967",
        "ok": "967",
        "ko": "-"
    },
    "group1": {
    "name": "t < 800 ms",
    "htmlName": "t < 800 ms",
    "count": 0,
    "percentage": 0
},
    "group2": {
    "name": "800 ms <= t < 1200 ms",
    "htmlName": "t >= 800 ms <br> t < 1200 ms",
    "count": 1,
    "percentage": 100
},
    "group3": {
    "name": "t >= 1200 ms",
    "htmlName": "t >= 1200 ms",
    "count": 0,
    "percentage": 0
},
    "group4": {
    "name": "failed",
    "htmlName": "failed",
    "count": 0,
    "percentage": 0
},
    "meanNumberOfRequestsPerSecond": {
        "total": "0.008",
        "ok": "0.008",
        "ko": "-"
    }
}
    },"req_post--api-artic-043e6": {
        type: "REQUEST",
        name: "POST /api/articles",
path: "POST /api/articles",
pathFormatted: "req_post--api-artic-043e6",
stats: {
    "name": "POST /api/articles",
    "numberOfRequests": {
        "total": "156",
        "ok": "154",
        "ko": "2"
    },
    "minResponseTime": {
        "total": "742",
        "ok": "742",
        "ko": "777"
    },
    "maxResponseTime": {
        "total": "3793",
        "ok": "3793",
        "ko": "858"
    },
    "meanResponseTime": {
        "total": "913",
        "ok": "915",
        "ko": "818"
    },
    "standardDeviation": {
        "total": "350",
        "ok": "352",
        "ko": "41"
    },
    "percentiles1": {
        "total": "847",
        "ok": "847",
        "ko": "818"
    },
    "percentiles2": {
        "total": "879",
        "ok": "879",
        "ko": "838"
    },
    "percentiles3": {
        "total": "1116",
        "ok": "1116",
        "ko": "854"
    },
    "percentiles4": {
        "total": "2807",
        "ok": "2808",
        "ko": "857"
    },
    "group1": {
    "name": "t < 800 ms",
    "htmlName": "t < 800 ms",
    "count": 40,
    "percentage": 26
},
    "group2": {
    "name": "800 ms <= t < 1200 ms",
    "htmlName": "t >= 800 ms <br> t < 1200 ms",
    "count": 108,
    "percentage": 69
},
    "group3": {
    "name": "t >= 1200 ms",
    "htmlName": "t >= 1200 ms",
    "count": 6,
    "percentage": 4
},
    "group4": {
    "name": "failed",
    "htmlName": "failed",
    "count": 2,
    "percentage": 1
},
    "meanNumberOfRequestsPerSecond": {
        "total": "1.2",
        "ok": "1.185",
        "ko": "0.015"
    }
}
    },"req_delete--api-art-533c7": {
        type: "REQUEST",
        name: "DELETE /api/articles/{articleId}",
path: "DELETE /api/articles/{articleId}",
pathFormatted: "req_delete--api-art-533c7",
stats: {
    "name": "DELETE /api/articles/{articleId}",
    "numberOfRequests": {
        "total": "154",
        "ok": "154",
        "ko": "0"
    },
    "minResponseTime": {
        "total": "739",
        "ok": "739",
        "ko": "-"
    },
    "maxResponseTime": {
        "total": "2921",
        "ok": "2921",
        "ko": "-"
    },
    "meanResponseTime": {
        "total": "845",
        "ok": "845",
        "ko": "-"
    },
    "standardDeviation": {
        "total": "179",
        "ok": "179",
        "ko": "-"
    },
    "percentiles1": {
        "total": "822",
        "ok": "822",
        "ko": "-"
    },
    "percentiles2": {
        "total": "864",
        "ok": "864",
        "ko": "-"
    },
    "percentiles3": {
        "total": "944",
        "ok": "944",
        "ko": "-"
    },
    "percentiles4": {
        "total": "1125",
        "ok": "1125",
        "ko": "-"
    },
    "group1": {
    "name": "t < 800 ms",
    "htmlName": "t < 800 ms",
    "count": 56,
    "percentage": 36
},
    "group2": {
    "name": "800 ms <= t < 1200 ms",
    "htmlName": "t >= 800 ms <br> t < 1200 ms",
    "count": 96,
    "percentage": 62
},
    "group3": {
    "name": "t >= 1200 ms",
    "htmlName": "t >= 1200 ms",
    "count": 2,
    "percentage": 1
},
    "group4": {
    "name": "failed",
    "htmlName": "failed",
    "count": 0,
    "percentage": 0
},
    "meanNumberOfRequestsPerSecond": {
        "total": "1.185",
        "ok": "1.185",
        "ko": "-"
    }
}
    }
}

}

function fillStats(stat){
    $("#numberOfRequests").append(stat.numberOfRequests.total);
    $("#numberOfRequestsOK").append(stat.numberOfRequests.ok);
    $("#numberOfRequestsKO").append(stat.numberOfRequests.ko);

    $("#minResponseTime").append(stat.minResponseTime.total);
    $("#minResponseTimeOK").append(stat.minResponseTime.ok);
    $("#minResponseTimeKO").append(stat.minResponseTime.ko);

    $("#maxResponseTime").append(stat.maxResponseTime.total);
    $("#maxResponseTimeOK").append(stat.maxResponseTime.ok);
    $("#maxResponseTimeKO").append(stat.maxResponseTime.ko);

    $("#meanResponseTime").append(stat.meanResponseTime.total);
    $("#meanResponseTimeOK").append(stat.meanResponseTime.ok);
    $("#meanResponseTimeKO").append(stat.meanResponseTime.ko);

    $("#standardDeviation").append(stat.standardDeviation.total);
    $("#standardDeviationOK").append(stat.standardDeviation.ok);
    $("#standardDeviationKO").append(stat.standardDeviation.ko);

    $("#percentiles1").append(stat.percentiles1.total);
    $("#percentiles1OK").append(stat.percentiles1.ok);
    $("#percentiles1KO").append(stat.percentiles1.ko);

    $("#percentiles2").append(stat.percentiles2.total);
    $("#percentiles2OK").append(stat.percentiles2.ok);
    $("#percentiles2KO").append(stat.percentiles2.ko);

    $("#percentiles3").append(stat.percentiles3.total);
    $("#percentiles3OK").append(stat.percentiles3.ok);
    $("#percentiles3KO").append(stat.percentiles3.ko);

    $("#percentiles4").append(stat.percentiles4.total);
    $("#percentiles4OK").append(stat.percentiles4.ok);
    $("#percentiles4KO").append(stat.percentiles4.ko);

    $("#meanNumberOfRequestsPerSecond").append(stat.meanNumberOfRequestsPerSecond.total);
    $("#meanNumberOfRequestsPerSecondOK").append(stat.meanNumberOfRequestsPerSecond.ok);
    $("#meanNumberOfRequestsPerSecondKO").append(stat.meanNumberOfRequestsPerSecond.ko);
}
