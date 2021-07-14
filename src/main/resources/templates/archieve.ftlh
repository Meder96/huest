<#import "partials/header.ftlh" as main />

<@main.renderWith scripts=["https://code.jquery.com/jquery-3.3.1.slim.min.js","https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js","https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"] styles=["https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"]>

    <div class="container">
        <input type="search" id="search-input" class="form-control " placeholder="Search"/>
        <button class="btn btn-outline-light ml-1" id="btn-search" onclick="search()">Поиск</button>
    </div>

    <div class="mx-auto mt-3 w-50">
        <#list post as post>
            <a class="link" href="/post/${post.id}"><p>${post.name} ${post.description} - ${post.description} - ${post.user_id.name}</p></a>
        </#list>
    </div>

    <script>
        function search() {
            let value = document.getElementById("search-input").value;
            if (value.length === 0) {
                return;
            } else {
                window.location.href = '/find/' + value;
            }
        }
    </script>

</@main.renderWith>