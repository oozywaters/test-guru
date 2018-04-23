function sortTable(table, sortFn){
    if (!table) {
        return;
    }
    var rows = table.find('tbody').find('tr');

    rows.sort(function(a, b) {

        var val1 = $(a).children('td').eq(0).text().toUpperCase();
        var val2 = $(b).children('td').eq(0).text().toUpperCase();

        if (!sortFn) {
            return 0;
        }

        return sortFn(val1, val2);
    });

    $.each(rows, function(index, row) {
        table.children('tbody').append(row);
    });
}

function sortAsc(val1, val2) {
    if(val1 < val2) {
        return -1;
    }

    if(val1 > val2) {
        return 1;
    }
    return 0;
}

function sortDesc(val1, val2) {
    if(val1 < val2) {
        return 1;
    }

    if(val1 > val2) {
        return -1;
    }
    return 0;
}

document.addEventListener('turbolinks:load', function() {
    var table = $('.table');
    var control = $('.sort-by-title');
    var arrowUp = control.find('.octicon-arrow-up');
    var arrowDown = control.find('.octicon-arrow-down');
    control.click(function() {
        var isAsc = arrowUp.hasClass('hide');
        var sortFn = isAsc ? sortDesc : sortAsc;
        arrowUp.toggleClass('hide');
        arrowDown.toggleClass('hide');
        sortTable(table, sortFn);
    });
});
