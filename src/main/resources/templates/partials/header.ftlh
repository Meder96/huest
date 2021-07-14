<#macro renderWith scripts=["https://code.jquery.com/jquery-3.1.1.min.js",
"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js",
"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"] styles=["https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"]>
    <!doctype html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>huest</title>
        <#list scripts as scriptSource>
            <script src="${scriptSource}"></script>
        </#list>
        <#list styles as styleSource>
            <link rel="stylesheet" href="${styleSource}">
        </#list>

    </head>
    <body style="height: 1000px; background-color: gray">

    <input type="checkbox" class="sidebar-checkbox" id="sidebar-checkbox">

    <div class="sidebar" id="sidebar" style="font-size: 20px">
        <div class="sidebar-item">
            <p>Find the things you love but forgot to save.</p>
        </div>

        <nav class="sidebar-nav">
            <a class="sidebar-nav-item" href="/">Home</a>
            <a class="sidebar-nav-item" href="/profile">Profile</a>

            <a class="sidebar-nav-item" href="/archieve">Archive</a>
            <#if user.role == "ROLE_ADMIN">
                <a class="sidebar-nav-item" href="/users">Users</a>
            </#if>
            <a class="sidebar-nav-item" href="/logout">Logout</a>

        </nav>

    </div>
    <div class="wrap">
    </div>

    <label for="sidebar-checkbox" class="sidebar-toggle"></label>
    <#nested>


    </body>
<script>
    (function(document) {
        var toggle = document.querySelector('.sidebar-toggle');
        var sidebar = document.querySelector('#sidebar');
        var checkbox = document.querySelector('#sidebar-checkbox');

        document.addEventListener('click', function(e) {
            var target = e.target;

            if(!checkbox.checked ||
                sidebar.contains(target) ||
                (target === checkbox || target === toggle)) return;

            checkbox.checked = false;
        }, false);
    })(document);


</script>
<style>
    html,
    body {
        overflow-x: hidden;
    }

    html {
        font-family: "PT Serif", Georgia, "Times New Roman", serif;
    }

    h1, h2, h3, h4, h5, h6 {
        font-family: "PT Sans", Helvetica, Arial, sans-serif;
        font-weight: 400;
        color: #313131;
        letter-spacing: -.025rem;
    }

    .wrap {
        position: relative;
        width: 100%;
    }

    .sidebar {
        position: fixed;
        top: 0;
        bottom: 0;
        left: -14rem;
        width: 14rem;
        visibility: hidden;
        overflow-y: auto;
        font-family: "PT Sans", Helvetica, Arial, sans-serif;
        font-size: 40px;
        color: rgba(255,255,255,.6);
        background-color: #202020;
        -webkit-transition: all .3s ease-in-out;
        transition: all .3s ease-in-out;
    }
    @media (min-width: 30em) {
        .sidebar {
            font-size: .75rem; /* 14px */
        }
    }

    .sidebar a {
        font-weight: normal;
        color: #fff;
    }
    .sidebar-item {
        padding: 1rem;
    }
    .sidebar-item p:last-child {
        margin-bottom: 0;
    }

    .sidebar-nav {
        border-bottom: 1px solid rgba(255,255,255,.1);
    }
    .sidebar-nav-item {
        display: block;
        padding: .5rem 1rem;
        border-top: 1px solid rgba(255,255,255,.1);
    }
    .sidebar-nav-item.active,
    a.sidebar-nav-item:hover,
    a.sidebar-nav-item:focus {
        text-decoration: none;
        background-color: rgba(255,255,255,.1);
        border-color: transparent;
    }

    @media (min-width: 48em) {
        .sidebar-item {
            padding: 1.5rem;
        }
        .sidebar-nav-item {
            padding-left:  1.5rem;
            padding-right: 1.5rem;
        }
    }

    .sidebar-checkbox {
        display: none;
    }

    .sidebar-toggle {
        position: absolute;
        top:  1rem;
        left: 1rem;
        display: block;
        width: 2.2rem;
        padding: .5rem .65rem;
        color: #505050;
        background-color: #fff;
        border-radius: 4px;
        cursor: pointer;
    }
    .sidebar-toggle:before {
        display: block;
        content: "";
        width: 100%;
        padding-bottom: .125rem;
        border-top: .375rem double;
        border-bottom: .125rem solid;

        /* Make the border inside the box */
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
    }

    .sidebar-toggle:active,
    #sidebar-checkbox:checked ~ .sidebar-toggle {
        color: #fff;
        background-color: #505050;
    }

    @media (min-width: 30.1em) {
        .sidebar-toggle {
            position: fixed;
            width: 2.25rem;
        }
        .sidebar-toggle:before {
            padding-bottom: .15rem;
            border-top-width: .45rem;
            border-bottom-width: .15rem;
        }
    }
    .wrap,
    .sidebar,
    .sidebar-toggle {
        -webkit-backface-visibility: hidden;
        -ms-backface-visibility: hidden;
        backface-visibility: hidden;
    }
    .wrap,
    .sidebar-toggle {
        -webkit-transition: -webkit-transform .3s ease-in-out;
        transition: transform .3s ease-in-out;
    }

    #sidebar-checkbox:checked + .sidebar {
        z-index: 10;
        visibility: visible;
    }
    #sidebar-checkbox:checked ~ .sidebar,
    #sidebar-checkbox:checked ~ .wrap,
    #sidebar-checkbox:checked ~ .sidebar-toggle {
        -webkit-transform: translateX(14rem);
        -ms-transform: translateX(14rem);
        transform: translateX(14rem);
    }
</style>
    </html>
</#macro>