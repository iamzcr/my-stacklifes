// data function
function dataFunction(data) {
    data.page = data.start / data.length + 1;
    data.page_size = data.length;
}

// data filter function
function dataFilterFunction(data) {
    var json = jQuery.parseJSON(data);
    json.recordsTotal = json.data.total;
    json.recordsFiltered = json.data.total;
    json.data = json.data.list;
    return JSON.stringify(json);
}

function submitDelForm() {
    let id = $(this).data("id");
    let url = $(this).data("url");
    if (!id || !url) {
        Swal.fire("fail");
    }
    $.ajax({
        type: "POST",
        url: url, // 提交表单数据的URL
        data: {id: id},
        success: function (response) {
            if (response.code !== 1) {
                Swal.fire(response.msg);
            }
            Swal.fire("success");
        },
        error: function (error) {
            Swal.fire(error);
        }
    });
}