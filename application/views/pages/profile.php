<div class="row">
    <div class="col">
        <h3>Profile Saya</h3>
        <div class="box">
            <div class="box-body">
                <table id="dataTable" class="table display responsive nowrap" style="width:100%">
                    <thead class="bg-primary">
                        <tr>
                            <th>No Registrasi</th>
                            <th>Nama Siswa</th>
                            <th>Jenis Kelamin</th>
                            <th>Kelas</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        foreach ($siswa as $row) : ?>
                            <tr>
                                <td><?= $row['no_reg'] ?></td>
                                <td><?= $row['nama_siswa'] ?></td>
                                <td><?= ($row['jenis_kelamin'] == 'L') ? 'Laki-laki' : 'Perempuan' ?></td>
                                <td><?= $row['kelas'] ?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>