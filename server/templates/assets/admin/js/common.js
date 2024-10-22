// data function
function dataFunction(data) {
    data.page = data.start / data.length + 1;
    data.page_size = data.length;
    let ip = $('#ip-input').val(); // 从输入框获取IP地址
    if (typeof ip !== undefined) {
        data.ip = ip;
    }
}

// data filter function
function dataFilterFunction(data) {
    var json = jQuery.parseJSON(data);
    json.recordsTotal = json.data.total;
    json.recordsFiltered = json.data.total;
    json.data = json.data.list;
    return JSON.stringify(json);
}

