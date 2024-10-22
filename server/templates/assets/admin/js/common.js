// data function
function dataFunction(data) {
    data.page = data.start / data.length + 1;
    data.page_size = data.length;
    let ip = $('#ip-input').val();
    if (typeof ip !== undefined) {
        data.ip = ip;
    }
    let name = $('#name-input').val();
    if (typeof name !== undefined) {
        data.name = name;
    }
    let content = $('#content-input').val();
    if (typeof content !== undefined) {
        data.name = content;
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

