$(document).ready(function () {
    console.log('test');
    $('#issue_team').live('change', function () {
        var teamId = $(this).val(),
            url = '/teams/' + teamId + '/team_sprints.json';

        $.get(url, function (data) {
            var select = $('#issue_team_sprint');

            select.empty();

            $.each(data.team_sprints, function(index, option) {
                $option = $("<option></option>")
                    .attr("value", option.id)
                    .text(option.name);
                select.append($option);
            });
        });
    });
});
