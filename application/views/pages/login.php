
<div class="row" style="margin-top:50px">
    <div class="col-md-4"></div>
    <div class="col-md-4">
        <h3>Login Page</h3>
        <?= $this->session->flashdata('message'); ?>
        <div class="box">
            <div class="box-body">
                <form action="" method="POST">
                    <div class="form-group">
                        <label for="nama_siswa">No Lengkap</label>
                        <input type="text" name="nama_siswa" id="nama_siswa" min="0" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" name="password" id="password" min="0" class="form-control" required>
                    </div>
                    <button type="submit" name="submit" class="btn btn-primary pull-right btn-flat">Sign In</button>
                </form>
            </div>
        </div>
    </div>
    <div class="col-md-4"></div>
</div>