<#import "partials/header.ftlh" as main />

<@main.renderWith scripts=["https://code.jquery.com/jquery-3.1.1.min.js",
"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js",
"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"] styles=["https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"]>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.25/datatables.min.css"/>

    <script type="text/javascript" src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>

    <div class="container" style="font-family: 'Arial Black'">

        <div class="btn-group" role="group" aria-label="Basic example" style="margin-top: 5%">
            <#if user.role == "ROLE_ADMIN">
            <a href="/addUser" class="btn btn-danger ml-3">Add User</a>
            </#if>
            <button type="button" class="btn btn-secondary"data-toggle="modal" data-target="#addPost">ADD post</button>
        </div>

        <div style="margin-top: 5%">
            <table id="example" class="display" style="width:100%">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>User</th>
                    <th>Date</th>
                </tr>
                </thead>
            </table>
        </div>

    </div>

    <script>
        $(document).ready(function() {
            $('#example').DataTable( {
                ajax: {
                    url: "http://localhost:9889/table",
                    dataType: 'json',
                    dataSrc:""
                },
                    columns: [
                        {data: "id",
                            "render": function (data) {
                                return '<a href="/post/'+data+'">'+data+'</a>';
                            }},
                        {data: "name"},
                        {data: "description"},
                        {data: "user_id.name"},
                        {data: "date"}
                    ]

            } );
        } );
    </script>

    <div class="modal fade" id="addPost" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <form id="form-comment" action="/addPost" method="post">
                    <div class="form-group">
                        <#if _csrf??>
                            <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
                        </#if>
                        <input minlength="1" name="name" type="text" class="form-control  mb-3" placeholder="name">
                        <input minlength="1" name="description" type="text" class="form-control " placeholder="Добавьте описание">
                        <input id="user_id" class="field" hidden type="text" name="user_id" value="${user.id}">

                    </div>
                    <button type="submit" class="btn btn-secondary w-100">Добавить</button>
                </form>
            </div>
        </div>
    </div>
    </div>

    <div class="modal fade" id="addUser" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <form id="form-comment" action="/addUser" method="post">
                        <div class="form-group">
                            <#if _csrf??>
                                <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
                            </#if>
                            <input minlength="1" name="name" type="text" class="form-control mb-3" placeholder="name">
                            <input minlength="1" name="password" type="text" class="form-control mb-3" placeholder="password">
                        </div>
                        <button type="submit" class="btn btn-secondary w-100">Добавить</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

</@main.renderWith>