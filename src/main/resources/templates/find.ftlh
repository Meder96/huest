<#import "partials/header.ftlh" as main />

<@main.renderWith scripts=["https://code.jquery.com/jquery-3.3.1.slim.min.js","https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js","https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"] styles=["https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"]>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.25/datatables.min.css"/>

    <script type="text/javascript" src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>

    <div class="mx-auto mt-3 w-50">
        <#list post as post>
            <a class="link" href="/post/${post.id}"><p>${post.name} ${post.description} - ${post.description}</p></a>
        </#list>
    </div>

</@main.renderWith>