<% --< script src = "../myContent/JS/html2canvas.js" ></script >
    <script type="text/javascript">
        $(document).ready(function () {
            $("#btnPrint").click(function () {
                html2canvas(document.querySelector("#divGrid")).then(canvas => {
                    document.getElementById("divPage").setAttribute("hidden", "");
                    document.body.appendChild(canvas);
                    window.print();
                    $('canvas').remove();
                    document.getElementById("divPage").removeAttribute("hidden");

                });
            });
    });
    </script>--%>