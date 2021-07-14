<#import "partials/header.ftlh" as main />
<@main.renderWith scripts=["https://code.jquery.com/jquery-3.1.1.min.js",
"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js",
"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"] styles=["https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"]>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.25/datatables.min.css"/>

    <script type="text/javascript" src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
    <script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>

    <div class="container" style="font-family: 'Arial Black'">
        <div style="margin-top: 5%">
            <table id="example" class="display" style="width:100%">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Role</th>
                </tr>
                </thead>
            </table>
        </div>

        <div id="chartContainer" style="height: 500px; width: 100%; margin-top: 3%;"></div>
    </div>

    <script>
        $(document).ready(function() {
            $('#example').DataTable( {
                ajax: {
                    url: "http://localhost:9889/usersTable",
                    dataType: 'json',
                    dataSrc:""
                },
                columns: [
                    {data: "id"},
                    {data: "name"},
                    {data: "role"}
                ]
            } );
        } );

        window.onload = function () {

            var options = {
                title: {
                    text: "Desktop OS Market Share in 2017"
                },
                subtitles: [{
                    text: "As of November, 2017"
                }],
                animationEnabled: true,
                data: [{
                    type: "pie",
                    startAngle: 40,
                    toolTipContent: "<b>{label}</b>: {y}%",
                    showInLegend: "true",
                    legendText: "{label}",
                    indexLabelFontSize: 16,
                    indexLabel: "{label} - {y}%",
                    dataPoints: [
                        { y: 48.36, label: "Windows 7" },
                        { y: 26.85, label: "Windows 10" },
                        { y: 1.49, label: "Windows 8" },
                        { y: 6.98, label: "Windows XP" },
                        { y: 6.53, label: "Windows 8.1" },
                        { y: 2.45, label: "Linux" },
                        { y: 3.32, label: "Mac OS X 10.12" },
                        { y: 4.03, label: "Others" }
                    ]
                }]
            };
            $("#chartContainer").CanvasJSChart(options);

        }
    </script>

</@main.renderWith>