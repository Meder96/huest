<#import "partials/header.ftlh" as main />

<@main.renderWith scripts=["https://code.jquery.com/jquery-3.3.1.slim.min.js","https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js","https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"] styles=["https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"]>
    <div class="container" style="width: 30%; margin-top: 5%;">
        <div>
            <form action="/addUser" method="post">
                <div class="form-group">
                    <#if _csrf??>
                        <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
                    </#if>
                    <input minlength="1" name="name" type="text" class="form-control mb-3" placeholder="name">
                    <input minlength="1" name="password" type="text" class="form-control mb-3" placeholder="password">
                    <#if errors?has_content>
                        <p style="color: crimson">${errors}</p>
                    </#if>

                </div>
                <button type="submit" class="btn btn-secondary w-100">Добавить</button>
            </form>
        </div>
    </div>


</@main.renderWith>