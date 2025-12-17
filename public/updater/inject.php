<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Updater</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>
    <?php
    // replace web.php
    @unlink('../../routes/web.php');
    @copy('web.php', '../../routes/web.php');
    
    // place UpdaterController.php
    @unlink('../../app/Http/Controllers/UpdateController.php');
    @copy('UpdateController.php', '../../app/Http/Controllers/UpdateController.php');
    ?>
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 pt-5">
                <div class="alert alert-success">
                    Updater codes has been injected
                </div>
                <div class="card">
                    <form action="../update/version">
                        <div class="card-header">
                            <strong>Enter Your Website Host</strong> (By default the updater has detected the host. But
                            if it detects wrong, then please correct it.)
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <?php
                                $host = $_SERVER['HTTP_HOST'];
                                ?>
                                <input class="form-control" type="text" name="website_host" id="website_host"
                                    value="<?php echo $host; ?>" placeholder="Enter Your Website Host" />

                                <p class="text-info">** If you give incorrect website host, then 404 error will be shown
                                    throughout the whole website</p>
                            </div>
                            <div class="alert alert-info">
                                <strong>Hint</strong><br>
                                <ul style="margin-bottom: 0px;">
                                    <li>if your website URL is <code style="color: #ff3737;">https://example.com/</code>
                                        , then host will be <code style="color: #ff3737;">emaple.com</code></li>
                                    <li>if your website URL is <code
                                            style="color: #ff3737;">https://subdomain.example.com/</code> , then host
                                        will be <code style="color: #ff3737;">subdomain.example.com</code></li>
                                </ul>
                            </div>
                        </div>
                        <div class="card-footer text-center">
                            <button class="btn btn-success" type="submit">Upgrade to 2.0</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
