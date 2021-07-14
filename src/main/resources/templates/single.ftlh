<#import "partials/header.ftlh" as main />

<@main.renderWith scripts=["https://code.jquery.com/jquery-3.3.1.slim.min.js","https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js","https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"] styles=["https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"]>

    <div class="mx-auto mt-3 w-50">

        <#if user.id == post.user_id.id>
        <p><button class="btn btn-secondary" type="button" data-toggle="modal" data-target="#editPost">UPDATE POST</button></p>
        </#if>

        <h1>${post.name}</h1>

        <form id="form-comment" action="/addComment" method="post">
            <div class="form-group">
                <#if _csrf??>
                    <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
                </#if>


                <input type="hidden" name="post_id" value="${post.id}"/>
                <input minlength="1" name="text" type="text" class="form-control" placeholder="text">
                <input id="user_id" class="field" hidden type="text" name="user_id" value="${user.id}">
            </div>
            <button type="submit" class="btn btn-secondary w-100">Добавить</button>
        </form>
        <#list comment as comment>
            <p>${comment.text} -${comment.user_id.name}</p>
        </#list>


    </div>

    <div class="modal fade" id="editPost" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <form id="form-comment" action="/post/edit" method="post">
                        <div class="form-group">
                            <#if _csrf??>
                                <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
                            </#if>
                            <input minlength="1" name="name" type="text" class="form-control  mb-3" value="${post.name}">
                            <input minlength="1" name="description" type="text" class="form-control  mb-3" value="${post.description}">
                            <input id="user_id" class="field" hidden type="text" name="user_id" value="${user.id}">
                            <input class="field" hidden type="text" name="id" value="${post.id}">

                        </div>
                        <button type="submit" class="btn btn-secondary w-100">UPDATE</button>
                    </form>
                </div>
            </div>
        </div>
    </div>




</@main.renderWith>