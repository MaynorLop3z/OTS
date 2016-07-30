<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Print Preview</title>
<!--        <script>
            function createFile() {
            var fso = new new ActiveXObject("Scripting.FileSystemObject");
            var s = fso.OpenTextFile("C:\test.txt", 8,true,0);
            s.writeline("HI");
            s.writeline("Bye");
            s.writeline("-----------------------------");
            s.Close();
            console.log("CREADO");
            };
            createFile();
        </script>-->
    </head>
    <body>
        <pre>
            <?php
        echo  $comanda;
        ?>
        </pre>
        <script>
            window.print();   
        </script>
    </body>
</html>
