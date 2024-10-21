// data function
function dataFunction(d) {
    d.page = d.start / d.length + 1;
    d.page_size = d.length;
}

// data filter function
function dataFilterFunction(data) {
    var json = jQuery.parseJSON(data);
    json.recordsTotal = json.data.total;
    json.recordsFiltered = json.data.total;
    json.data = json.data.list;
    return JSON.stringify(json);
}