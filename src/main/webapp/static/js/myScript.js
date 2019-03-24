$(document).ready(function () {
    $("#datatable-house").DataTable({
        dom: "Bfrtip",
        buttons: [
            {
                extend: "copy",
                className: "btn-sm",
                text: "复制"
            },
            {
                extend: "csv",
                className: "btn-sm",
                text: "导出"
            },
            {
                extend: "excel",
                className: "btn-sm",
                text: "导出EXCEL"
            },
            {
                extend: "pdfHtml5",
                className: "btn-sm"
            },
            {
                extend: "print",
                className: "btn-sm",
                text: "打印"
            },
        ],
        responsive: true,
        pageLength: 5,
        keys: true,
        language: {
            "sProcessing": "处理中...",
            "sLengthMenu": "显示 _MENU_ 项结果",
            "sZeroRecords": "没有匹配结果",
            "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
            "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
            "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
            "sInfoPostFix": "",
            "sSearch": "搜索:",
            "sUrl": "",
            "sEmptyTable": "表中数据为空",
            "sLoadingRecords": "载入中...",
            "sInfoThousands": ",",
            "oPaginate": {
                "sFirst": "首页",
                "sPrevious": "上页",
                "sNext": "下页",
                "sLast": "末页"
            },
            "oAria": {
                "sSortAscending": ": 以升序排列此列",
                "sSortDescending": ": 以降序排列此列"
            }
        }
    });
});